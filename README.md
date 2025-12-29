# E6 Web Client - AUR Package

A beautiful, modern client for e621/e926 built with React, TypeScript, and Electron.

## Installation

```bash
# Clone this repository
git clone https://aur.archlinux.org/e6-web-client.git
cd e6-web-client

# Build and install
makepkg -si
```

## Updating

```bash
# Pull latest changes
git pull

# Rebuild and reinstall
makepkg -si
```

## Manual Installation

If you prefer to install manually:

```bash
# Download the latest AppImage from GitHub releases
# Make it executable
chmod +x E6-Web-Client-*.AppImage

# Move to /usr/local/bin or ~/bin
sudo mv E6-Web-Client-*.AppImage /usr/local/bin/e6-web-client
```

## Dependencies

- electron
- npm (for building)

## License

MIT