#!/bin/bash
if [ -z "$1" ]; then
    echo "You must specify the target version for the auto-update."
    exit 1
fi

echo "Trying to auto-update this package to version ${1} ..."
sed -ri 's/pkgver=([0-9]+\.[0-9]+\.[0-9]+\.{0,1}[0-9]*)/pkgver='"${1}"'/' PKGBUILD 
if [ "$?" -ne 0 ]; then
    echo "Setting the version number in PKGBUILD failed."
    exit 1
fi

updpkgsums
if [ "$?" -ne 0 ]; then
    echo "Updating the checksums failed."
    exit 1
fi

makepkg --printsrcinfo > .SRCINFO
if [ "$?" -ne 0 ]; then
    echo "Recreating .SRCINFO failed."
    exit 1
fi

makepkg -si --noconfirm
if [ "$?" -ne 0 ]; then
    echo "Building and installing the package failed."
    exit 1
fi

echo "Autoupdate successful. Ready to add, commit and push the changes."
