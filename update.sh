#!/usr/bin/env bash

rm -rf pkg
rm -rf src
rm -f ./*.xz
rm -f ./*.zip

# Update the N's version in PKGINFO

updpkgsums
makepkg --printsrcinfo > .SRCINFO

makepkg

namcap PKGBUILD
namcap ./*.xz
