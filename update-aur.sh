#!/bin/bash
# Helper script to update AUR package after version bump
# Run this after the GitHub release is complete

set -e

# Get current version from PKGBUILD
pkgver=$(grep '^pkgver=' PKGBUILD | cut -d'=' -f2)

echo "Updating AUR package for version $pkgver..."
echo ""

# Check if the release exists on GitHub
echo "Checking GitHub release..."
if ! curl -sL -o /dev/null -w "%{http_code}" "https://github.com/ItsAshn/Kioku/releases/download/v$pkgver/kioku-$pkgver.pacman" | grep -q "200"; then
    echo "ERROR: Release v$pkgver not found on GitHub yet!"
    echo "Please wait for the GitHub Actions build to complete."
    exit 1
fi

echo "Release found! Updating package..."
echo ""

# Update checksums
echo "Updating checksums..."
updpkgsums

# Generate .SRCINFO
echo "Generating .SRCINFO..."
makepkg --printsrcinfo > .SRCINFO

echo ""
echo "✓ AUR package updated successfully!"
echo ""
echo "Next steps:"
echo "  1. Review the changes:"
echo "     git diff"
echo ""
echo "  2. Commit and push to AUR:"
echo "     git add ."
echo "     git commit -m \"Update to $pkgver\""
echo "     git push origin master"
echo ""
echo "Note: Make sure you have the AUR remote configured:"
echo "  git remote add aur ssh://aur@aur.archlinux.org/kioku.git"
