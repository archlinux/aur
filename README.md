# prismlauncher-offline

An AUR package for PrismLauncher-Cracked - a Prism Launcher fork with offline account support enabled.

## Description

This package builds PrismLauncher from source with offline/cracked account functionality enabled. It allows users to play Minecraft without requiring a valid Microsoft/Mojang account.

## Features

- Built from source for all architectures (x86_64, i686, aarch64, armv7h)
- Offline account support enabled
- Based on the official Prism Launcher codebase
- Conflicts with the standard `prismlauncher` package

## Installation

### From AUR

```bash
yay -S prismlauncher-offline
# or
paru -S prismlauncher-offline
```

### Manual Installation

```bash
git clone https://aur.archlinux.org/prismlauncher-offline.git
cd prismlauncher-offline
makepkg -si
```

## Building Locally

1. Clone this repository
2. Run `makepkg -si` to build and install
3. The package will download sources and build everything from scratch

## Dependencies

### Runtime Dependencies
- qt6-base
- qt6-5compat
- qt6-svg
- qt6-imageformats
- java-runtime
- zlib
- quazip-qt6
- tomlplusplus
- cmark

### Build Dependencies
- git
- cmake
- extra-cmake-modules
- java-environment (>= 8)

## Source

This package builds from: https://github.com/Diegiwg/PrismLauncher-Cracked

## Notes

- This package is built entirely from source
- The package conflicts with the official `prismlauncher` package
- Java 8 or higher is required for building
- The build process includes patching to ensure Java 8+ compatibility

## License

GPL-3.0

## Disclaimer

This package is for educational purposes. Please support Mojang/Microsoft by purchasing Minecraft if you intend to play regularly.
