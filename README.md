# imvu (IMVU Classic + IMVU Desktop for Arch Linux)

This package provides both **IMVU Classic** and **IMVU Desktop** on Arch Linux via Wine, with separate Wine prefixes so they don't conflict with each other.

## Features

- **IMVU Classic** and **IMVU Desktop** both supported
- Separate Wine prefixes: `~/.local/share/imvu/classic/` (win32) and `~/.local/share/imvu/desktop/` (win64)
- Setup scripts to install each client independently
- Desktop entries for easy launching from your app menu
- Installers cached in `/usr/share/imvu/` after package installation

## Requirements

- [Wine](https://www.winehq.org/) (installed automatically as dependency)
- [wine-gecko](https://wiki.winehq.org/Gecko) and [wine-mono](https://wiki.winehq.org/Mono) (installed automatically)
- `desktop-file-utils` (installed automatically)

Optional: [winetricks](https://wiki.winehq.org/Winetricks) for extra DLL/runtime fixes if you run into issues.

## Installation

### From the AUR (recommended)

If you use an AUR helper (like `yay`, `paru`, etc.):

```bash
yay -S imvu
# or
paru -S imvu
```

### Manually with makepkg

Clone or copy this directory, then build and install:

```bash
cd /path/to/imvu
makepkg -si
```

## Setup

After installation, you need to install each client separately using the provided setup scripts. This will create the Wine prefix and run the official IMVU installer.

```bash
# Install IMVU Classic
imvu-classic-setup

# Install IMVU Desktop
imvu-desktop-setup
```

Follow the installer prompts as you would on Windows. The default installation paths are fine.

## Usage

Once installed, you can launch either client in a few ways:

- From your application menu: search for "IMVU Classic" or "IMVU Desktop"
- From the terminal:

```bash
imvu-classic
imvu-desktop
```

## File locations

| Item | Location |
|---|---|
| Launchers | `/usr/bin/imvu-classic`, `/usr/bin/imvu-desktop` |
| Setup scripts | `/usr/bin/imvu-classic-setup`, `/usr/bin/imvu-desktop-setup` |
| Cached installers | `/usr/share/imvu/` |
| IMVU Classic prefix | `~/.local/share/imvu/classic/` |
| IMVU Desktop prefix | `~/.local/share/imvu/desktop/` |
| Desktop entries | `/usr/share/applications/imvu-classic.desktop`, `/usr/share/applications/imvu-desktop.desktop` |

## Troubleshooting

- **Client won't launch**: Make sure you've run the corresponding setup script first. The launchers will tell you if the client isn't found.
- **Graphics issues**: Try switching between graphics modes in IMVU's settings (OpenGL/DirectX). On some setups, you may need `winetricks` to install additional dependencies.
- **Audio issues**: Ensure your audio backend is working. Wine can sometimes need configuration via `winecfg`.
- **Prefix issues**: If something is broken, you can remove the prefix for that client and reinstall it. For example: `rm -rf ~/.local/share/imvu/classic` and run `imvu-classic-setup` again.
- **IMVU Desktop installer changes**: If IMVU updates their installer URL or version, the PKGBUILD will need to be updated with new source URLs and checksums.

## Notes

- This package uses the official IMVU Windows installers. No modifications are made to them.
- Both clients are completely isolated thanks to separate Wine prefixes.
- This is an unofficial package for Linux - IMVU does not provide official Linux support.
