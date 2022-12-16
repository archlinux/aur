# mint-backgrounds

[![https://img.shields.io/aur/version/mint-backgrounds](https://img.shields.io/aur/version/mint-backgrounds)](https://aur.archlinux.org/packages/mint-backgrounds)
[![https://img.shields.io/aur/license/mint-backgrounds](https://img.shields.io/aur/license/mint-backgrounds)](https://aur.archlinux.org/packages/mint-backgrounds)
[![https://img.shields.io/aur/maintainer/mint-backgrounds](https://img.shields.io/aur/maintainer/mint-backgrounds)](https://aur.archlinux.org/packages/mint-backgrounds)
[![https://img.shields.io/aur/last-modified/mint-backgrounds](https://img.shields.io/aur/last-modified/mint-backgrounds)](https://aur.archlinux.org/packages/mint-backgrounds)
[![Build Status](https://drone.cryptic.systems/api/badges/volker.raschek/mint-backgrounds-pkg/status.svg)](https://drone.cryptic.systems/volker.raschek/mint-backgrounds-pkg)

This repository contains the source code to build the Arch Linux package
`mint-backgrounds`.

The package can be created and installed locally via `makepkg`. Alternatively,
it can be installed from the
[AUR](https://aur.archlinux.org/packages/mint-backgrounds) using an AUR helper
such as `yay`.

## makepkg

Clone the repository from one of the mirrors and move into the cloned git
repository. Execute `makepkg --install` to build the and install the package.

```bash
git clone <URL>
cd mint-backgrounds
makepkg --install
```

## yay

Make sure that yay is installed. Run yay to build and install the
mint-backgrounds package.

```bash
yay --sync --aur mint-backgrounds
```
