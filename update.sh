#!/bin/bash

echo "Downloading the latest Pencil tarball..."
curl -sL https://www.pencil.dev/download/Pencil-linux-x64.tar.gz -o pencil-latest.tar.gz

DIR_NAME=$(tar -tzf pencil-latest.tar.gz | head -1 | cut -f1 -d"/")
VERSION=$(echo $DIR_NAME | sed 's/Pencil-\(.*\)-linux-x64/\1/')

if [ -z "$VERSION" ]; then
    echo "Failed to extract version from tarball"
    rm pencil-latest.tar.gz
    exit 1
fi

echo "Latest version found: $VERSION"

CURRENT_VERSION=$(grep -oP '^pkgver=\K.*' PKGBUILD)

if [ "$VERSION" = "$CURRENT_VERSION" ]; then
    echo "Package is already at the latest version ($VERSION)."
    rm pencil-latest.tar.gz
    exit 0
fi

NEW_HASH=$(sha256sum pencil-latest.tar.gz | awk '{print $1}')

sed -i "s/^pkgver=.*/pkgver=$VERSION/" PKGBUILD
sed -i "s/pkgrel=.*/pkgrel=1/" PKGBUILD
sed -i "s/^sha256sums=('[^']*'/sha256sums=('$NEW_HASH'/" PKGBUILD

echo "Updated PKGBUILD. Generating .SRCINFO..."

makepkg --printsrcinfo > .SRCINFO

rm pencil-latest.tar.gz

echo "Done! The package is ready for commit."
echo "Suggested next steps:"
echo "git add PKGBUILD .SRCINFO"
echo "git commit -m \"Update to \$VERSION\""
echo "git push"
