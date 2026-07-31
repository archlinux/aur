# AUR Package for aperture-router

This directory contains the files needed to publish aperture-router to the Arch User Repository (AUR).

## Files

- `PKGBUILD` - Package build script
- `.SRCINFO` - Package metadata
- `aperture-router.install` - Post-installation script

## Testing the Package

Before submitting to AUR, test the package locally:

```bash
cd aur
makepkg -si
```

This will:
1. Download the source tarball
2. Build the package
3. Install it on your system
4. Run all tests

## Submitting to AUR

To submit this package to AUR:

1. **Create a GitHub release** first (tag v0.1.0 must exist)

2. **Update the PKGBUILD** with the correct sha256sum:
   ```bash
   makepkg -g
   ```
   Copy the output to the `sha256sums=` line in PKGBUILD

3. **Clone the AUR package repo:**
   ```bash
   git clone ssh://aur@aur.archlinux.org/aperture-router.git
   cd aperture-router
   ```

4. **Copy the package files:**
   ```bash
   cp ../aur/{PKGBUILD,.SRCINFO,aperture-router.install} .
   ```

5. **Commit and push:**
   ```bash
   git add PKGBUILD .SRCINFO aperture-router.install
   git commit -m "Initial release: v0.1.0"
   git push
   ```

## AUR Package Naming

The package should be submitted as `aperture-router` in the AUR.

## Notes

- The `sha256sums` in PKGBUILD is currently set to 'SKIP' for testing
- Before submission, generate the actual checksums with `makepkg -g`
- The `.SRCINFO` file should be regenerated after any PKGBUILD changes:
  ```bash
  makepkg --printsrcinfo > .SRCINFO
  ```
