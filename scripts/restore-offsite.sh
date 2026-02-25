#!/bin/sh
set -eu

log() {
  printf '%s\n' "$*" >&2
}

# Config
BACKUP_REPO_URL="${BACKUP_REPO_URL:-}"
GITHUB_TOKEN="${GITHUB_TOKEN:-}"
DATA_DIR="${DATA_DIR:-/data}"
RESTORE_TEMP_DIR="/tmp/hytale-offsite-restore"

if [ -z "$BACKUP_REPO_URL" ]; then
  log "ERROR: BACKUP_REPO_URL is not set."
  exit 1
fi

if [ -z "$GITHUB_TOKEN" ]; then
  log "ERROR: GITHUB_TOKEN is not set."
  exit 1
fi

log "--- Starting offsite restore ---"

log "[1/3] Cloning backup repository..."
rm -rf "${RESTORE_TEMP_DIR}"
REPO_AUTH_URL=$(echo "${BACKUP_REPO_URL}" | sed -e "s|https://|https://${GITHUB_TOKEN}@|")
git clone --depth 1 "${REPO_AUTH_URL}" "${RESTORE_TEMP_DIR}"

# Find latest backup file
LATEST_BACKUP=$(ls -t "${RESTORE_TEMP_DIR}"/hytale_data_*.tar.gz 2>/dev/null | head -n 1)

if [ -z "$LATEST_BACKUP" ]; then
  log "ERROR: No backups found in the repository."
  exit 1
fi

BACKUP_BASE=$(basename "$LATEST_BACKUP")
log "[2/3] Found latest backup: ${BACKUP_BASE}"

# Safety backup of current universe if it exists
if [ -d "${DATA_DIR}/universe" ]; then
  SAFE_NAME="universe.old_$(date +%Y%m%d_%H%M%S)"
  log "Warning: Current universe exists. Backing it up locally to ${SAFE_NAME}..."
  mv "${DATA_DIR}/universe" "${DATA_DIR}/${SAFE_NAME}"
fi

log "[3/3] Extracting backup to ${DATA_DIR}..."
tar -xzf "$LATEST_BACKUP" -C "${DATA_DIR}"

log "--- Restore completed successfully! ---"
rm -rf "${RESTORE_TEMP_DIR}"
