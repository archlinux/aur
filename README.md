# Synx AUR Package

This is the AUR package for synx, a CLI-first universal syntax validator and linter dispatcher.

## Package Maintenance

1. Update package version:
   - Update `pkgver` in PKGBUILD
   - Update source SHA256 sum
   - Regenerate .SRCINFO: `makepkg --printsrcinfo > .SRCINFO`

2. Test build:
   ```bash
   makepkg -si
   ```

3. Commit and push changes.

## Installation

Users can install this package using an AUR helper:

```bash
yay -S synx
# or
paru -S synx
```

Or manually:

```bash
git clone https://aur.archlinux.org/synx.git
cd synx
makepkg -si
```

