# t3-code-docker

Headless [T3 Code](https://t3.codes/) server packaged as a Docker
container plus a systemd `--user` unit, so multiple T3 instances can
run side-by-side on one machine — each targeting a different opencode
HTTP server — without fighting the Electron desktop app's single-instance
guard or its hardcoded `~/.config/t3code/` state path.

## Motivation

The Electron T3 Code desktop app:

1. Ignores `--user-data-dir` and hardcodes Chromium userData to
   `~/.config/t3code/`, so two profiles share a `SingletonLock` and the
   second one silently self-quits (`before-quit received` ~8ms in).
2. Has no multi-instance provider UI: the OpenCode row is singular.

The container path sidesteps both: one image, N containers, each with:

- Its own Docker/network namespace (so the singleton-lock issue is
  scoped per container).
- Its own bind-mounted `$HOME` (so T3's userdata / bearer session /
  `directory` reported to opencode all cohere).
- Its own systemd `--user` unit + name (so `systemctl --user enable`
  and `docker ps` show it distinctly).

## Building for the default instance

```bash
makepkg -s
sudo pacman -U t3-code-docker-<pkgver>-<pkgrel>-x86_64.pkg.tar.zst
```

Installs a package named `t3-code-docker` binding port `3773`.

## Building custom-named instances (multi-instance)

Set `T3_INSTANCE_NAME` and `T3_PORT` env vars at build time. Each build
produces an independently-installable package. Example: one T3 for the
domovoy opencode server on `:4096`, another for user's on `:8096`:

```bash
# Instance 1
T3_INSTANCE_NAME=t3-code-domovoy T3_PORT=3775 makepkg -s
sudo pacman -U t3-code-domovoy-*.pkg.tar.zst

# Instance 2
T3_INSTANCE_NAME=t3-code-user    T3_PORT=3776 makepkg -s
sudo pacman -U t3-code-user-*.pkg.tar.zst
```

Both packages share the docker image `t3-code:<pkgver>` (idempotent
`docker load`), so there's no image duplication at runtime.

## Runtime

Each installed package ships:

- `/usr/lib/systemd/user/<pkgname>.service`
- `/usr/bin/<pkgname>-ctl`
- `/usr/share/<pkgname>/image.tar.zst`
- `/usr/share/<pkgname>/Dockerfile` (reference)

As the target user:

```bash
# One-time: ensure docker CLI works without sudo
sudo usermod -aG docker "$USER"   # log out/in to apply

# Enable + start
systemctl --user daemon-reload
systemctl --user enable --now <pkgname>.service

# Get a pairing URL for the browser
<pkgname>-ctl pair
```

Open the printed URL in a browser, complete pairing (one-time; the
bearer session persists in `~/.t3/`). Then in T3's Settings → OpenCode
→ `serverUrl`, point at whichever opencode HTTP server this instance
should drive.

## Design notes

- **`--network host`**: container shares the host network namespace so
  `localhost:*` inside the container reaches the host's loopback,
  including any opencode server on `127.0.0.1:<port>`. Sidesteps UFW
  rules that would otherwise deny docker-bridge → host traffic.
- **`--user %U:%G`** in the systemd unit: container's effective UID/GID
  matches the invoking systemd user, so bind-mounted `$HOME` writes
  stay owned by that user on the host.
- **`-v %h:%h:rw`** at matching paths: T3 sends its `$HOME` as
  `directory` to opencode; opencode-on-host then tries to
  `access(<directory>/opencode.jsonc)` under its own UID. Matching-path
  bind mount + matching UID means access always succeeds regardless of
  whether the file exists.
- **`t3 serve`** (not `t3 start`): headless subcommand that prints a
  pairing URL and does not try to spawn a browser.

## Docker image contents

Base: `node:24-slim` + `python3 make g++` (for node-pty native module
compilation if the shipped prebuild doesn't match) + `t3@<pkgver>`
installed globally from a vendored tarball.

## Uninstall

```bash
sudo pacman -Rns <pkgname>
```

Removes files + stops/removes any running container of the same name.
User data under `~/.t3/` is left untouched. Docker image
`t3-code:<pkgver>` remains in the local cache until you run
`docker image prune`.
