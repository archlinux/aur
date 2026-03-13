#!/bin/bash
VERSION=$(grep '^pkgver=' PKGBUILD | cut -d'=' -f2)

curl -L "https://github.com/SamuelHenriqueDeMoraisVitrio/bspwm-layout-manager/archive/$VERSION.tar.gz" \
  -o "bspwm-layout-manager-$VERSION.tar.gz"

HASH=$(sha256sum "bspwm-layout-manager-$VERSION.tar.gz" | cut -d' ' -f1)

echo "Version: $VERSION"
echo "Hash: $HASH"

rm "bspwm-layout-manager-$VERSION.tar.gz"
