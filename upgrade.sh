#!/bin/bash

version="$1"
if [ -z "$version" ]; then
  echo -e "Usage:   ./upgrade.sh <version>\nExample: ./upgrade.sh 1.2.3"
  exit 1
fi

cd "$(dirname "$0")"
sed -i 's/^pkgver.*/pkgver='$version'/' PKGBUILD
updpkgsums
makepkg --printsrcinfo > .SRCINFO

