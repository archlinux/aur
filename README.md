# seabird-bin

Arch Linux package for [Seabird](https://github.com/getseabird/seabird), a native Kubernetes desktop IDE for GNOME.

This is a binary package (`-bin`) that installs the pre-built binary from the official releases, as opposed to building from source.

## Installation

### From AUR

```bash
# Using an AUR helper (e.g., paru, yay)
paru -S seabird-bin

# Or manually
git clone https://aur.archlinux.org/seabird-bin.git
cd seabird-bin
makepkg -si
```

### From this repository

```bash
git clone <this-repo-url>
cd seabird-bin
makepkg -si
```

## Features

- Pre-built binary from official releases
- Custom wrapper script that ensures proper XDG_CONFIG_HOME configuration
- Desktop integration with icon and .desktop file
- Respects user's XDG_CONFIG_HOME if set, defaults to `~/.config`

## Dependencies

- `gtk4` - GTK4 library
- `libadwaita` - GNOME Adwaita library

## Package Details

This package:
- Installs the binary to `/usr/lib/seabird/seabird`
- Provides a wrapper script at `/usr/bin/seabird` that sets up the environment
- Patches the desktop file to use the wrapper
- Stores configuration in `$XDG_CONFIG_HOME/seabird` (defaults to `~/.config/seabird`)

## Differences from `seabird`

- `seabird-bin`: Installs pre-built binary (this package)
- `seabird`: Builds from source (requires Go and build dependencies)

## Upstream Project

For more information about Seabird itself, see:
- Homepage: https://github.com/getseabird/seabird
- Issues: https://github.com/getseabird/seabird/issues

## License

This package is licensed under MPL-2.0, same as the upstream project.
