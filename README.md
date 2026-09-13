# aur-waybar-niri-focused-workspaces

AUR packaging for [waybar-niri-focused-workspaces](https://github.com/pentago/waybar-niri-focused-workspaces-module) — a Waybar CFFI module that shows the niri workspaces of the focused output on every bar. This repo contains no application code — only `PKGBUILD`, `.SRCINFO`, and a `Makefile` driving the release flow.

## Package

Installs `/usr/lib/waybar/niri-focused-workspaces.so` and its man page. See the
[module README](https://github.com/pentago/waybar-niri-focused-workspaces-module#readme)
for configuration and styling.

## Workflow commands

Everything goes through `make` (requires `makepkg`, `updpkgsums`, `nvchecker`; `publish` also needs a git remote named `aur` pointing at `ssh://aur@aur.archlinux.org/waybar-niri-focused-workspaces.git`).

- `make check` — read-only: latest upstream tag vs local `pkgver`
- `make bump` — bump `pkgver`, reset `pkgrel=1`, refresh checksums + `.SRCINFO`
- `make build` — `makepkg` build of the package
- `make publish` — commit `PKGBUILD`/`.SRCINFO` if changed, push to the AUR
- `make release` — `bump → build → publish`, stops on first failure
- `make nvcheck` — upstream version check via nvchecker
- `make clean` — remove build artifacts

First release: push the module repo, tag `v0.1.0` there, then `make build && make publish`.
