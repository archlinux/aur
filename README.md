# untrunc-anthwlock-bin

> AUR binary package for [untrunc](https://github.com/fr0stb1rd/untrunc) — restore damaged (truncated) MP4, M4V, MOV, 3GP videos.

Pre-built static binaries compiled with bundled FFmpeg. No FFmpeg installation required.

**Upstream commit:** [`d286625`](https://github.com/anthwlock/untrunc/commit/d286625)

## Installation

```bash
# With an AUR helper (recommended)
paru -S untrunc-anthwlock-bin
yay -S untrunc-anthwlock-bin

# Manually
git clone https://aur.archlinux.org/untrunc-anthwlock-bin.git
cd untrunc-anthwlock-bin
makepkg -si
```

## Supported Architectures

| Architecture | Binary |
|---|---|
| x86_64 (64-bit Intel/AMD) | `untrunc-linux-amd64` |
| aarch64 (64-bit ARM, e.g. RPi 4/5) | `untrunc-linux-arm64` |
| armv7h (32-bit ARM, e.g. RPi 2/3) | `untrunc-linux-armv7` |
| i686 (32-bit Intel/AMD) | `untrunc-linux-i386` |

## Usage

You need a healthy reference video (ideally from the same camera) and the broken video.

```bash
untrunc /path/to/healthy.mp4 /path/to/broken.mp4
```

This produces a repaired file named `broken_fixed.mp4`.

## Build System

Binaries are built automatically via GitHub Actions on every tagged release. The workflow:

- Fetches the latest FFmpeg source and compiles it statically inside Docker (Linux) or natively (macOS)
- Compiles `untrunc` against the bundled FFmpeg
- Publishes architecture-specific binaries as GitHub release assets

Source: [`fr0stb1rd/untrunc`](https://github.com/fr0stb1rd/untrunc)

## Conflicts

This package conflicts with `untrunc-anthwlock-cli-git` and `untrunc-git`. It provides `untrunc`.

## License

GPL-2.0-only
