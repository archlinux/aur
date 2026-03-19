# vite-plus AUR Package

This is the [Arch User Repository (AUR)](https://aur.archlinux.org/) package for [vite-plus](https://viteplus.dev/), the Unified Toolchain for the Web.

## Building and Testing

### Prerequisites

Make sure you have the necessary build tools installed:

```bash
sudo pacman -S base-devel rustup cmake just pnpm nodejs
```

### Building the Package

```bash
# Clean build
makepkg -si

# Build without installing
makepkg -s

# Rebuild from scratch
makepkg -si --force
```

### Testing the Installation

After building and installing:

```bash
vp --version
```

## Submitting to AUR

The package should be pushed to:
```
ssh+git://aur@aur.archlinux.org/vite-plus.git
```

Using the SSH key at `~/.ssh/aur`.

## Package Details

- **Upstream**: https://github.com/voidzero-dev/vite-plus
- **License**: MIT
- **Maintainer**: Zachary Fogg <me@zfo.gg>

## Contributing

To update the package:

1. Update `pkgver` in `PKGBUILD`
2. Regenerate `.SRCINFO`:
   ```bash
   makepkg --printsrcinfo > .SRCINFO
   ```
3. Test the build locally
4. Commit and push to AUR
