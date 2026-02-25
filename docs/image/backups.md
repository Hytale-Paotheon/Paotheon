# Backups

## Overview

The Hytale dedicated server supports an internal backup mechanism.
This image exposes it via environment variables and recommends storing backups on a **separate volume**.

Until we have more operational experience with the official server, treat backup outputs as **opaque artifacts**.

## Enable backups (Docker Compose)

```yaml
services:
  hytale:
    image: hybrowse/hytale-server:latest
    ports:
      - "5520:5520/udp"
    volumes:
      - ./data:/data
      - ./backups:/backups
    environment:
      HYTALE_ENABLE_BACKUP: "true"
      HYTALE_BACKUP_DIR: "/backups"
      HYTALE_BACKUP_FREQUENCY_MINUTES: "60"
    restart: unless-stopped
```

## Recommended storage patterns

- Keep `/data` (server state) and backups on different volumes/paths.
- Consider syncing `./backups` to offsite storage (object storage, rsync to another host, etc.).

## Notes

- If you change backup paths, ensure the container user can write to them.
- Backup settings map directly to the server flags (`--backup`, `--backup-dir`, `--backup-frequency`).
- If `HYTALE_ENABLE_BACKUP=true` and `HYTALE_BACKUP_DIR` is not set, this image defaults the backup directory to `/data/backups`.

## Offsite backups (Private Repository)

For extra safety, you can back up sensitive data (`universe/`, `config.json`) to a private GitHub repository.

### Setup

1. Create a **Private GitHub Repository**.
2. Generate a **Personal Access Token (PAT)** with `repo` permissions.
3. Configure environment variables (or pass them to `task`):
   - `BACKUP_REPO_URL`: The HTTPS URL of your private backup repo.
   - `GITHUB_TOKEN`: Your Personal Access Token.

### Usage

To perform a backup:

```bash
task backup:offsite BACKUP_REPO_URL="https://github.com/USER/REPO.git" GITHUB_TOKEN="ghp_xxx"
```

To restore the latest backup:

```bash
task restore:offsite BACKUP_REPO_URL="https://github.com/USER/REPO.git" GITHUB_TOKEN="ghp_xxx"
```

> [!CAUTION]
> The restore process will replace your current `universe/` directory. It creates a local safety backup as `universe.old_<timestamp>` before overwriting.

## Related docs

- [`quickstart.md`](quickstart.md)
- [`configuration.md`](configuration.md)
