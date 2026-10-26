# evebuddy-git Arch package

This directory contains a local VCS package for EVE Buddy. It follows the
upstream `main` branch and is managed locally by pacman after installation.

Build and install it with:

```sh
makepkg -si
```

To update later, rerun the same command. `makepkg` updates the cached Git
checkout, recalculates `pkgver`, and builds a new package when upstream has
advanced.

Before publishing to the AUR, regenerate `.SRCINFO`:

```sh
makepkg --printsrcinfo > .SRCINFO
```
