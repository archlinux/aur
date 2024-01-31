#!/usr/bin/env bash

set -e

# This script requires wget and jq, but they don't need to be in makedepends because only the package maintainer runs this script.

VERSION=$(wget --quiet -O - https://api.github.com/repos/Browsers-software/browsers/releases/latest | jq -r .tag_name)
SHA=$(wget --quiet -O - https://github.com/Browsers-software/browsers/releases/download/$VERSION/browsers_linux.tar.xz.sha256)
sed -i "s/pkgver=.*$/pkgver=$VERSION/" PKGBUILD
sed -i "s/sha256sums=.*$/sha256sums=(\"$SHA\")/" PKGBUILD
makepkg
makepkg --printsrcinfo > .SRCINFO
git add .
git commit -m "Upgrade to v$VERSION"
