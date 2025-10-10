# ArchLinux
## Installation
```bash
user $ yay -S opquefiles
```
## Updating
```bash
user $ yay -Syu
```
## Removal
```bash
user $ yay -R opaquefiles
user $ rm -r ~/.config/OpaqueFiles
```
## Troubleshooting
You encountered an error while installing, updating or removing? These instructions needed to be changed? [Please report this bug, so others may not encounter it](../../CONTRIBUTING.md).

## Building
### Build
```bash
user $ makepkg
```
### Lint
```bash
user $ namcap PKGBUILD
user $ namcap PKGBUILD opaquefiles-*
```
### Install & Test
```bash
ROOT # pacman -U opaquefiles-*
ROOT # pacman -R opaquefiles
```
### Metadata
```bash
user $ makepkg --printsrcinfo > .SRCINFO
```
