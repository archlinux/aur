# OpenOTP AUR Package

This directory contains the files needed to create an AUR (Arch User Repository) package for OpenOTP.

## Files

- `PKGBUILD` - The main build script for the package
- `openotp.desktop` - Desktop entry file for application integration
- `.SRCINFO` - Package metadata for AUR (generated from PKGBUILD)

## Building the Package

1. Install the required dependencies:
   ```bash
   sudo pacman -S base-devel flutter cmake ninja pkgconf gtk3
   ```

2. Build the package:
   ```bash
   makepkg -si
   ```

## Submitting to AUR

1. Generate .SRCINFO:
   ```bash
   makepkg --printsrcinfo > .SRCINFO
   ```

2. Create AUR repository and push files:
   ```bash
   git clone ssh://aur@aur.archlinux.org/openotp.git
   cd openotp
   # Copy PKGBUILD, .SRCINFO, and openotp.desktop here
   git add .
   git commit -m "Initial commit"
   git push
   ```

## Package Information

- **Package Name**: openotp
- **Description**: A feature-rich, secure OTP (One-Time Password) generator app built with Flutter
- **License**: GPL3
- **Architecture**: x86_64
- **Dependencies**: flutter, cmake, ninja, pkgconf, gtk3
