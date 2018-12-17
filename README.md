# Alva AUR package

Official sources for the Alva AUR package (https://github.com/meetalva/alva-aur).
AUR repository: https://aur.archlinux.org/alva-appimage.git

# Updating Version

refer to https://wiki.archlinux.org/index.php/Creating_packages

- update `pkgver` to Alva version
- increase `pkgrel` on any changes to PKGBUILD itself, reset to 1 on any updates to `pkgver`
- update `md5sums` (Appimage)
- recreate `.SRCINFO` (`docker-compose run --rm makepkg`)
- verify everything works and push changes to AUR (careful: latest commit on master is directly released)


