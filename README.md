# qt6-dbusqml-reactive

AUR package for [dbusqml](https://github.com/alexindigo/dbusqml) — a standalone D-Bus binding for QML (Qt6, no KDE dependencies). Tracks tagged releases, built with `-DDBUSQML_REACTIVE_BINDINGS=ON`.

Differs from `qt6-dbusqml` only in the cmake flag: this package enables
catalog-based property pre-population so intermediate `readonly property`
layers in QML reactively update when D-Bus `GetAll` / `PropertiesChanged`
arrive.

## Contents

- `PKGBUILD` — Arch Linux package build script.
- `.SRCINFO` — AUR package metadata (used by the AUR web interface and helpers; auto-generated from PKGBUILD).

## Dependencies

- **Runtime**: `qt6-base`, `qt6-declarative`
- **Build**: `cmake`

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
