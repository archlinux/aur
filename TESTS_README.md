# LM Studio AUR Package - Test & Maintenance Guide

## Overview
This package uses a maintenance engine (`update_package.py`) to resolve the latest AppImage download URL from LM Studio's official redirectors, calculate the SHA256 checksum, and update the `PKGBUILD` and `.SRCINFO` files.

## Files
- `PKGBUILD`: The Arch Linux package build script.
- `PKGBUILD.template`: Template used by the maintenance engine.
- `.SRCINFO`: Metadata for the AUR.
- `update_package.py`: Python script to automate updates.
- `lmstudio.desktop`: Desktop entry for the application.

## Maintenance Workflow
To update the package to the latest version:
1. Run the maintenance script: `python3 update_package.py`
2. Verify the changes in `PKGBUILD` and `.SRCINFO`.
3. Test the build: `makepkg -f`

## Local Verification
To verify the package build locally without installing:
```bash
makepkg -f --nodeps
```
This will:
- Download the AppImage.
- Verify the SHA256 sum.
- Run the `prepare()` and `package()` functions.
- Generate a `.pkg.tar.zst` file.

## AUR Hygiene
Only the following files should be committed to the AUR:
- `PKGBUILD`
- `.SRCINFO`
- `lmstudio.desktop`
- `update_package.py`
- `PKGBUILD.template`
- `.gitignore`
