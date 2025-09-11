# ArchLinux
## Installation
```bash
user $ mkdir OpaqueFiles
user $ cd OpaqueFiles
user $ wget https://codeberg.org/cozyOwl/OpaqueFiles/src/branch/main/packaging/archLinux/PKGBUILD
user $ makepkg --syncdeps
ROOT # pacman -U opaquefiles-0.9.9.3-1-any.pkg.tar.zst
```
## Updating
```bash
user $ cd OpaqueFiles
user $ wget -N https://codeberg.org/cozyOwl/OpaqueFiles/src/branch/main/packaging/archLinux/PKGBUILD
user $ makepkg --syncdeps
ROOT # pacman -U opaquefiles-0.9.9.3-1-any.pkg.tar.zst
```
## Removal
```bash
ROOT # pacman -Rs opaquefiles
user $ rm -r ~/.config/OpaqueFiles
```
## Troubleshooting
You encountered an error while installing, updating or removing? These instructions needed to be changed? [Please report this bug, so others may not encounter it](../../CONTRIBUTING.md).
