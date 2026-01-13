# Hytale Server Docker Image
 
🐳 Production-ready Docker image for dedicated Hytale servers.
 
**Image (Docker Hub)**: `hybrowse/hytale-server`
**Mirror (GHCR)**: `ghcr.io/hybrowse/hytale-server`

Brought to you by [Hybrowse](https://hybrowse.gg) and the developer of [setupmc.com](https://setupmc.com).

 ## Community

 Join the **Hybrowse Discord Server** to get help and stay up to date: https://hybrowse.gg/discord

## Status

This image is currently **under active development**.
We plan to release **v0.1** on the day of the Hytale release, once we have access to the official server software and can validate that it works end-to-end.
Further improvements and follow-up releases will land in the days after.

## Documentation (start here)

- [`docs/image/quickstart.md`](docs/image/quickstart.md)
- [`docs/image/configuration.md`](docs/image/configuration.md)
- [`docs/image/backups.md`](docs/image/backups.md)

## Quickstart (Docker Compose)
 
Hytale uses **QUIC over UDP** (not TCP). Publish `5520/udp`.
 
```yaml
services:
  hytale:
    image: hybrowse/hytale-server:latest
    environment:
      HYTALE_AUTO_DOWNLOAD: "true"
    ports:
      - "5520:5520/udp"
    volumes:
      - ./data:/data
    tty: true
    stdin_open: true
    restart: unless-stopped
```

Start:

```bash
docker compose up -d
```

Update:

Docker does **not** automatically pull a newer `:latest` image.
To update:

```bash
docker compose pull
docker compose up -d
```

Recommended default: automatic download of `Assets.zip` and server files (best UX):

- Set `HYTALE_AUTO_DOWNLOAD=true` (already included above)
- Follow the device-code link shown in logs on first run

When `HYTALE_AUTO_DOWNLOAD=true`, the container will also run the downloader on each start to check for updates by default.
To disable this and only download when files are missing, set `HYTALE_AUTO_UPDATE=false`.

Auto-download details:

- Downloader source: `https://downloader.hytale.com/hytale-downloader.zip`
- Currently supported on `linux/amd64` only

If you are running Docker on an arm64 host (for example Apple Silicon), you have two options:

- Run the container as `linux/amd64` (Compose: `platform: linux/amd64`)
- Or provision files manually (see: [`docs/image/server-files.md`](docs/image/server-files.md))

Start and check logs if needed:

```bash
docker compose up -d
docker compose logs -n 200 hytale
```

Next:

- [`docs/image/configuration.md`](docs/image/configuration.md)
- [`docs/image/backups.md`](docs/image/backups.md)

## First-time authentication
 
When using `HYTALE_AUTO_DOWNLOAD=true`, the official downloader will print an authorization URL + device code in the container logs on first run.

Follow that URL in your browser to authenticate.

## Server authentication (required for player connections)

In `HYTALE_AUTH_MODE=authenticated` mode, the server must be authenticated before players can connect.
Attach to the server console and run:

```text
/auth login device
```

If multiple profiles are shown, pick one via `/auth select <number>`.

For provider-grade automation, see: [`docs/hytale/server-provider-auth.md`](docs/hytale/server-provider-auth.md) (tokens via `HYTALE_SERVER_SESSION_TOKEN` / `HYTALE_SERVER_IDENTITY_TOKEN`).

## JVM memory (important)

If you don't set `JVM_XMX`, Java will pick a default heap size based on available container memory.
For predictable production operation, set at least `JVM_XMX`.

You can optionally set `JVM_XMS` as well. If you see high CPU usage from garbage collection, that can be a symptom of memory pressure and an `JVM_XMX` value that is too low.
Monitor RAM/CPU usage for your player count and experiment with different values.

Example:

```yaml
services:
  hytale:
    environment:
      JVM_XMX: "6G"
```

See: [`docs/image/configuration.md`](docs/image/configuration.md#jvm-heap-tuning)

## Server console (interactive)

Attach:

```bash
docker compose attach hytale
```

Detach without stopping the server:

- Press `Ctrl-p` then `Ctrl-q`

## Why this image

- **Security-first defaults** (least privilege; credentials/tokens treated as secrets)
- **Operator UX** (clear startup validation and actionable errors)
- **Performance-aware** (sane JVM defaults; optional AOT cache usage)
- **Predictable operations** (documented data layout and upgrade guidance)

## Java

Hytale requires **Java 25**.
This image uses **Adoptium / Eclipse Temurin 25**.

## Planned features

See [`ROADMAP.md`](ROADMAP.md) for details. Highlights:

- **MVP**: non-root runtime, startup validation, minimal healthcheck, clear docs
- **Operations**: safer upgrades, backup guidance, better logging ergonomics
- **Observability**: metrics hooks / exporter guidance
- **Provider-grade**: non-interactive auth flows and fleet patterns
 
## Documentation
 
- [`docs/image/`](docs/image/): Image usage & configuration
- [`docs/hytale/`](docs/hytale/): internal notes (not end-user image docs)
 
## Contributing & Security
 
- [`CONTRIBUTING.md`](CONTRIBUTING.md)
- [`SECURITY.md`](SECURITY.md)

## Local verification

You can build and run basic container-level validation tests locally:

```bash
task verify
```

Install Task:

- https://taskfile.dev/
 
## License
 
See [`LICENSE`](LICENSE) and [`NOTICE`](NOTICE).
