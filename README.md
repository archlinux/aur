# Package build description for coursier [![travis-badge][]][travis]

[travis]:          https://travis-ci.org/2m/coursier-pkgbuild
[travis-badge]:    https://travis-ci.org/2m/coursier-pkgbuild.svg?branch=master

This repository holds instructions for building an Arch Linux package for [coursier](http://get-coursier.io/).

## Pushing to AUR

First generate `.SRCINFO` by:

```
makepkg --printsrcinfo > .SRCINFO
```

Then push to AUR git repository by:

```
git remote add aur ssh://aur@aur.archlinux.org/coursier.git
git push aur
```
