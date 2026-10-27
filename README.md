# Jubbio for Arch Linux (`jubbio-bin`)

Official desktop client for [Jubbio](https://jubbio.com) (community chat and voice platform) packaged for Arch Linux and Arch-based distributions.

This package repackages the upstream pre-compiled Linux binary package from the official Jubbio CDN.

## Features

- Packages the official Jubbio client with all desktop integration files (desktop launcher, hicolor icons, protocol handlers).
- Includes command-line launcher symlinks: `jubbio` and `jubbio-client`.
- Automated upstream release tracking via `nvchecker` and `latest-linux.yml`.

## Repository Files

- `PKGBUILD`: Arch Linux package build recipe.
- `.SRCINFO`: Package metadata for the Arch User Repository (AUR).
- `jubbio.desktop`: Custom desktop application launcher.
- `jubbio.png`: High-resolution application icon (256x256).
- `.nvchecker.toml`: Configuration for tracking new upstream releases automatically.
- `.gitignore`: Ignores source archives and built packages.

## Installation

### Using an AUR Helper (once published)

```bash
paru -S jubbio-bin
# or
yay -S jubbio-bin
```

### Manual Installation from Source

1. **Clone the repository:**
   ```bash
   git clone https://aur.archlinux.org/jubbio-bin.git
   cd jubbio-bin
   ```

2. **Build and install:**
   ```bash
   makepkg -si
   ```

## Usage

After installation, you can launch Jubbio from:
- Your desktop environment's application menu: **Jubbio**
- The terminal:
  ```bash
  jubbio
  # or
  jubbio-client
  ```

## Automated Version Checking (`nvchecker`)

This package tracks upstream releases by checking the official Jubbio CDN:

```bash
nvchecker -c .nvchecker.toml
```

To update checksums and `.SRCINFO` after a version bump:

```bash
updpkgsums
makepkg --printsrcinfo > .SRCINFO
```

## AUR Submission

To push updates to AUR:

```bash
git add PKGBUILD .SRCINFO .nvchecker.toml .gitignore README.md
git commit -m "Update to v<version>"
git push origin master
```
