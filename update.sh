#!/bin/bash

# Check if a version number was provided
if [ -z "$1" ]; then
    echo "Usage: $0 <new_version>"
    exit 1
fi

NEW_VER=$1

# Update pkgver in PKGBUILD
sed -i "s/^pkgver=.*/pkgver=$NEW_VER/" PKGBUILD

# Update package checksums
updpkgsums

# Generate .SRCINFO
makepkg --printsrcinfo > .SRCINFO

# Build the package
makepkg -s

