# aws-sso-cli

Arch Linux package for [aws-sso-cli](https://github.com/synfinatic/aws-sso-cli).

## Prerequisites

Install `base-devel` if not already installed:

```bash
sudo pacman -S base-devel
```

## Building

Clone this repo and run:

```bash
makepkg -si
```

This will download sources, build the package, and install it.

## Individual Steps

If you prefer more control:

```bash
# Download sources only
makepkg -o

# Build and create package (skip install)
makepkg -ef

# Install the package
sudo pacman -U aws-sso-cli-*-x86_64.pkg.tar.zst
```

## Updating the package

After updating `PKGBUILD` with a new version:

```bash
# Update .SRCINFO
makepkg --printsrcinfo > .SRCINFO

# Clean and rebuild
makepkg -sci
```

## References

- https://wiki.archlinux.org/title/Arch_User_Repository
- https://wiki.archlinux.org/title/Arch_package_guidelines
