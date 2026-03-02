# Meshiji AUR Package

This directory contains the Arch User Repository (AUR) package for Meshiji, a modern, cross-platform file explorer built with Flutter.

## Installation

### From AUR (when published)

```bash
yay -S meshiji
# or
paru -S meshiji
# or manually:
git clone https://aur.archlinux.org/meshiji.git
cd meshiji
makepkg -si
```

### Manual Installation

```bash
git clone https://github.com/Veridian-Zenith/meshiji.git
cd meshiji/AUR
makepkg -si
```

## Dependencies

### Required Dependencies
- `gtk3` - GTK+ 3 development libraries
- `libx11` - X11 client-side library
- `libxext` - X11 extensions library
- `libxfixes` - X11 fixes extension library
- `libxi` - X11 input extension library
- `libxrandr` - X11 randr extension library
- `libxrender` - X11 render extension library
- `libxtst` - X11 test extension library
- `liblzma` - LZMA compression library

### Build Dependencies
- `git` - Version control system
- `cmake` - Build system
- `ninja` - Build system
- `pkgconf` - Package configuration tool
- `clang` - C/C++ compiler
- `fvm` - Flutter Version Management

## Usage

After installation, you can launch Meshiji from:
- The application menu (search for "Meshiji")
- Terminal: `meshiji`

## License

This package is licensed under the Open Software License 3.0 (OSL-3.0), the same license as the Meshiji project.

## Maintainer

Dae Euhwa <daedaevibin@naver.com>

## Source

- GitHub: https://github.com/Veridian-Zenith/meshiji
- AUR: https://aur.archlinux.org/packages/meshiji

## FVM Setup

This package uses FVM (Flutter Version Management) for consistent Flutter version management. The build process automatically:

1. **Installs FVM**: Downloads and sets up FVM if not already installed
2. **Installs Flutter**: Downloads the stable Flutter version using `fvm install stable`
3. **Sets Global Version**: Configures FVM to use the stable version globally with `fvm global stable`
4. **Uses FVM Commands**: All Flutter commands are executed through FVM (e.g., `fvm flutter pub get`, `fvm flutter build`)

## Notes

- This package builds Meshiji from source using Flutter via FVM (Typical install found at /home/<user>/fvm/versions/stable)
- The build process may take several minutes depending on your system
- Ensure you have sufficient disk space for the build process
- The package includes all necessary assets and libraries for standalone operation
- FVM ensures consistent Flutter version across different environments
