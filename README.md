# qt6-mpvqml-git

AUR package for [mpvqml](https://github.com/alexindigo/mpvqml) — a QML component wrapping libmpv via MpvQt for Qt6 applications.

## Contents

- `PKGBUILD` — Arch Linux package build script.
- `.SRCINFO` — AUR package metadata (used by the AUR web interface and helpers; auto-generated from PKGBUILD).

## Dependencies

- **Runtime**: `qt6-base`, `mpv`, `mpvqt`
- **Build**: `cmake`, `git`

## Building

```
makepkg -si
```

## Maintenance

### Update .SRCINFO after PKGBUILD changes

A pre-commit hook is provided (`pre-commit.sh`) that automates this — it regenerates `.SRCINFO` and stages it whenever `PKGBUILD` is staged.

On a fresh clone, install it:

```
cp pre-commit.sh .git/hooks/pre-commit
```

Or manually:

```
makepkg --printsrcinfo > .SRCINFO
```

### Bump pkgrel

Bump `pkgrel` in PKGBUILD when the PKGBUILD itself changes (but upstream hasn't released a new version). Re-run `.SRCINFO` generation after.

### Push to AUR

```
git add -A && git commit -m "description of changes"
git push
```
