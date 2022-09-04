#!/bin/bash

# Get version for PKGBUILD file
[ ! -d wofi-pass.git ] && git clone https://github.com/TinfoilSubmarine/wofi-pass.git wofi-pass.git
(cd wofi-pass.git && git pull)
VERSION=r$(cd wofi-pass.git && git rev-list --count HEAD).$(cd wofi-pass.git && git rev-parse --short HEAD)

# Update PKGBUILD file
CHACKSUM=$(sha512sum wofi-pass.git/wofi-pass | awk '{ print $1 }')
sed -i "s|pkgver.*|pkgver=${VERSION}|" PKGBUILD
sed -i "s|sha512sums.*|sha512sums=('${CHACKSUM}')|" PKGBUILD

# Update source info
makepkg --printsrcinfo > .SRCINFO

# Monky Test
makepkg -sri

# Cleanup
[ -d pkg ] && rm -fr pkg
[ -d src ] && rm -fr src
[ -f wofi-pass ] && rm wofi-pass
