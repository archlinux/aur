# t3-code-docker

Headless [T3 Code](https://t3.codes/) server in a Docker container +
systemd `--user` unit. One container per opencode server instance.
Multi-instance by rebuilding with different env vars.

AUR slug: `t3-code-docker` — installed pkgname `t3-code-docker`
(default) or `t3-code-<user>` (per-user instances).

## Default install

```bash
makepkg -si
```

Produces `t3-code-docker` bound to port 3773, targeting opencode at
`http://localhost:4096/`.

## Per-instance builds

```bash
# first instance
T3_INSTANCE_USER=user T3_PORT=3775 T3_OPENCODE_URL=http://localhost:4096/ makepkg -si

# second instance
T3_INSTANCE_USER=other T3_PORT=3776 T3_OPENCODE_URL=http://localhost:8096/ makepkg -si
```

Multiple `t3-code-<user>` packages coexist and remove independently.

## Build-time env vars

| Var | Default | Purpose |
|---|---|---|
| `T3_INSTANCE_USER` | `docker` | Drives pkgname; per-user instances set to `user` / `other` / etc. |
| `T3_PORT` | `3773` | Host-side port for T3 web UI ingress |
| `T3_OPENCODE_URL` | `http://localhost:4096/` | Target opencode server URL (set to enable provider) |
| `T3_CODEX_URL` | (unset) | Future provider (currently CLI-only) |
| `T3_CLAUDE_URL` | (unset) | Future provider |
| `T3_GROK_URL` | (unset) | Future provider |

## Runtime

```bash
# Pre-requisite (one-time)
sudo usermod -aG docker "$USER"   # log out/in to take effect

# Enable + start
systemctl --user daemon-reload
systemctl --user enable --now <pkgname>.service

# Pair browser
<pkgname>-ctl pair
```

Open the printed Desktop URL, complete one-time pairing. Settings →
OpenCode → serverUrl is pre-filled from the packet seed. Run
`<pkgname>-ctl pair` again for each additional device (phone, tablet).

## Removal

```bash
sudo pacman -R <pkgname>
```

Stops the container. Removes the shared docker image if this is the last
`t3-code-*` package installed. User data (`~/.t3/`) is left untouched.
UFW rules are not auto-removed — remove manually:

```bash
sudo ufw delete allow in on docker0 to any port <port> proto tcp
```

## Firewall

The `.install` script auto-configures UFW for docker0 → provider ports
when the target is on localhost (the default). Skip UFW touches:

```bash
T3_CODE_DOCKER_SKIP_UFW=1 pacman -U <pkg>
```

## Container design

Bridge networking: `-p <host>:3773` for the T3 web UI. A socat proxy
inside the container routes `127.0.0.1:4096` → the real opencode URL on
the host (resolved via `host.docker.internal`). The T3 settings-seed
is byte-identical across all instances — only the socat forward target
varies per instance at runtime.
