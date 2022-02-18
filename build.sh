#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $1 <version>"; exit 1
fi

sed -i 's/^pkgver=.*$/pkgver='"$1"'/' PKGBUILD
git add PKGBUILD
git commit -m "Updated to v$1"
git tag "v$1"
git push --all
updpkgsums