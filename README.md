# Package build description for jabba [![travis-badge][]][travis]

[travis]:          https://travis-ci.org/2m/jaba-pkgbuild
[travis-badge]:    https://travis-ci.org/2m/jabba-pkgbuild.svg?branch=master

This repository holds instructions for building an Arch Linux package for [jabba](https://github.com/shyiko/jabba).

## Pushing to AUR

First generate `.SRCINFO` by:

```
makepkg --printsrcinfo > .SRCINFO
```

Then push to AUR git repository by:

```
git remote add aur ssh://aur@aur.archlinux.org/jabba.git
git push aur
```
