#/bin/bash

set -e

echo Removing old artifacts
rm eobcanka-* eObcanka.deb || true

echo
echo Running makepkg build
makepkg

echo
echo Writing new SRCINFO
makepkg --printsrcinfo > .SRCINFO
