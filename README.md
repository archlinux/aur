# atmosphera-git

AUR package for [Atmosphera](https://github.com/alexindigo/atmosphera) — git version tracking `main` branch.

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

```
makepkg --printsrcinfo > .SRCINFO
```

### Push to AUR

```
git add -A && git commit -m "description of changes"
git push origin master
```
