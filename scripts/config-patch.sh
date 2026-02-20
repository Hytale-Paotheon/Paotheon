#!/bin/sh
set -eu

log() {
  printf '%s\n' "$*" >&2
}

DATA_DIR="${DATA_DIR:-/data}"
SERVER_DIR="${SERVER_DIR:-/data/server}"
CONFIG_PATH="${HYTALE_CONFIG_PATH:-${SERVER_DIR}/config.json}"
DEFAULT_CONFIG_PATH="${HYTALE_DEFAULT_CONFIG_PATH:-/usr/share/hytale/default-config.json}"

ensure_config_exists() {
  if [ -f "${CONFIG_PATH}" ]; then
    return 0
  fi

  mkdir -p "$(dirname "${CONFIG_PATH}")"

  if [ -f "${DEFAULT_CONFIG_PATH}" ]; then
    cp "${DEFAULT_CONFIG_PATH}" "${CONFIG_PATH}"
    log "Config patch: created missing config from default template (${CONFIG_PATH})"
    return 0
  fi

  log "WARNING: Default config template missing; not pre-creating ${CONFIG_PATH} (server will create it on first start)"
  return 1
}

validate_int_env() {
  var_name="$1"
  value="$2"

  case "${value}" in
    ''|*[!0-9]*)
      log "ERROR: ${var_name} must be an integer (got '${value}')"
      return 1
      ;;
    *)
      return 0
      ;;
  esac
}

read_patch_json() {
  if [ -n "${HYTALE_CONFIG_PATCH_JSON:-}" ] && [ -n "${HYTALE_CONFIG_PATCH_JSON_SRC:-}" ]; then
    log "ERROR: Set either HYTALE_CONFIG_PATCH_JSON or HYTALE_CONFIG_PATCH_JSON_SRC, not both"
    exit 1
  fi

  if [ -n "${HYTALE_CONFIG_PATCH_JSON_SRC:-}" ]; then
    if [ ! -f "${HYTALE_CONFIG_PATCH_JSON_SRC}" ]; then
      log "ERROR: HYTALE_CONFIG_PATCH_JSON_SRC does not exist: ${HYTALE_CONFIG_PATCH_JSON_SRC}"
      exit 1
    fi
    PATCH_JSON="$(cat "${HYTALE_CONFIG_PATCH_JSON_SRC}")"
    PATCH_SET=1
    return 0
  fi

  if [ -n "${HYTALE_CONFIG_PATCH_JSON:-}" ]; then
    PATCH_JSON="${HYTALE_CONFIG_PATCH_JSON}"
    PATCH_SET=1
    return 0
  fi

  PATCH_JSON='{}'
  PATCH_SET=0
}

config_ready=1
if ! ensure_config_exists; then
  config_ready=0
fi

set_server_name=0
server_name=""
if [ "${HYTALE_CONFIG_SERVER_NAME+x}" = "x" ]; then
  set_server_name=1
  server_name="${HYTALE_CONFIG_SERVER_NAME}"
fi

set_motd=0
motd=""
if [ "${HYTALE_CONFIG_MOTD+x}" = "x" ]; then
  set_motd=1
  motd="${HYTALE_CONFIG_MOTD}"
fi

set_password=0
password=""
if [ "${HYTALE_CONFIG_PASSWORD+x}" = "x" ]; then
  set_password=1
  password="${HYTALE_CONFIG_PASSWORD}"
fi

set_max_players=0
max_players="0"
if [ "${HYTALE_CONFIG_MAX_PLAYERS+x}" = "x" ]; then
  validate_int_env "HYTALE_CONFIG_MAX_PLAYERS" "${HYTALE_CONFIG_MAX_PLAYERS}"
  set_max_players=1
  max_players="${HYTALE_CONFIG_MAX_PLAYERS}"
fi

set_max_view_radius=0
max_view_radius="0"
if [ "${HYTALE_CONFIG_MAX_VIEW_RADIUS+x}" = "x" ]; then
  validate_int_env "HYTALE_CONFIG_MAX_VIEW_RADIUS" "${HYTALE_CONFIG_MAX_VIEW_RADIUS}"
  set_max_view_radius=1
  max_view_radius="${HYTALE_CONFIG_MAX_VIEW_RADIUS}"
fi

set_default_world=0
default_world=""
if [ "${HYTALE_CONFIG_DEFAULT_WORLD+x}" = "x" ]; then
  set_default_world=1
  default_world="${HYTALE_CONFIG_DEFAULT_WORLD}"
fi

set_default_game_mode=0
default_game_mode=""
if [ "${HYTALE_CONFIG_DEFAULT_GAME_MODE+x}" = "x" ]; then
  set_default_game_mode=1
  default_game_mode="${HYTALE_CONFIG_DEFAULT_GAME_MODE}"
fi

read_patch_json

if [ "${PATCH_SET}" -eq 1 ]; then
  if ! printf '%s' "${PATCH_JSON}" | jq -e 'type == "object"' >/dev/null 2>&1; then
    log "ERROR: HYTALE_CONFIG_PATCH_JSON must be a JSON object"
    exit 1
  fi
fi

if [ "${set_server_name}" -eq 0 ] \
  && [ "${set_motd}" -eq 0 ] \
  && [ "${set_password}" -eq 0 ] \
  && [ "${set_max_players}" -eq 0 ] \
  && [ "${set_max_view_radius}" -eq 0 ] \
  && [ "${set_default_world}" -eq 0 ] \
  && [ "${set_default_game_mode}" -eq 0 ] \
  && [ "${PATCH_SET}" -eq 0 ]; then
  exit 0
fi

if [ "${config_ready}" -eq 0 ]; then
  log "WARNING: ${CONFIG_PATH} is missing and no default template is available; HYTALE_CONFIG_* overrides are skipped for this startup"
  exit 0
fi

if ! jq -e 'type == "object"' "${CONFIG_PATH}" >/dev/null 2>&1; then
  log "ERROR: ${CONFIG_PATH} is not valid JSON object"
  exit 1
fi

tmp="${CONFIG_PATH}.tmp.$$"
rm -f "${tmp}" 2>/dev/null || true

if jq -e \
  --argjson set_server_name "${set_server_name}" \
  --arg server_name "${server_name}" \
  --argjson set_motd "${set_motd}" \
  --arg motd "${motd}" \
  --argjson set_password "${set_password}" \
  --arg password "${password}" \
  --argjson set_max_players "${set_max_players}" \
  --argjson max_players "${max_players}" \
  --argjson set_max_view_radius "${set_max_view_radius}" \
  --argjson max_view_radius "${max_view_radius}" \
  --argjson set_default_world "${set_default_world}" \
  --arg default_world "${default_world}" \
  --argjson set_default_game_mode "${set_default_game_mode}" \
  --arg default_game_mode "${default_game_mode}" \
  --argjson patch_set "${PATCH_SET}" \
  --argjson patch "${PATCH_JSON}" \
  '
  def deepmerge(a; b):
    if (a | type) == "object" and (b | type) == "object" then
      reduce (b | keys_unsorted[]) as $key
        (a; .[$key] = if has($key) then deepmerge(.[$key]; b[$key]) else b[$key] end)
    else
      b
    end;

  .
  | (if $patch_set == 1 then deepmerge(.; $patch) else . end)
  | (if $set_server_name == 1 then .ServerName = $server_name else . end)
  | (if $set_motd == 1 then .MOTD = $motd else . end)
  | (if $set_password == 1 then .Password = $password else . end)
  | (if $set_max_players == 1 then .MaxPlayers = $max_players else . end)
  | (if $set_max_view_radius == 1 then .MaxViewRadius = $max_view_radius else . end)
  | (if $set_default_world == 1 then .Defaults = ((.Defaults // {}) + {World: $default_world}) else . end)
  | (if $set_default_game_mode == 1 then .Defaults = ((.Defaults // {}) + {GameMode: $default_game_mode}) else . end)
  ' "${CONFIG_PATH}" >"${tmp}" 2>/dev/null; then
  if cmp -s "${CONFIG_PATH}" "${tmp}" 2>/dev/null; then
    rm -f "${tmp}" 2>/dev/null || true
    exit 0
  fi
  mv "${tmp}" "${CONFIG_PATH}"
else
  rm -f "${tmp}" 2>/dev/null || true
  log "ERROR: Failed to patch ${CONFIG_PATH}"
  exit 1
fi

log "Config patch: updated ${CONFIG_PATH} using HYTALE_CONFIG_* overrides"
