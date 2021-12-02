

## Build

```bash
# Test PKGBUILD
namcap PKGBUILD
# Build
makepkg
# Test artifact
namcap <package file name>.pkg.tar.xz
# Install
pacman -U <package file name>.pkg.tar.xz
# Generate SRCINFO
makepkg --printsrcinfo > .SRCINFO
# Commit & Publish
``` 
