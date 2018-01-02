# Package build description for [coursier](http://get-coursier.io/)

This repository holds instructions for building an Arch Linux package for coursier.

## Pushing to AUR

First generate `.SRCINFO` by:

```
pacaur -S pkgbuild-introspection-git
gitmksrcinfo
```

Then push to AUR git repository by:

```
git remote add aur ssh://aur@aur.archlinux.org/coursier.git
git push aur
```
