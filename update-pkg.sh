#!/bin/bash

OLD_VERSION=$(grep -m1 "^pkgver=" PKGBUILD | cut -d'=' -f2)
pkgctl version upgrade
NEW_VERSION=$(grep -m1 "^pkgver=" PKGBUILD | cut -d'=' -f2)

if [ "$OLD_VERSION" = "$NEW_VERSION" ]; then
    echo "already up to date"
    exit 0
fi

if ! makepkg --printsrcinfo > .SRCINFO; then
    echo "Error: Failed to regenerate .SRCINFO"
    git checkout -- PKGBUILD .SRCINFO
    exit 1
fi

echo "Successfully committed update to $NEW_VERSION"
