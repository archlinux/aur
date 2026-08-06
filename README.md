# YTubic AUR Package

This repository contains the PKGBUILD for **[YTubic](https://github.com/NUber-dev/YTubic)**, a YouTube Music client built with Flutter, packaged for Arch Linux.

This is the `-bin` package, which directly repacks the pre-compiled `.deb` binary release of YTubic for Arch Linux.

## Installation

### Using an AUR Helper (Recommended)

Once the package is available on the AUR, you can easily install it using your preferred AUR helper (e.g., `yay` or `paru`):

```bash
yay -S ytubic-9m2pju-bin
# or
paru -S ytubic-9m2pju-bin
```

### Manual Installation

If you prefer to build and install the package manually using `makepkg` directly from this repository:

```bash
# Clone the repository
git clone https://github.com/9M2PJU/YTubic-9M2PJU-AUR.git
cd YTubic-9M2PJU-AUR

# Build and install the package (installs required dependencies automatically)
makepkg -si
```

## Maintenance

To update this package to a new version:
1. Update the `pkgver` variable in the `PKGBUILD`.
2. Run `updpkgsums` to fetch the new archive and update the `sha256sums` array.
3. Run `makepkg --printsrcinfo > .SRCINFO` to update the `.SRCINFO` file.
4. Test the build with `makepkg -f`.
5. Commit and push the changes.

## Links

* Upstream Project: [YTubic on GitHub](https://github.com/NUber-dev/YTubic)
* Upstream License: GPL-3.0
