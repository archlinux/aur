# odysseus-ai-git

AUR package for [Odysseus](https://github.com/pewdiepie-archdaemon/odysseus) — a self-hosted AI workspace (FastAPI + JS) bundled with a prebuilt Python 3.12 venv. Tracks upstream `main` via a git source.

## Quick start

```bash
sudo pacman -S odysseus-ai-git
sudo systemctl enable --now odysseus-ai
```

Open `http://127.0.0.1:7000` and log in as `admin`. To find the auto-generated first-boot password:

```bash
odysseus-ai password
```

(This runs `sudo` internally to read `/etc/odysseus-ai/odysseus-ai.env`, which is mode 0640 root:odysseus.)

### CLI subcommands

The `odysseus-ai` command is a thin wrapper with subcommands for the common operations. Run as your regular user; `sudo` is invoked internally where needed.

| Command | What it does |
|---|---|
| `odysseus-ai` (no args) | Run uvicorn in the foreground (development mode) |
| `odysseus-ai status` | `systemctl status` + `curl /api/health` |
| `odysseus-ai start` | `sudo systemctl start odysseus-ai` |
| `odysseus-ai stop` | `sudo systemctl stop odysseus-ai` |
| `odysseus-ai restart` | `sudo systemctl restart odysseus-ai` |
| `odysseus-ai logs [-f] [-n N]` | `sudo journalctl -u odysseus-ai` |
| `odysseus-ai password` | Print the first-boot admin password |
| `odysseus-ai env` | Print the effective env (secrets redacted) |
| `odysseus-ai help` | Usage |

**Do NOT run `python -m uvicorn app:app` directly** — that uses the system Python (3.14), which doesn't have bcrypt/fastapi/etc. Use the systemd service (`sudo systemctl start odysseus-ai`) or the `odysseus-ai` wrapper.

## What this package installs

| Path | Contents |
|---|---|
| `/usr/lib/odysseus-ai/app/` | Odysseus source tree (Python + JS) |
| `/usr/lib/odysseus-ai/venv/` | Prebuilt Python 3.12 venv with all pip deps |
| `/usr/bin/odysseus-ai` | CLI wrapper to run uvicorn in the foreground |
| `/usr/bin/odysseus-ai-install-extra` | Helper to install optional pip packages |
| `/usr/lib/systemd/system/odysseus-ai.service` | Hardened systemd unit |
| `/usr/lib/sysusers.d/odysseus-ai.conf` | Creates the `odysseus` system user |
| `/usr/lib/tmpfiles.d/odysseus-ai.conf` | Creates `/etc/odysseus-ai/` |
| `/etc/logrotate.d/odysseus-ai` | Log rotation for `/var/log/odysseus-ai/` |
| `/etc/odysseus-ai/odysseus-ai.env` | Curated env file (auto-generated, mode 0640) |
| `/var/lib/odysseus-ai/` | Runtime state (data/, app.db, services/, auth.json) |
| `/var/cache/odysseus-ai/` | fastembed / HF cache |
| `/var/log/odysseus-ai/` | journal |

## Security notice — READ FIRST

Odysseus exposes an admin-only shell-execution surface:

- `POST /api/shell/exec` — arbitrary command, default timeout 30s
- `POST /api/shell/stream` — arbitrary command, default timeout 120s, can be set to 0 (no timeout)

Both run as the systemd service user with the service user's full `$HOME` and full inherited environment. They are **not sandboxed**.

The upstream project acknowledges this in `THREAT_MODEL.md` "Known Gap #1":

> "No shell/filesystem sandbox. The agent bash and read_file/write_file tools run as the app process user with no network egress filtering or filesystem confinement."

The AUR systemd unit does **not** set `SystemCallFilter=` or `RestrictNamespaces=` because the shell endpoint would defeat those directives. It does set `NoNewPrivileges=yes`, `ProtectSystem=strict`, `ProtectHome=yes`, `PrivateTmp=yes`, `RestrictSUIDSGID=yes`, `RestrictRealtime=yes`, `RestrictNamespaces=yes`, `LockPersonality=yes`, `RestrictAddressFamilies=AF_INET AF_INET6 AF_UNIX`, etc.

**Hardening recommendations:**

1. Keep the default bind at `127.0.0.1` (the AUR unit's `ExecStart` does this). Do not change to `0.0.0.0` without putting the service behind a reverse proxy that authenticates and rate-limits `/api/shell/*`.
2. `AUTH_ENABLED=true` (default). Don't disable.
3. `LOCALHOST_BYPASS=false` (default). Set true ONLY on a single-user dev box.
4. `SECURE_COOKIES=true` if you serve via trusted HTTPS reverse proxy.
5. Rotate the default admin password immediately after first login (Settings → Users).
6. If you don't use the Cookbook or the agent, consider a reverse proxy that strips `/api/shell/*` and `/api/cookbook/*`.

## Companion services (NOT packaged)

ChromaDB, SearXNG, and ntfy are **not** AUR-packaged. The AUR package works with both local and remote ChromaDB/SearXNG — just point `CHROMADB_HOST` / `SEARXNG_INSTANCE` at them. To run the full stack locally, use the upstream `docker-compose.yml`:

```bash
cd /tmp && git clone --depth 1 https://github.com/pewdiepie-archdaemon/odysseus.git
cd odysseus
docker compose up -d chromadb searxng
```

Then update `/etc/odysseus-ai/odysseus-ai.env` and restart:

```bash
sudo systemctl restart odysseus-ai
```

## Optional Python deps

To install faster-whisper (STT), PyMuPDF (PDF RAG, AGPL), kokoro (TTS), duckduckgo-search, or markitdown into the shipped venv:

```bash
sudo odysseus-ai-install-extra faster-whisper pymupdf
sudo systemctl restart odysseus-ai
```

## Recovery recipes

### Forgot admin password

The admin password is stored in `/etc/odysseus-ai/odysseus-ai.env` (mode 0640 root:odysseus). View it with:

```bash
odysseus-ai password
```

If you rotated the password in the web UI and forgot the new one, reset it by deleting the auth store and restarting (a new random password will be generated and shown in the install log; you can also re-read it with `odysseus-ai password` after the reset):

```bash
sudo systemctl stop odysseus-ai
sudo -u odysseus rm /var/lib/odysseus-ai/data/auth.json
sudo systemctl start odysseus-ai
odysseus-ai password
```

### Corrupt SQLite DB

```bash
sudo systemctl stop odysseus-ai
sudo -u odysseus mv /var/lib/odysseus-ai/data/app.db{,.bak}
sudo systemctl start odysseus-ai
```

The next request rebuilds the schema (SQLAlchemy `create_all` is idempotent).

### Check service status

```bash
systemctl status odysseus-ai
journalctl -u odysseus-ai -n 50 --no-pager
curl -fsS http://127.0.0.1:7000/api/health
```

### Roll back to a previous AUR commit

```bash
cd ~/aur/odysseus-ai-git
git checkout <oldsha>
makepkg -si
```

### Roll back a config change

```bash
sudo pacman -U /var/cache/pacman/pkg/odysseus-ai-git-*-x86_64.pkg.tar.zst
```

Or use `pacdiff` to merge `.pacnew` files after an upgrade:

```bash
sudo DIFFPROG=meld pacdiff
```

## Upgrading

The package re-runs `setup.py` on every `post_upgrade` to pick up new data dirs upstream adds. Your `data/auth.json`, `data/app.db`, and `/etc/odysseus-ai/odysseus-ai.env` are preserved (drill 5 confirmed `setup.py` is idempotent and `ConditionPathExists=!auth.json` guards the admin-creation branch).

If upstream's `requirements.txt` changes, regenerate the lock:

```bash
bin/regen-lock.sh
git add requirements.lock
makepkg --printsrcinfo > .SRCINFO
git add .SRCINFO
# Edit CHANGELOG, bump pkgrel in PKGBUILD if needed
git commit -m "r<N>.<sha> — <upstream commit subject>"
```

## Full uninstall

```bash
sudo pacman -Rns odysseus-ai-git
sudo rm -rf /var/lib/odysseus-ai /var/cache/odysseus-ai /var/log/odysseus-ai
sudo rm -rf /etc/odysseus-ai
sudo userdel odysseus
```

## Conflicts

This package `conflicts=('odysseus-ai')` (VVS's prebuilt-tarball package, which is currently flagged out-of-date on AUR with sha256 errors). If you have VVS's package installed, remove it first:

```bash
sudo pacman -R odysseus-ai
sudo pacman -S odysseus-ai-git
```

## License

MIT (matches upstream). See `/usr/share/licenses/odysseus-ai/LICENSE`.
