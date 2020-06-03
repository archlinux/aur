#!/bin/bash
updpkgsums
makepkg --printsrcinfo > .SRCINFO
makepkg
pikaur -U *.pkg.tar
rm -rf trilium-* pkg/ src/
git add .
