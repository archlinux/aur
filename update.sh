#!/bin/bash

set -e

echo "Fetching latest release..."
LATEST=$(gh api repos/Rigellute/spotify-tui/releases/latest | jq '.tag_name' -r | cut -c 2-)

CURRENT=$(grep '^pkgver=' PKGBUILD | grep -oEi '[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+')
if [ "$CURRENT" = "$LATEST" ]; then
  echo "Package is up-to-date."
else
  echo "Updating from $CURRENT to $LATEST"
  sed -i 's/^pkgver=.*/pkgver='$LATEST'/' PKGBUILD
  sed -i 's/^pkgrel=.*/pkgrel=1/' PKGBUILD

  updpkgsums
  makepkg --printsrcinfo > .SRCINFO
fi
