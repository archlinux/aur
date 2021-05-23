#!/bin/bash

# Automatically set pkgver
VERSION="$(curl -sL 'https://raw.githubusercontent.com/particle-iot/homebrew-brew/main/Formula/prtcl.rb')"
VERSION="${VERSION##*prtcl-v}"
VERSION="${VERSION%%.tar.gz*}"
sed -i 's/pkgver=.*$/pkgver='$VERSION'/' PKGBUILD

# Update sums
updpkgsums

# Test makepkg
makepkg -f

# Generate .SRCINFO
makepkg --printsrcinfo > .SRCINFO
