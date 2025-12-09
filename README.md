# Cloudfleet CLI Arch Linux (AUR) Package

This repository automatically maintains the AUR package for:

- https://aur.archlinux.org/packages/cloudfleet-cli

### Features

- Automatically detects new Cloudfleet CLI releases
- Computes SHA-256 checksums
- Updates PKGBUILD + .SRCINFO
- Commits to GitHub
- Pushes to AUR

### Manual Update

```bash
./update.sh
