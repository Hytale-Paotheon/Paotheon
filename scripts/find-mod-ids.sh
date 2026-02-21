#!/bin/bash
set -euo pipefail

# --- Configuration ---
HYTALE_GAME_ID=70216
QUIET_MODE=0

# --- Function Definitions ---
print_usage() {
  echo "Uso: $0 [OPÇÕES] [\"Nome do Mod 1\" \"outro-mod\"...]" >&2
  echo "  Busca Project IDs de mods no CurseForge." >&2
  echo "" >&2
  echo "  Se nenhum nome de mod for fornecido como argumento, tentará ler da entrada padrão (stdin)." >&2
  echo "" >&2
  echo "Opções:" >&2
  echo "  -q, --quiet    Gera uma saída limpa apenas com os IDs separados por espaço, para uso em scripts." >&2
  echo "  -h, --help     Mostra esta ajuda." >&2
  echo "" >&2
  echo "Pré-requisitos:" >&2
  echo "  - 'curl' e 'jq' devem estar instalados." >&2
  echo "  - A variável de ambiente CURSEFORGE_API_KEY deve estar definida." >&2
}

# --- Argument Parsing ---
MOD_NAMES=()
while [[ $# -gt 0 ]]; do
  case $1 in
    -q|--quiet)
      QUIET_MODE=1
      shift
      ;;
    -h|--help)
      print_usage
      exit 0
      ;;
    *)
      MOD_NAMES+=("$1")
      shift
      ;;
  esac
done

# --- Prerequisite Checks ---
if ! command -v curl &> /dev/null || ! command -v jq &> /dev/null; then
  echo "ERRO: Este script requer 'curl' e 'jq'. Por favor, instale-os." >&2
  exit 1
fi

if [ -z "${CURSEFORGE_API_KEY:-}" ]; then
  echo "ERRO: A variável de ambiente CURSEFORGE_API_KEY não está definida." >&2
  print_usage
  exit 1
fi

# --- Main Logic ---
# Se nenhum nome de mod foi passado via argumento, lê do stdin.
if [ ${#MOD_NAMES[@]} -eq 0 ]; then
  if [ -t 0 ]; then # Verifica se stdin é um terminal (interativo)
      if [ ${QUIET_MODE} -eq 0 ]; then
        print_usage
      fi
      exit 0
  fi
  # Lê do pipe
  while IFS= read -r line; do
    # Ignora linhas vazias
    [[ -n "$line" ]] && MOD_NAMES+=("$line")
  done < /dev/stdin
fi

if [ ${#MOD_NAMES[@]} -eq 0 ]; then
  if [ ${QUIET_MODE} -eq 0 ]; then
    echo "Nenhum mod fornecido para busca." >&2
  fi
  exit 0
fi


if [ ${QUIET_MODE} -eq 0 ]; then
  echo "Buscando Project IDs para Hytale (Game ID: ${HYTALE_GAME_ID})..."
  echo "---"
fi

ID_LIST=""
for original_mod_name in "${MOD_NAMES[@]}"; do
  # Extrai a parte do nome após o último ':'
  # Ex: "Buuz135:AdminUI" se torna "AdminUI"
  # Se não houver ':', usa o nome original
  mod_name_to_search="${original_mod_name##*:}"

  # Usa --data-urlencode para que o curl codifique o nome do mod automaticamente
  response=$(curl -s -G -H "x-api-key: ${CURSEFORGE_API_KEY}" \
    "https://api.curseforge.com/v1/mods/search" \
    --data-urlencode "gameId=${HYTALE_GAME_ID}" \
    --data-urlencode "searchFilter=${mod_name_to_search}" \
    --data-urlencode "sortField=2" \
    --data-urlencode "sortOrder=desc")

  project_id=$(echo "$response" | jq -r '.data[0].id')

  if [ ${QUIET_MODE} -eq 0 ]; then
    project_name=$(echo "$response" | jq -r '.data[0].name')
    project_slug=$(echo "$response" | jq -r '.data[0].slug')

    if [ -n "$project_id" ] && [ "$project_id" != "null" ]; then
      printf "Busca: '%-25s' -> Encontrado: '%-30s' | Project ID: %-10s | Slug: %s\n" \
        "${original_mod_name}" "${project_name}" "${project_id}" "${project_slug}"
    else
      printf "Busca: '%-25s' -> NENHUM RESULTADO ENCONTRADO\n" "${original_mod_name}"
    fi
  else
    if [ -n "$project_id" ] && [ "$project_id" != "null" ]; then
      ID_LIST="${ID_LIST}${project_id} "
    fi
  fi
done

if [ ${QUIET_MODE} -eq 1 ]; then
  # Remove o espaço final e imprime a lista de IDs
  echo "${ID_LIST% }"
fi
