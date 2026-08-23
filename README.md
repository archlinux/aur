# qt6-mangowcqml-git

AUR package for [mangowcqml](https://github.com/alexindigo/mangowcqml) — a Qt6/QML module providing complete IPC access to the mangowc Wayland compositor via its `mmsg` JSON-over-socket protocol (workspaces, windows, monitors, tags, keymode, keyboard layout).

## Contents

- `PKGBUILD` — Arch Linux package build script.
- `.SRCINFO` — AUR package metadata (auto-generated from PKGBUILD).

## Dependencies

- **Runtime**: qt6-base, qt6-declarative
- **Build**: cmake, git

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
