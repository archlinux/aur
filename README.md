# update-notifier-qt (AUR Package)

This is the Arch User Repository (AUR) package for update-notifier-qt, a Qt-based system tray update notifier for Arch Linux.

## Installation

```bash
git clone https://aur.archlinux.org/update-notifier-qt.git
cd update-notifier-qt
makepkg -si
```

## Development

This AUR package pulls the latest source code directly from the GitHub repository and automatically determines the version based on git tags.

### Updating the AUR Package

When new versions are tagged in the GitHub repository:

1. Pull changes in this AUR repository
2. Update `.SRCINFO`: `makepkg --printsrcinfo > .SRCINFO`
3. Commit and push the changes
4. The AUR will automatically detect the new version

## Dependencies

- qt6-base
- qt6-svg
- dbus
- polkit
- pacman
- cmake
- ninja
- qt6-tools
- git (for building)