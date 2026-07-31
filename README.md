# qt6-xdgiconqml-git

AUR package for [xdgiconqml](https://github.com/alexindigo/xdgiconqml) — a Qt 6 QML plugin implementing the XDG Icon Theme Specification (v0.13). Tracks the `master` branch.

## Contents

- `PKGBUILD` — Arch Linux package build script.
- `.SRCINFO` — AUR package metadata (auto-generated from PKGBUILD).

## Dependencies

- **Runtime**: `qt6-base`, `qt6-declarative`
- **Build**: `cmake`, `git`

## Building

```
makepkg -si
```

## Maintenance

### Update .SRCINFO after PKGBUILD changes

A pre-commit hook is provided (`pre-commit.sh`) that regenerates
`.SRCINFO` and runs `namcap PKGBUILD` whenever `PKGBUILD` is staged.

On a fresh clone, install it:

```
cp pre-commit.sh .git/hooks/pre-commit
```

### Bump pkgrel

Bump `pkgrel` in PKGBUILD when the PKGBUILD itself changes (but
upstream hasn't released a new version). Re-run `.SRCINFO` generation
after.

### Push to AUR

```
git add -A && git commit -m "description of changes"
git push
```
