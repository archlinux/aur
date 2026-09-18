# shrimply-git (AUR)

AUR package for **Shrimply** (`shrimply-git`), a GPU-accelerated video editor for Linux.

AUR URL: https://aur.archlinux.org/packages/shrimply-git  
Maintainer: KorigamiK `<korigamik@gmail.com>`

## Overview

This package builds the GTK 4 / Libadwaita frontend of Shrimply along with the bundled MCP adapter and Manim worker integration from the upstream Git repository. All dependencies are resolved through official Arch Linux repositories (`core` and `extra`) and standard AUR packages.

### Packaged Components

- **Binaries:** `shrimply` (launcher), `shrimply-editor` (video editor), `shrimply-mcp` (MCP server).
- **Desktop Assets:** FreeDesktop desktop entry, scalable app icon, MIME database entry, and project file icon.
- **Lip-Sync Models:** Pre-converted PocketSphinx phoneme models and license metadata.
- **Manim Animation Support:** Patched runtime path and user-cache virtual environment integration.
- **GPU Kernels:** PTX compute capability `compute_50` compatible with NVIDIA Maxwell through Blackwell GPUs.

## Testing and Verification

Run the helper script:

```bash
./test-build.sh
```

To fetch and verify all sources and run `prepare()` without compiling:

```bash
makepkg --nobuild
```

## Building the Package

### 1. Install Dependencies

All build and runtime dependencies are available in Arch `core` and `extra` repositories:

```bash
sudo pacman -S --needed \
  alsa-lib ffmpeg freetype2 gtk4 gtksourceview5 hicolor-icon-theme \
  libadwaita libglvnd opencv openssl pipewire poppler-glib python \
  rubberband uv clang cmake cuda gcc15 git gobject-introspection \
  make ninja pkgconf rustup
```

### 2. Build with makepkg or paru

To build and package locally:

```bash
makepkg -s -f
```

Or using an AUR helper:

```bash
paru -S shrimply-git
```

Install the built package manually:

```bash
sudo pacman -U shrimply-git-*-x86_64.pkg.tar.zst
```

## Upstream & AUR Maintenance

The Git remote for this AUR repository is:

```bash
git remote -v
# origin  ssh://aur@aur.archlinux.org/shrimply-git.git (fetch)
# origin  ssh://aur@aur.archlinux.org/shrimply-git.git (push)
```

To push updates:

```bash
makepkg --printsrcinfo > .SRCINFO
git add PKGBUILD .SRCINFO shrimply-manim-system-path.patch .gitignore
git commit -m "Update package"
git push origin master
```
