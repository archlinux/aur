#!/bin/bash
# build.sh - Script to build Arch packages in a clean chroot environment
# Usage: ./build.sh

set -e  # Exit on error

# Configuration
CHROOT_DIR="../chroot"
PACKAGE_NAME="gephi-git"
CURRENT_DIR=$(pwd)

# Function to display colored status messages
status() {
    echo -e "\e[1;34m:: \e[1;37m$1\e[0m"
}

error() {
    echo -e "\e[1;31m:: ERROR: \e[1;37m$1\e[0m"
    exit 1
}

# Check if running as root (should not be)
if [ "$EUID" -eq 0 ]; then
    error "This script should not be run as root!"
fi

# Check if required tools are installed
if ! command -v mkarchroot &> /dev/null; then
    status "Installing devtools..."
    sudo pacman -S --needed devtools
fi

# Create a chroot-specific makepkg.conf with parallel compilation
status "Setting up build configuration..."
cat > /tmp/makepkg.conf.custom <<EOF
# Custom makepkg.conf for chroot builds
MAKEFLAGS="-j$(nproc)"
INTEGRITY_CHECK=(sha256)
COMPRESSZST=(zstd -c -T0 -18 -)
EOF

# Build the package in the chroot
status "Building package $PACKAGE_NAME in chroot..."
makechrootpkg -c -r "$CHROOT_DIR" -C /tmp/makepkg.conf.custom

# Check build result
if [ $? -eq 0 ]; then
    status "Build completed successfully!"
    
    # List the built packages
    PKG_FILES=$(ls -1 *.pkg.tar.zst 2>/dev/null)
    if [ -n "$PKG_FILES" ]; then
        status "Built packages:"
        echo "$PKG_FILES"
        
        # Ask if user wants to install the package
        read -p "Do you want to install the package? [y/N] " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            sudo pacman -U *.pkg.tar.zst
        fi
    else
        error "No package files were created"
    fi
else
    error "Build failed"
fi

status "All done!"
