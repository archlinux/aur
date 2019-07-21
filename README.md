# Wexond AUR package (appimage)

[![Build Status](https://travis-ci.org/aslafy-z/aur-wexond-appimage.svg?branch=master)](https://travis-ci.org/aslafy-z/aur-wexond-appimage)

Official sources for the Wexond AUR package (https://github.com/aslafy-z/aur-wexond-appimage).

AUR repository: https://aur.archlinux.org/wexond-appimage.git

# Updating Version

refer to https://wiki.archlinux.org/index.php/Creating_packages

- update `pkgver` to Wexond version
- increase `pkgrel` on any changes to PKGBUILD itself, reset to 1 on any updates to `pkgver`
- update `sha256sums` (Appimage)
- recreate `.SRCINFO` (`docker-compose run --rm makepkg --printsrcinfo > .SRCINFO`)
- verify everything works and push changes to AUR (careful: latest commit on master is directly released)

