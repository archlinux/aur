# jami-qt-beta-git

AUR package for [Jami](https://jami.net) — beta channel of the Qt client, built
from upstream git tip, tracking `beta/*` tags.

## Contents

- `PKGBUILD` — Arch Linux package build script.
- `.SRCINFO` — AUR package metadata (auto-generated from PKGBUILD).
- `*.patch` — Patches applied before build (shared with `jami-qt-git`).

## Dependencies

- **Runtime**: jami-daemon, glib2, gdk-pixbuf2, libnm, libnotify, qt6-*
- **Build**: cmake, git, python, qt6-tools, qt6-networkauth

## Building

```
makepkg -si
```

## Maintenance

### Update .SRCINFO after PKGBUILD changes

A pre-commit hook is provided (`pre-commit.sh`) that regenerates `.SRCINFO`
and runs `namcap PKGBUILD` whenever `PKGBUILD` is staged.

On a fresh clone, install it:
```
cp pre-commit.sh .git/hooks/pre-commit
```

### Push to AUR

```
git add -A && git commit -m "description of changes"
git push
```
