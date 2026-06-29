# animazed-bin AUR Package

Binary package for AnimaZed - a high-performance, multiplayer code editor (fork of Zed).

## Installation

```bash
# Install an AUR helper (yay, paru, etc.) if not already installed
yay -S animazed-bin
```

Or manually:
```bash
git clone https://aur.archlinux.org/animazed-bin.git
cd animazed-bin
makepkg -si
```

**Note:** Building this package requires a `GITHUB_TOKEN` environment variable with a personal access token (classic, with `repo` scope) because it downloads artifacts from GitHub Actions.

## What this package provides

- `animazed` - CLI binary
- `animazed-editor` - GUI binary  
- `z`ed - Symlink to `animazed` for compatibility
- `zed-editor` - Symlink to `animazed-editor` for compatibility
- Desktop entry for the application menu
- Icons (512x512)
- Systemd user service for the remote server

## Dependencies

All runtime dependencies are automatically installed:
- gcc-libs, glibc, libxcb, libxkbcommon, wayland
- libgl, fontconfig, freetype2, alsa-lib, glib2
- libva, zstd, sqlite, pipewire, xdg-desktop-portal

## Optional dependencies

- git, nodejs, python, rust, docker, ssh (for language servers and dev features)

## Conflicts

This package conflicts with: `animazed`, `zed`, `zed-git`, `zed-preview`, `zed-nightly`

## Source

Binary artifacts are downloaded from GitHub Actions:
- Run: https://github.com/animaios/animazed/actions/runs/28336485855
- Artifact: zed-linux-x86_64-nightly (ID: 7939126130)