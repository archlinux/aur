# ruroco-client - AUR package

PKGBUILD for the [ruroco](https://github.com/beac0n/ruroco) **client CLI**
(`ruroco-client`) - sends encrypted one-way UDP remote-command packets.

This is an independent `pkgbase` so installing it builds **only** the client -
no server code and no `eframe` GUI are compiled (keeps the build small and
low-memory). The GUI and server live in the separate `ruroco-client-ui` and
`ruroco-server` AUR packages.

OpenSSL is linked dynamically against the system package (the upstream
`release-build` feature, which vendors OpenSSL, is intentionally not used).

## Build / install locally

```bash
makepkg -si
namcap PKGBUILD
```

## Releasing (`Makefile`)

Pushed to `ssh://aur@aur.archlinux.org/ruroco-client.git`. Run `make help` for
all targets:

```bash
make release VERSION=0.14.2   # bump + updpkgsums + .SRCINFO + build + commit
make push                     # review, then push to the AUR
make keywords                 # set AUR search keywords (one-off)
```

> `.SRCINFO` is mandatory and must match the PKGBUILD on every push - the
> `release`/`srcinfo` targets regenerate it for you.
