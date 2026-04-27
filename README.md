# lucidvideo

An intelligent video library application with AI-powered search and semantic understanding.

## Description

LucidVideo is a GTK4-based video library manager that leverages AI for semantic search and content understanding. Features include:

- **Semantic Search**: Find videos using natural language queries
- **AI-Powered Analysis**: Automatic video content analysis and tagging
- **Modern UI**: Built with GTK4 and libadwaita for a modern GNOME experience
- **Video Player**: Built-in video playback with GStreamer
- **Library Management**: Organize and browse your video collection

## Installation

### Arch Linux (AUR)

Install using your favorite AUR helper:

```bash
# Using yay
yay -S lucidvideo

# Using paru
paru -S lucidvideo

# Manual build
git clone https://aur.archlinux.org/lucidvideo.git
cd lucidvideo
makepkg -sric
```

## Dependencies

### Runtime
- gtk4
- libadwaita
- sqlite3
- curl
- json-glib
- gst-libav
- gst-plugins-base
- gst-plugins-good

### Build
- cmake
- ninja
- gcc
- pkg-config

## Building from Source

```bash
# Clone the repository
git clone https://gitlab.com/leestripp/lucid.git
cd lucid

# Create build directory
mkdir build && cd build

# Configure with CMake
cmake .. -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr

# Build
ninja

# Install
sudo ninja install
```

## Configuration

Configuration files are stored in:
- `~/.config/lucid/` - Application settings
- `~/.local/share/lucid/` - Video database and caches

## License

MIT License - See LICENSE file for details.

## Links

- **AUR Package**: https://aur.archlinux.org/packages/lucidvideo
- **Source Code**: https://gitlab.com/leestripp/lucid
- **Bug Reports**: https://gitlab.com/leestripp/lucid/-/issues

## Maintainer

Lee Stripp <leestripp@gmail.com>