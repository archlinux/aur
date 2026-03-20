# playback-appimage

AUR package for [Playback](https://www.epilogue.co), the software for Epilogue
Operator devices.

## Installation

From the AUR:

```bash
yay -S playback-appimage
```

Or manually:

```bash
git clone https://aur.archlinux.org/playback-appimage.git
cd playback-appimage
makepkg -si
```

## Building

```bash
make build    # Build the package
make test     # Build and run namcap checks
make clean    # Remove build artifacts
```

## Updating to a New Version

```bash
make update VERSION=x.y.z
make test
make push
```

## License

The PKGBUILD and associated files are provided as-is. Playback itself is
proprietary software by [Epilogue](https://www.epilogue.co).
