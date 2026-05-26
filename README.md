# openpilot-cabana

AUR package: <https://aur.archlinux.org/packages/openpilot-cabana>

## Installation

```bash
yay -S openpilot-cabana
# or
paru -S openpilot-cabana
```

Or manually with `makepkg`:

```bash
git clone https://aur.archlinux.org/openpilot-cabana.git
cd openpilot-cabana
makepkg -s
pacman -U openpilot-cabana-*.pkg.tar.zst
```

## About

AUR package for [Cabana](https://github.com/deanlee/openpilot-cabana) — a CAN / CAN FD bus analysis and visualization tool. This package auto-updates daily with the latest upstream commits.

## Auto-Update

This package is automatically rebuilt and published to AUR whenever new commits are pushed to the upstream [deanlee/openpilot-cabana](https://github.com/deanlee/openpilot-cabana) repository.

The build pipeline:
1. Syncs latest commits from upstream every hour
2. Builds on Arch Linux in GitHub Actions
3. Publishes updated package to AUR

## Package Contents

- `PKGBUILD` — build script, fetches from upstream tag
- `archlinux.patch` — patches for Arch Linux compatibility (Qt6 detection, compiler warnings)
- `cabana.desktop` — desktop entry
- `cabana-icon.svg` — application icon

## Dependencies

- Arch Linux (x86_64)
- [Samba](https://wiki.archlinux.org/title/Samba) (optional, for Windows-style network browsing)