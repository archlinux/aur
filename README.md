# atmosphera

AUR package for [Atmosphera](https://github.com/alexindigo/atmosphera) — a customizable desktop shell for Niri and Hyprland, built with Quickshell.

## Contents

- `PKGBUILD` — Arch Linux package build script.
- `.SRCINFO` — AUR package metadata (auto-generated from PKGBUILD).

## Dependencies

- **Runtime**: `noctalia-qs`, `imagemagick`, `brightnessctl`, `ffmpeg`, `qt6-multimedia`, `python`, `wlr-randr`
- **Build**: `git`

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

### Push to AUR

```
git add -A && git commit -m "description of changes"
git push origin master
```
