#!/usr/bin/env bash

# Exit on any error
set -e

# 1. Ask for the new version number
read -p "Enter new version (current $(grep -oP '(?<=pkgver=).*' PKGBUILD)): " NEW_VER

if [ -z "$NEW_VER" ]; then
    echo "Error: No version entered. Aborting."
    exit 1
fi

echo "--- Updating PKGBUILD to $NEW_VER ---"

# 2. Update the pkgver in PKGBUILD
# Also resets pkgrel to 1 for every new version bump
sed -i "s/^pkgver=.*/pkgver=$NEW_VER/" PKGBUILD
sed -i "s/^pkgrel=.*/pkgrel=1/" PKGBUILD

# 3. Update checksums (requires pacman-contrib)
echo "--- Downloading files and updating SHA256 sums ---"
updpkgsums

# 4. Update .SRCINFO
echo "--- Generating .SRCINFO ---"
makepkg --printsrcinfo > .SRCINFO

# 5. Clean local environment
echo "--- Cleaning up local source files ---"
rm -rf src/ pkg/ *.tar.zst

# 6. Optional Test Build
read -p "Would you like to run a test build? (y/n): " TEST_BUILD
if [[ "$TEST_BUILD" =~ ^[Yy]$ ]]; then
    makepkg -sc
fi

# 7. Git Workflow
echo "--- Ready to commit ---"
git add PKGBUILD .SRCINFO
git status

read -p "Commit and push to AUR? (y/n): " CONFIRM
if [[ "$CONFIRM" =~ ^[Yy]$ ]]; then
    git commit -m "Update to v$NEW_VER"
    git push
    echo "🚀 Successfully pushed v$NEW_VER to the AUR!"
else
    echo "Push aborted. Your files are updated but not committed."
fi
