#!/bin/sh
set -eu

log() {
  printf '%s\n' "$*" >&2
}

# Config
BACKUP_REPO_URL="${BACKUP_REPO_URL:-}"
GITHUB_TOKEN="${GITHUB_TOKEN:-}"
DATA_DIR="${DATA_DIR:-/data}"
BACKUP_TEMP_DIR="/tmp/hytale-offsite-backup"

if [ -z "$BACKUP_REPO_URL" ]; then
  log "ERROR: BACKUP_REPO_URL is not set."
  exit 1
fi

if [ -z "$GITHUB_TOKEN" ]; then
  log "ERROR: GITHUB_TOKEN is not set."
  exit 1
fi

# Prepare backup name
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_FILENAME="hytale_data_${TIMESTAMP}.tar.gz"

log "--- Starting offsite backup: ${BACKUP_FILENAME} ---"

# Create archive of sensitive data
log "[1/4] Archiving sensitive data from ${DATA_DIR}..."
# We include universe (world), and main configs
# Using a temp file first
tar -czf "/tmp/${BACKUP_FILENAME}" -C "${DATA_DIR}" universe config.json permissions.json 2>/dev/null || {
  log "Note: Some config files missing, backing up universe only."
  tar -czf "/tmp/${BACKUP_FILENAME}" -C "${DATA_DIR}" universe
}

# Clone backup repo
log "[2/4] Cloning backup repository..."
rm -rf "${BACKUP_TEMP_DIR}"
REPO_AUTH_URL=$(echo "${BACKUP_REPO_URL}" | sed -e "s|https://|https://${GITHUB_TOKEN}@|")
git clone --depth 1 "${REPO_AUTH_URL}" "${BACKUP_TEMP_DIR}"

# Move backup to repo
mv "/tmp/${BACKUP_FILENAME}" "${BACKUP_TEMP_DIR}/"

# Commit and Push
log "[3/4] Committing backup to repository..."
cd "${BACKUP_TEMP_DIR}"
git config user.name "Hytale Backup Bot"
git config user.email "backup@hytale.local"
git add "${BACKUP_FILENAME}"
git commit -m "Backup ${TIMESTAMP}"

log "[4/4] Pushing to remote..."
# Try to detect default branch
BRANCH=$(git remote show origin | grep 'HEAD branch' | cut -d' ' -f5)
BRANCH=${BRANCH:-main}
git push origin "$BRANCH"

log "--- Backup completed successfully! ---"
rm -rf "${BACKUP_TEMP_DIR}"
