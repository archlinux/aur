#!/bin/bash
# SPDX-License-Identifier: 0BSD
# SPDX-FileCopyrightText: 2025 Eddie Billoir <lechatp@outlook.fr>


set -e

. ./PKGBUILD
TARBALL="${source%%::*}"
URL="${source##*::}"


echo "Downloading source tarball..."
curl -L -o "$TARBALL" "$URL"

echo "Calculating SHA256 checksum..."
SHA256=$(sha256sum "$TARBALL" | cut -d' ' -f1)

echo "SHA256 checksum: $SHA256"

# Update PKGBUILD
echo "Updating PKGBUILD with correct checksum..."
sed -i "s/sha256sums=('[0-9a-fA-F]*')/sha256sums=('$SHA256')/" PKGBUILD

# Update .SRCINFO
echo "Updating .SRCINFO with correct checksum..."
sed -i "s/sha256sums = [0-9a-fA-F]*/sha256sums = $SHA256/" .SRCINFO

if ! grep -q "$SHA256" .SRCINFO; then
    echo "Error: Checksum not found in .SRCINFO after update."
    exit 1
fi
if ! grep -q "$SHA256" PKGBUILD; then
    echo "Error: Checksum not found in PKGBUILD after update."
    exit 1
fi

echo "Done! PKGBUILD and .SRCINFO have been updated with the correct checksum."
echo "You can now test the build with: makepkg -si"

# Clean up
rm -f "$TARBALL"
