# Package build description for The Unison Language

This repository holds instructions for building an Arch Linux package for The [Unison] Language.

[Unison]: https://www.unisonweb.org

## Pushing to AUR

First generate `.SRCINFO` by:

```
makepkg --printsrcinfo > .SRCINFO
```

Then push to AUR git repository by:

```
git remote add aur ssh://aur@aur.archlinux.org/ucm-git.git
git push aur
```
