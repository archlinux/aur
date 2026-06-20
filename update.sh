#!/usr/bin/env bash

sed -i "s/\$sha256sums=/$(makepkg --geninteg)/" PKGBUILD
makepkg --printsrcinfo > .SRCINFO

if [[ "$1" == "and_upload" ]]; then
    git add .
    git commit -m 'automatic update'
    git push
fi