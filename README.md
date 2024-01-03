# LR2oraja \~Endless Dream\~

Install LR2oraja Endless Dream alongside standard LR2oraja

## Install

```sh
yay -Syu lr2oraja-endlessdream
```

## Updating the AUR package

1. Update the `pkgver` to the latest build release tag
2. Change `pkgrel` to current release (1 if a new `pkgver`) 
3. Update the checksum `sha256sum LR2oraja.zip`
4. `makepkg --printsrcinfo > .SRCINFO`

### Testing

1. `makepkg`
2. `sudo pacman -U lr2oraja-build<version>.pkg.tar.zst`
3. Run & Test the game still functions
