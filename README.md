# nvidia-sync AUR Package Maintenance

This repository contains the `PKGBUILD` for `nvidia-sync` and its companion `nvidia-sync-terminal-fix`.

## How to Update the Package

### 1. Check for the Latest Version
The package is based on the official NVIDIA Debian repository. To find the latest version number:

```bash
curl -s https://workbench.download.nvidia.com/stable/linux/debian/dists/default/proprietary/binary-amd64/Packages | grep -A 1 "Package: nvidia-sync"
```
Look for the `Version:` field. Note that the Debian version might look like `0.64.24-1408`; use the prefix `0.64.24` for the `pkgver` in the `PKGBUILD`.

### 2. Update PKGBUILD
Edit the `PKGBUILD` file and update the `pkgver` variable to the new version. If it's a new release of the same upstream version, increment `pkgrel` instead.

```bash
nano PKGBUILD
```

### 3. Update Checksums
After updating the version in the `PKGBUILD`, use the `updpkgsums` tool (part of `pacman-contrib`) to automatically download the new source and update the SHA256 sums:

```bash
updpkgsums
```

### 4. Regenerate .SRCINFO
The `.SRCINFO` file must be kept in sync with the `PKGBUILD` for AUR compatibility:

```bash
makepkg --printsrcinfo > .SRCINFO
```

### 5. Build and Test
Verify the build process and test the resulting packages:

```bash
# Build the package
makepkg -cf

# Install locally for testing
sudo pacman -U nvidia-sync-*.pkg.tar.zst nvidia-sync-terminal-fix-*.pkg.tar.zst
```

### 6. Commit and Push
Once verified, commit the changes to the `PKGBUILD` and `.SRCINFO` and push to the AUR.
