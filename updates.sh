#!/bin/bash
echo "updating checksums and version for PKGBUILD"
updpkgsums
echo "creating .SRCINFO"
makepkg --printsrcinfo > .SRCINFO
echo "don't forget to increment pkgrel if you edited the PKGBUILD"
echo
echo "git add -f PKGBUILD .SRCINFO updates.sh test.sh"
echo 'git commit -m " "'
