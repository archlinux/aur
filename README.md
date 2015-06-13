# PKCS #11 driver for CryptoTech smart cards

This repository holds instructions for building an Arch Linux package for proprietary
PKCS #11 driver for CryptoTech smart cards by CryptoTech.

## Pushing to AUR

First generate `.SRCINFO` by:

```
sudo pacman -S pkgbuild-introspection
mksrcinfo
```

Then push to AUR git repository by:

```
git remote add aur ssh://aur@aur.archlinux.org/ccpkip11.git
git push aur
```
