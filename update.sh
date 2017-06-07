#!/bin/sh
git pull
makepkg -f --printsrcinfo > .SRCINFO
RELEASE=$(grep pkgver .SRCINFO | awk "{print \$3}")
git commit -a -m "Update to ${RELEASE}"
