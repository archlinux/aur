#!/bin/bash
set -e

echo "Update the verion in PKGBUILD"
echo "Hit enter when done"
read
head -n -2 PKGBUILD > PKGBUILD.NEW
mv PKGBUILD.NEW PKGBUILD
rm -f vanta-amd64.deb
makepkg -g >> PKGBUILD
makepkg --printsrcinfo > .SRCINFO
makepkg --verifysource -f
makepkg -srf

echo "Testing locally"
docker build . -t arch:pkgtest
docker run -it -v $(pwd):/home/builduser arch:pkgtest bash -c "cd /home/builduser && read && makepkg -si"

echo "To test once published: docker run -it --rm thann/yay vanta-agent"
