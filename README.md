# ruroco-server - AUR package

PKGBUILD for the [ruroco](https://github.com/beac0n/ruroco) **server +
commander** (`ruroco-server`) - receives UDP packets, validates them, and runs
the configured commands.

This is an independent `pkgbase` so installing it builds **only** `server` and
`commander` - no `eframe` GUI is compiled (keeps the build small and low-memory
on headless hosts). The client CLI and GUI live in the separate `ruroco-client`
and `ruroco-client-ui` AUR packages.

OpenSSL is linked dynamically against the system package (the upstream
`release-build` feature, which vendors OpenSSL, is intentionally not used).

## What it installs

- `ruroco-server` and `ruroco-commander` in `/usr/bin/`.
- systemd units in `/usr/lib/systemd/system/`, with `ExecStart` rewritten from
  `/usr/local/bin` to `/usr/bin`.
- A `ruroco` system user/group via `/usr/lib/sysusers.d/ruroco.conf`.
- Example config at `/etc/ruroco/config.toml` (a pacman `backup` entry, so local
  edits survive upgrades).

Setup uses the wizard from the `ruroco-client` package: `ruroco-client wizard`.

## Build / install locally

```bash
makepkg -si
namcap PKGBUILD
```

## Releasing (`Makefile`)

Pushed to `ssh://aur@aur.archlinux.org/ruroco-server.git`. Run `make help` for
all targets:

```bash
make release VERSION=0.14.2   # bump + updpkgsums + .SRCINFO + build + commit
make push                     # review, then push to the AUR
make keywords                 # set AUR search keywords (one-off)
```

> `.SRCINFO` is mandatory and must match the PKGBUILD on every push - the
> `release`/`srcinfo` targets regenerate it for you.
