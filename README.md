# Package build description for coursier [![ci-badge][]][ci]

[ci]:         https://gitlab.com/2m/coursier-pkgbuild/-/jobs
[ci-badge]:   https://img.shields.io/gitlab/pipeline/2m/coursier-pkgbuild.svg

This repository holds instructions for building an Arch Linux package for [coursier](http://get-coursier.io/).

## Pushing to AUR

First make sure that checksums are updated:

```
updpkgsums
```

Then generate `.SRCINFO` by:

```
makepkg --printsrcinfo > .SRCINFO
```

Then push to AUR git repository by:

```
git remote add aur ssh://aur@aur.archlinux.org/coursier.git
git push aur
```
