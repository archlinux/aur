#!/bin/bash
set -e

if [ -z "$1" ]; then
    echo "Usage: $0 <new_version>"
    exit 1
fi

NEW_VER=$1

echo "-> Cleaning src and pkg directories..."
rm -rf src pkg

echo "-> Updating PKGBUILD version to $NEW_VER..."
sed -i "s/^pkgver=.*/pkgver=$NEW_VER/" PKGBUILD
sed -i "s/^pkgrel=.*/pkgrel=1/" PKGBUILD

echo "-> Updating checksums (this downloads the sources)..."
updpkgsums

echo "-> Updating .SRCINFO..."
rm -f .SRCINFO
makepkg --printsrcinfo > .SRCINFO

echo "-> Building and installing package..."
# -s: install deps, -i: install package, -c: clean up
makepkg -si

echo "-> Staging files..."
git add PKGBUILD .SRCINFO

if git diff --cached --quiet; then
    echo "-> No changes to commit."
else
    echo "-> Committing..."
    git commit -m "chore: update to $NEW_VER"

    echo "-> Commit Diff:"
    git diff HEAD~1
fi

echo
read -p "Do you want to git push? (y/N) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "-> Pushing..."
    git push
else
    echo "-> Push aborted."
fi
