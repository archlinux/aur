# ruroco-client-ui - AUR package

PKGBUILD for the [ruroco](https://github.com/beac0n/ruroco) **client GUI**
(`ruroco-client-ui`) - an egui/eframe graphical front-end for the ruroco client.

This is an independent `pkgbase` so the heavy `eframe` + OpenGL build only
happens for people who actually want the GUI. The client CLI and server live in
the separate `ruroco-client` and `ruroco-server` AUR packages.

OpenSSL is linked dynamically against the system package (the upstream
`release-build` feature, which vendors OpenSSL, is intentionally not used).

## Note on the X11/Wayland/GL dependencies

eframe loads its windowing/GL libraries via `dlopen` at runtime (`x11-dl` /
`wayland-sys` / glow), so they do **not** appear in the binary's ELF `NEEDED`
table. `namcap` therefore reports `libxkbcommon`, `wayland`, `libx11`, etc. as
"may not be needed" - that is a **false positive**; they are required at runtime
(and to link eframe at build time). Do not remove them.

## Build / install locally

```bash
makepkg -si
namcap PKGBUILD
```

> This build compiles `eframe` with LTO and is memory-hungry. On low-RAM hosts
> add swap before building.

## Releasing (`Makefile`)

Pushed to `ssh://aur@aur.archlinux.org/ruroco-client-ui.git`. Run `make help`
for all targets:

```bash
make release VERSION=0.14.2   # bump + updpkgsums + .SRCINFO + build + commit
make push                     # review, then push to the AUR
make keywords                 # set AUR search keywords (one-off)
```

> `.SRCINFO` is mandatory and must match the PKGBUILD on every push - the
> `release`/`srcinfo` targets regenerate it for you.
