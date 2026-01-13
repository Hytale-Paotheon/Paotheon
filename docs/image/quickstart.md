# Quickstart

## Docker Compose

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

## Updating

Docker does **not** automatically pull newer versions of `:latest`.
To update to the newest image:

```bash
docker compose pull
docker compose up -d
```

If you want Compose to always pull when starting:

```bash
docker compose up -d --pull always
```

## Required files

This image runs the official Hytale dedicated server binaries from a persistent volume.

### Recommended default: auto-download

On first run, the official downloader will print an authorization URL + device code.
After you complete the browser flow, the container will download the game package and extract:

- `Assets.zip` to `/data/Assets.zip`
- `Server/` contents to `/data/server/`

Watch logs during first-time auth:

```bash
docker compose logs -f hytale
```

Downloader credentials are stored on the `/data` volume as:

- `/data/.hytale-downloader-credentials.json`

On subsequent runs, the download flow should be non-interactive.

By default (with `HYTALE_AUTO_DOWNLOAD=true`), the container will also run the downloader on each start to check for updates.
If you want it to only download when files are missing, set `HYTALE_AUTO_UPDATE=false`.

If you want fully non-interactive automation, you can seed credentials (mount a credentials file read-only):

- See [`configuration.md`](configuration.md#non-interactive-auto-download-seed-credentials)

Auto-download details:

- The downloader is fetched from `https://downloader.hytale.com/hytale-downloader.zip`.
- Currently, auto-download is supported on `linux/amd64` only.

If you are running Docker on an arm64 host (for example Apple Silicon), you have two options:

- Run the container as `linux/amd64`:

  ```yaml
  services:
    hytale:
      platform: linux/amd64
  ```

  This uses emulation on many arm64 hosts and may be slower.
  See also: [`development.md`](development.md)

- Or disable auto-download and provision files manually (see below).

### Manual provisioning (opt-out / no auto-download)

If you prefer to skip auto-download, you can provide the files yourself.

Disable auto-download:

```yaml
services:
  hytale:
    environment:
      HYTALE_AUTO_DOWNLOAD: "false"
```

To obtain `Assets.zip` and the `Server/` folder, follow:

- [`server-files.md`](server-files.md)

1. Create the expected folders:

   - `./data/`
   - `./data/server/`

2. Place these files:

   - `Assets.zip` at `./data/Assets.zip`
   - contents of the `Server/` folder at `./data/server/` (at minimum `HytaleServer.jar` at `./data/server/HytaleServer.jar`)

3. Start the container:

   ```bash
   docker compose up -d
   ```

4. If the container exits, check logs for a precise missing-file path:

   ```bash
   docker compose logs -n 200 hytale
   ```

See:

- [`server-files.md`](server-files.md)

## Java runtime

Hytale requires Java 25.
This image uses **Adoptium / Eclipse Temurin 25**.

## First-time authentication

On first run (with `HYTALE_AUTO_DOWNLOAD=true`), the official downloader prints an authorization URL + device code in the container logs.

Open the URL in your browser and complete the flow.

## Server authentication (required for player connections)

In `HYTALE_AUTH_MODE=authenticated` mode, the server must obtain server session tokens before it can complete the authenticated handshake with clients.
If you try to connect before the server is authenticated, you may see a disconnect with a message like:

```
Server authentication unavailable - please try again later
```

To authenticate, attach to the server console and run:

```text
/auth login device
```

Follow the URL + device code shown in the console.

If multiple profiles are available, select one:

```text
/auth select <number>
```

You can check status with:

```text
/auth status
```

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

See also: [`configuration.md`](configuration.md#jvm-heap-tuning)

## Server console (interactive)

Attach:

```bash
docker compose attach hytale
```

Detach without stopping the server:

- Press `Ctrl-p` then `Ctrl-q`

## Notes

- Keep `Assets.zip` and server files in sync when updating.
- Do not log or commit any credentials/tokens.

See also:

- [`configuration.md`](configuration.md)
- [`backups.md`](backups.md)
- [`development.md`](development.md)
