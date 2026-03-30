# nuphyctl-bin

Arch Linux package for [nuphyctl](https://github.com/fldc/nuphyctl) - a Rust CLI for sending NuPhy keyboard HID commands.

## Installation

```bash
yay -S nuphyctl-bin
# or
paru -S nuphyctl-bin
```

## Manual build

```bash
git clone https://aur.archlinux.org/nuphyctl-bin.git
cd nuphyctl-bin
makepkg -si
```

## Updating

To update this package to a new version:

```bash
./update-aur.sh 0.6.0
```

## Files

- `PKGBUILD` - Package build script
- `.SRCINFO` - Package metadata for AUR
- `.gitignore` - Git ignore rules
- `update-aur.sh` - Helper script for updates
