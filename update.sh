#!/usr/bin/env bash

rm -f ./*.xz

# Update the N's version in PKGINFO

updpkgsums
makepkg --printsrcinfo > .SRCINFO

makepkg

namcap PKGBUILD
namcap ./*.xz
