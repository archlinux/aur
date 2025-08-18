# flameshot-imgur-git

Flameshot screenshot software built from git with **Imgur upload support enabled**.

## Description

This is an AUR package that builds Flameshot directly from the latest git commits with the `ENABLE_IMGUR` flag turned ON during compilation. This enables the built-in Imgur upload functionality that is disabled by default in the official Arch Linux package.

## Key Differences from Official Package

| Feature | Official `flameshot` | This `flameshot-imgur-git` |
|---------|---------------------|---------------------------|
| Imgur Upload | ❌ Disabled | ✅ Enabled |
| Source | Stable release | Latest git commits |
| Build | Pre-compiled binary | Compiled from source |

## Installation

### Using an AUR Helper

```bash
# With yay
yay -S flameshot-imgur-git

# With paru
paru -S flameshot-imgur-git
```

### Manual Installation

```bash
git clone https://github.com/patrickjaja/flameshot-imgur-git.git
cd flameshot-imgur-git
makepkg -si
```

## Features

- All standard Flameshot features
- **Imgur upload functionality enabled**
- Built from latest git commits
- Wayland clipboard support
- Update checker disabled (for Arch)

## Dependencies

- qt6-base
- qt6-svg  
- hicolor-icon-theme
- kguiaddons

### Optional Dependencies

- gnome-shell-extension-appindicator: for system tray icon if you are using Gnome
- grim: for wlroots wayland support
- xdg-desktop-portal: for wayland support
- qt6-imageformats: for additional export image formats

## Conflicts

This package conflicts with:
- `flameshot` (official package)
- `flameshot-git` (standard git version without Imgur)

You must uninstall any existing Flameshot packages before installing this one.

## Building from Source

If you want to build manually:

```bash
makepkg -si
```

To build without installing:
```bash
makepkg
```

## Using Imgur Upload

Once installed, you can use the Imgur upload feature:
1. Take a screenshot with Flameshot
2. Click the cloud upload button in the toolbar
3. The image will be uploaded to Imgur and the link copied to your clipboard

## Upstream

- GitHub: https://github.com/flameshot-org/flameshot
- Official Website: https://flameshot.org

## License

GPL-3.0-or-later

## Maintainer

Update the maintainer information in the PKGBUILD file before submitting to AUR.