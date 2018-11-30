# Package build description for coursier [![ci-badge][]][ci]

[ci]:         https://circleci.com/gh/2m/coursier-pkgbuild 
[ci-badge]:   https://circleci.com/gh/2m/coursier-pkgbuild.svg?style=shield

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
