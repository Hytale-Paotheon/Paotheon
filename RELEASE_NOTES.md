# Release Notes

## v0.1

### Overview

This is the first production-grade release of the **Hytale dedicated server Docker image**.

- Image (Docker Hub): `hybrowse/hytale-server`
- Mirror (GHCR): `ghcr.io/hybrowse/hytale-server`

### Highlights

- Runs as **non-root** by default.
- Clear startup validation and actionable error messages.
- Optional **auto-download** of official server files and `Assets.zip` via the official Hytale Downloader.
- Optional **auto-update** mode (runs the downloader on container start when enabled).
- Credentials and tokens are treated as **secrets**.

### Configuration defaults (important)

- Java runtime: **Eclipse Temurin 25 JRE**.
- `HYTALE_AUTH_MODE=authenticated` by default.
- Auto-download is **off by default**; enable explicitly with `HYTALE_AUTO_DOWNLOAD=true`.
- When `HYTALE_AUTO_DOWNLOAD=true`, auto-update is **on by default** (`HYTALE_AUTO_UPDATE=true`).
- AOT is **opt-in** and controlled via `ENABLE_AOT`.

### Authentication (operators)

In authenticated mode, the server must obtain server session tokens before it can complete the authenticated handshake with clients.

- Use the server console:

```text
/auth login device
```

If multiple profiles are listed:

```text
/auth select <number>
```

For provider-grade automation, see `docs/hytale/server-provider-auth.md` (tokens via `HYTALE_SERVER_SESSION_TOKEN` / `HYTALE_SERVER_IDENTITY_TOKEN`).

### Known limitations

- Auto-download currently supports `linux/amd64` only (the official downloader archive does not include `linux/arm64`).
- AOT caches are architecture-specific (`linux/amd64` vs `linux/arm64`) and must match the JVM build. Use `ENABLE_AOT=auto` for best effort, or `ENABLE_AOT=true` for strict diagnostics.

### Security notes

- Do not commit or publish any proprietary Hytale server binaries/assets.
- Treat these as secrets:
  - `/data/.hytale-downloader-credentials.json`
  - `HYTALE_SERVER_SESSION_TOKEN` / `HYTALE_SERVER_IDENTITY_TOKEN`

### Upgrade notes

- Keep `Assets.zip` and server files in sync when updating.
- Docker does not automatically pull newer images for `:latest`. Use:

```bash
docker compose pull
docker compose up -d
```

### Docs

- `docs/image/quickstart.md`
- `docs/image/configuration.md`
- `docs/image/server-files.md`
- `docs/image/backups.md`
