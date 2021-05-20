#!/bin/sh

# Automatically set pkgver
VERSION="$(curl -sL \
    https://api.github.com/repos/dominikbraun/timetrace/releases \
    | jq -r .[].name | head -n1 | tr -d 'v')"

sed -i 's/pkgver=.*$/pkgver='$VERSION'/' PKGBUILD

# Update sums
updpkgsums

# Generate .SRCINFO
makepkg --printsrcinfo > .SRCINFO

# Test makepkg
makepkg -f
