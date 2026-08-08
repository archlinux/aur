# qt6-niriqml

AUR package for [niriqml](https://github.com/alexindigo/niriqml) — typed QML bindings for niri IPC (windows, workspaces, events, actions) as a Qt6 QML plugin.

## Contents

- `PKGBUILD` — Arch Linux package build script.
- `.SRCINFO` — AUR package metadata (auto-generated from PKGBUILD).

## Dependencies

- **Runtime**: `qt6-base`, `qt6-declarative`
- **Optional**: `niri` (the compositor niriqml is designed to talk to)
- **Build**: `cmake`

## Install

```bash
# Clone and build
git clone https://github.com/alexindigo/aur-qt6-niriqml.git
cd aur-qt6-niriqml
makepkg -si
```

Or build without installing:

```bash
makepkg
# Then install the built package:
sudo pacman -U qt6-niriqml-*.pkg.tar.zst
```

When AUR is available, install via your AUR helper:

```bash
yay -S qt6-niriqml
```

## Maintenance

### Update .SRCINFO after PKGBUILD changes

A pre-commit hook is provided (`pre-commit.sh`) that regenerates `.SRCINFO` and runs `namcap PKGBUILD` whenever `PKGBUILD` is staged.

On a fresh clone, install it:

```
cp pre-commit.sh .git/hooks/pre-commit
```

### Bump pkgrel

Bump `pkgrel` in PKGBUILD when the PKGBUILD itself changes (but upstream hasn't released a new version). Re-run `.SRCINFO` generation after.

### Push to AUR

```
git add -A && git commit -m "description of changes"
git push
```
