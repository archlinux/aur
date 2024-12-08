#!/bin/env bash

set -e

# Usage: release.sh <version>
# Example: release.sh 2.3.9

version=$1

if [ -z "$version" ]; then
  echo "Usage: release.sh <version>"
  exit 1
fi

# Update the version
sed -i "s/pkgver=.*/pkgver=\"$version\"/" PKGBUILD

# Remove the old checksum
sed -i '/sha256sums/d' PKGBUILD

# Generate the new checksum
makepkg -g >> PKGBUILD

# Generate the .SRCINFO
makepkg --printsrcinfo > .SRCINFO

# Commit the changes
echo "Committing the changes..."

git add PKGBUILD .SRCINFO
git commit -m "Release $version"
