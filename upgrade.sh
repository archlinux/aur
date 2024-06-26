#!/usr/bin/env bash

set -e

# This script requires wget and jq, but they don't need to be in makedepends because only the package maintainer runs this script.

VERSION=$(wget --quiet -O - https://api.github.com/repos/gristlabs/grist-desktop/releases/latest | jq -r .tag_name)
VERSION=${VERSION/v/}
sed -i "s/pkgver=.*$/pkgver=$VERSION/" PKGBUILD
updpkgsums
makepkg --printsrcinfo > .SRCINFO
makepkg
git add .
git commit -m "Upgrade to v$VERSION"
