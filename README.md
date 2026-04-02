# mako-center-git AUR package

This directory is a standalone AUR repo for `mako-center-git`.

## Update `.SRCINFO`

```sh
makepkg --printsrcinfo > .SRCINFO
```

## Test build

```sh
makepkg -si
```

## Push to AUR

```sh
git remote add aur ssh://aur@aur.archlinux.org/mako-center-git.git
git add PKGBUILD .SRCINFO .gitignore README.md
git commit -m "Initial import of mako-center-git"
git push aur master
```
