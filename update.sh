#!/bin/bash
set -e

makepkg -sf
updpkgsums
makepkg --printsrcinfo > .SRCINFO

CURRENT_VERSION=$(grep "pkgver=" PKGBUILD)
CURRENT_VERSION=${CURRENT_VERSION#*=}

echo "CURRENT_VERSION: ${CURRENT_VERSION}"
git commit -v -a -m "Update to ${CURRENT_VERSION}"

