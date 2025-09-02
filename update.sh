#!/bin/bash
set -euo pipefail

pkgbuild=$(grep pkgrel PKGBUILD | tr -d '[:space:]')
srcinfo=$(grep pkgrel .SRCINFO | tr -d '[:space:]')
echo "pkgbuild: $pkgbuild srcinfo: $srcinfo"

if [ $pkgbuild == $srcinfo ]; then
	echo "Error: pkgrel value not updated"
	exit 1
fi

makepkg --printsrcinfo > .SRCINFO
echo "pkgbuild: $pkgbuild srcinfo: $srcinfo"

git commit -a -m 'Updated PKGBUILD'
git push
