#!/bin/bash
set -euo pipefail

# --- Prerequisite Checks ---
if ! command -v jq &> /dev/null; then
  echo "ERRO: Este script requer 'jq'. Por favor, instale-o." >&2
  exit 1
fi
if [ ! -x scripts/find-mod-ids.sh ]; then
  echo "ERRO: Este script requer 'scripts/find-mod-ids.sh' executável." >&2
  echo "Certifique-se de estar na raiz do projeto e que o script exista e seja executável (chmod +x scripts/find-mod-ids.sh)." >&2
  exit 1
fi
if [ -z "${CURSEFORGE_API_KEY:-}" ]; then
  echo "ERRO: A variável de ambiente CURSEFORGE_API_KEY não está definida." >&2
  echo "Uso: CURSEFORGE_API_KEY='\$2a\$10\$...' ./scripts/local-find-mod-ids-from-config.sh" >&2
  exit 1
fi
if [ ! -f mods/config.json ]; then
  echo "ERRO: Arquivo 'mods/config.json' não encontrado na raiz do projeto." >&2
  echo "Certifique-se de estar na raiz do projeto e que o arquivo exista." >&2
  exit 1
fi

echo "Extraindo nomes de mods de 'mods/config.json'..."
MOD_NAMES=$(jq -r '.Mods | keys[]' mods/config.json)

if [ -z "$MOD_NAMES" ]; then
  echo "Nenhum mod encontrado em 'mods/config.json'." >&2
  exit 0
fi

echo "---"
echo "Buscando Project IDs para os seguintes mods:"
echo "$MOD_NAMES"
echo "---"

# Passa os nomes para find-mod-ids.sh e captura a saída
MOD_PROJECT_IDS=$(CURSEFORGE_API_KEY="${CURSEFORGE_API_KEY}" scripts/find-mod-ids.sh -q <<< "$MOD_NAMES")

echo "---"
echo "IDs de Projeto Encontrados (para HYTALE_CURSEFORGE_MODS):"
echo "$MOD_PROJECT_IDS"
