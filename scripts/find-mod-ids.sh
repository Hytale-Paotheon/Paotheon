#!/bin/bash

# --- Configuration ---
HYTALE_GAME_ID=70216
QUIET_MODE=0
MAX_RETRIES=3
RETRY_WAIT=10

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

log_info()  { echo "[find-mod-ids] $*" >&2; }
log_warn()  { echo "[find-mod-ids] [WARN] $*" >&2; }
log_error() { echo "[find-mod-ids] [ERROR] $*" >&2; }

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
  log_error "Este script requer 'curl' e 'jq'. Por favor, instale-os."
  exit 1
fi

if [ -z "${CURSEFORGE_API_KEY:-}" ]; then
  log_error "A variável de ambiente CURSEFORGE_API_KEY não está definida."
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
    [[ -n "$line" ]] && MOD_NAMES+=("$line")
  done < /dev/stdin
fi

if [ ${#MOD_NAMES[@]} -eq 0 ]; then
  if [ ${QUIET_MODE} -eq 0 ]; then
    log_info "Nenhum mod fornecido para busca."
  fi
  exit 0
fi

TOTAL=${#MOD_NAMES[@]}
log_info "Iniciando busca para ${TOTAL} mods (Game ID: ${HYTALE_GAME_ID})..."

if [ ${QUIET_MODE} -eq 0 ]; then
  echo "---"
fi

ID_LIST=""
FOUND_COUNT=0
FAILED_MODS=()

for original_mod_name in "${MOD_NAMES[@]}"; do
  # Extrai a parte do nome após o último ':'
  # Ex: "Buuz135:AdminUI" se torna "AdminUI"
  mod_name_to_search="${original_mod_name##*:}"

  attempt=0
  success=0

  while [ $attempt -lt $MAX_RETRIES ]; do
    attempt=$((attempt + 1))

    # Captura body e HTTP status code juntos, separados por newline
    http_response=$(curl -s -w "\n%{http_code}" -G \
      -H "x-api-key: ${CURSEFORGE_API_KEY}" \
      "https://api.curseforge.com/v1/mods/search" \
      --data-urlencode "gameId=${HYTALE_GAME_ID}" \
      --data-urlencode "searchFilter=${mod_name_to_search}" \
      --data-urlencode "sortField=2" \
      --data-urlencode "sortOrder=desc" 2>/dev/null)

    http_code=$(echo "$http_response" | tail -1)
    response_body=$(echo "$http_response" | head -n -1)

    # Trata rate limit com retry
    if [ "$http_code" = "429" ]; then
      log_warn "'${original_mod_name}' - Rate limit (429), aguardando ${RETRY_WAIT}s (tentativa ${attempt}/${MAX_RETRIES})..."
      sleep $RETRY_WAIT
      continue
    fi

    # Trata outros erros HTTP
    if [ "$http_code" != "200" ]; then
      log_error "'${original_mod_name}' - API retornou HTTP ${http_code}"
      FAILED_MODS+=("${original_mod_name}:HTTP_${http_code}")
      success=1 # Não vai tentar novamente para erros não-429
      break
    fi

    # Parseia o ID do projeto da resposta JSON
    project_id=$(echo "$response_body" | jq -r '.data[0].id // empty' 2>/dev/null)

    if [ -z "$project_id" ]; then
      log_warn "'${original_mod_name}' -> sem resultados na API"
      FAILED_MODS+=("${original_mod_name}:NOT_FOUND")
      success=1
      break
    fi

    # Sucesso
    if [ ${QUIET_MODE} -eq 0 ]; then
      project_name=$(echo "$response_body" | jq -r '.data[0].name // "?"' 2>/dev/null)
      project_slug=$(echo "$response_body" | jq -r '.data[0].slug // "?"' 2>/dev/null)
      printf "Busca: '%-30s' -> '%-30s' | ID: %-10s | Slug: %s\n" \
        "${original_mod_name}" "${project_name}" "${project_id}" "${project_slug}"
    fi

    ID_LIST="${ID_LIST}${project_id} "
    FOUND_COUNT=$((FOUND_COUNT + 1))
    success=1
    break
  done

  if [ $success -eq 0 ]; then
    log_error "'${original_mod_name}' - falha após ${MAX_RETRIES} tentativas"
    FAILED_MODS+=("${original_mod_name}:RETRY_EXHAUSTED")
  fi
done

# --- Resumo ---
FAIL_COUNT=${#FAILED_MODS[@]}
log_info "Concluído: ${FOUND_COUNT} IDs encontrados, ${FAIL_COUNT} falhas de ${TOTAL} mods."

if [ $FAIL_COUNT -gt 0 ]; then
  log_warn "Mods sem ID encontrado:"
  for entry in "${FAILED_MODS[@]}"; do
    log_warn "  - ${entry}"
  done
fi

if [ ${QUIET_MODE} -eq 1 ]; then
  echo "${ID_LIST% }"
fi

# Falha se nenhum ID foi encontrado mas havia mods para buscar
if [ $FOUND_COUNT -eq 0 ] && [ $TOTAL -gt 0 ]; then
  log_error "Nenhum Project ID encontrado. Verifique a API key e o Game ID."
  exit 1
fi
