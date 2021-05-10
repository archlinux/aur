#!/bin/bash

# Automatically set pkgver
VERSION="$(curl -sL 'https://raw.githubusercontent.com/particle-iot/homebrew-brew/main/Formula/prtcl.rb' | grep 'url')"
VERSION="$(echo $VERSION | cut -d ' ' -f2 | tr -d '\"')"
VERSION="${VERSION##*prtcl-v}"
VERSION="${VERSION%*.tar.gz}"
sed -i 's/pkgver=.*$/pkgver='$VERSION'/' PKGBUILD

# Update sums
updpkgsums

# Generate .SRCINFO
makepkg --printsrcinfo > .SRCINFO

# Test makepkg
makepkg -f