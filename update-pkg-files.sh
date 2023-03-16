#!/bin/bash

# Update SHA256 sums in PKGBUILD
updpkgsums ./PKGBUILD

# Update .SRCINFO file
makepkg --printsrcinfo > .SRCINFO
