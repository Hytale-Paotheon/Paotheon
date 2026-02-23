# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

A Docker-based Hytale dedicated server setup. The upstream image (`hybrowse/hytale-server`) is forked/extended here with custom scripts and a CI/CD pipeline that manages mods via CurseForge and reads configuration from Google Sheets.

## Common commands

All local tasks run via [Task](https://taskfile.dev):

```sh
task build                  # Build Docker image locally
task build:amd64            # Build for linux/amd64 (required on Apple Silicon)
task test                   # Run container validation tests against built image
task verify                 # build + test + k8s manifest validation

task dev:up                 # Start container (manual /data provisioning)
task dev:up:auto            # Start with HYTALE_AUTO_DOWNLOAD=true
task dev:up:curseforge      # Start with CurseForge mod management
task dev:logs               # Follow container logs
task dev:attach             # Attach to server console
task dev:exec               # Shell into running container
task dev:down               # Stop and remove container
```

On the VPS, deployment is done via GitHub Actions (push to `main` or manual dispatch via Actions tab).

## Architecture

### Startup flow

`entrypoint.sh` orchestrates everything in order:
1. Validates `/data` volume is writable
2. Persists machine-id for hardware UUID stability
3. Calls `auto-download.sh` if `HYTALE_AUTO_DOWNLOAD=true`
4. Calls `curseforge-mods.sh` if `HYTALE_CURSEFORGE_MODS` is set
5. Calls `prestart-downloads.sh` for any `HYTALE_*_DOWNLOAD_URLS`
6. Calls `config-patch.sh` (`HYTALE_CONFIG_*` env vars → `config.json`)
7. Calls `cfg-interpolate.sh` (`CFG_*` env vars → any JSON config files)
8. Calls `session-token-broker.sh` if auth mode is enabled
9. Launches the Java server

### Mod management flow

```
Google Sheets (tab "Mods")
  └── deploy.yml: curl CSV → awk by column name "Project ID"/"Habilitado"
        └── MOD_PROJECT_IDS written to .env on VPS
              └── docker-compose passes HYTALE_CURSEFORGE_MODS to container
                    └── curseforge-mods.sh: downloads/updates mods via CurseForge API
                          └── POST status to Apps Script webhook (sheets-webapp.js)
                                └── Writes to "Status" tab in the same spreadsheet
```

State is tracked in `/data/.hytale-curseforge-mods/manifest.json`. Mod files are symlinked into `/data/server/mods-curseforge/`.

### Configuration layering

Two separate systems handle config, applied in order:
- `HYTALE_CONFIG_*` → `config-patch.sh` → writes known keys to `config.json`
- `CFG_*` → `cfg-interpolate.sh` → substitutes into any JSON file under `/data`

### Secret handling

Secrets never live in the repo. The deploy workflow writes them to `.env` on the VPS at deploy time:

```
CURSEFORGE_API_KEY   → HYTALE_CURSEFORGE_API_KEY  (container)
MOD_PROJECT_IDS      → HYTALE_CURSEFORGE_MODS      (container)
SHEETS_WEBHOOK_URL   → HYTALE_CURSEFORGE_SHEETS_URL (container)
SHEETS_TOKEN         → HYTALE_CURSEFORGE_SHEETS_TOKEN (container)
```

The CurseForge API key starts with `$2a$10$` — dollar signs must be escaped as `$$` in docker-compose `environment:` blocks but must NOT be escaped when written via `printf '%s'` to `.env`.

### `/data` volume layout

```
/data/
├── server/HytaleServer.jar
├── Assets.zip
├── server/mods-curseforge/     # CurseForge managed mods (symlinks)
├── server/mods/                # Manually placed mods
├── .hytale-curseforge-mods/    # manifest.json + downloaded files
│   ├── manifest.json
│   ├── downloads/
│   └── files/
├── .hytale-downloader/         # Auto-download state
├── .machine-id                 # Persistent hardware UUID
└── curseforge-mod-failures.log # Fallback log when Sheets is unavailable
```

## CurseForge API

- Current key tier: **Community** — allows `/v1/games`, `/v1/mods/{id}`, `/v1/mods/{id}/files` but **blocks** `/v1/mods/search` (returns 403)
- `find-mod-ids.sh` requires Developer tier; it's a utility script, not part of the normal flow
- Hytale game ID on CurseForge: **70216**

## Google Sheets integration

- **Reading** (deploy-time, no auth): public CSV export URL with `SHEET_ID` and `SHEET_GID` hardcoded in `deploy.yml`
- **Writing** (runtime, token auth): `curseforge-mods.sh` POSTs to the Apps Script URL with `--location-trusted` to follow redirects while keeping POST method
- `sheets-webapp.js` is the Apps Script code — it must be manually deployed as a Web App in the spreadsheet's Apps Script editor
- `SECRET_TOKEN` in Apps Script Properties must match `SHEETS_TOKEN` GitHub secret

## CI notes

- `ci/test-image.sh` spins up a mock CurseForge API (Python HTTP server) and runs integration tests against the built image
- On Apple Silicon, use `task build:amd64` — the Hytale server binary is x86_64 only
- The workflow deploys whichever branch triggered it (`github.ref_name`), not hardcoded `main`
