# xdelta3-gui (AUR Package)

This is the Arch User Repository (AUR) package for xdelta3-gui, a Qt-based GUI for the xdelta3 binary diff/patch tool.

## Installation

```bash
git clone https://aur.archlinux.org/xdelta3-gui.git
cd xdelta3-gui
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
- xdelta3
- cmake
- ninja
- qt6-tools
- qt6-linguist
- git (for building)