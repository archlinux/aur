# OpenConnect Git AUR Package

This repository contains the PKGBUILD and related files for the `openconnect-git` package.

The intention is to update the [openconnect-git AUR Package](https://aur.archlinux.org/packages/openconnect-git),
which currently seems to be unmaintend.

It is based on the [Official Arch Package](https://gitlab.archlinux.org/archlinux/packaging/packages/openconnect/).

## Automated Updates

[![Update OpenConnect Package](https://github.com/astehlik/aur-openconnect-git/actions/workflows/update-package.yml/badge.svg)](https://github.com/astehlik/aur-openconnect-git/actions/workflows/update-package.yml)

This repository includes a GitHub Actions workflow that automatically checks for updates from
the upstream OpenConnect repository and rebuilds the package when new commits are available.

## Installation

Currently, only local building is available!

### Building Locally

```bash
# Clone this repository
git clone https://github.com/astehlik/aur-openconnect-git.git
cd aur-openconnect-git

# Build the package
makepkg -si

# Update .SRCINFO (if you made changes to PKGBUILD)
makepkg --printsrcinfo > .SRCINFO
```

## Contributing

This package is automatically maintained, but contributions are welcome:

### Testing Changes

```bash
# Test with dependency installation
makepkg -sf

# Validate PKGBUILD
namcap PKGBUILD

# Check built package
namcap *.pkg.tar.zst
```
