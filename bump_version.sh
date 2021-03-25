#!/bin/bash

echo "Obtaining version information..."
CURRENT_SHELL_VERSION=$(grep -i pkgver= PKGBUILD | cut -d '=' -f 2)
LATEST_SHELL_VERSION=$(basename $(git -c 'versionsort.suffix=-' ls-remote --tags --sort='v:refname' git@github.com:Stremio/stremio-shell.git 'v*[0-9].*[0-9].*[0-9]' | tail -n 1 | cut -d $'\t' -f 2))
LATEST_SHELL_VERSION=${LATEST_SHELL_VERSION/v/}

if [ "$CURRENT_SHELL_VERSION" = "$LATEST_SHELL_VERSION" ]; then
  echo "Currently Stremio is at $CURRENT_SHELL_VERSION. This is the latest version."
  exit 0
fi

echo "Bumping shell version $CURRENT_SHELL_VERSION -> $LATEST_SHELL_VERSION"
sed -i "s/pkgver=.*/pkgver=$LATEST_SHELL_VERSION/ ; s/pkgrel=.*/pkgrel=0/" PKGBUILD
makepkg --printsrcinfo > .SRCINFO

