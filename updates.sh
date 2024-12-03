#!/bin/bash
echo "updating checksums for PKGBUILD(s)"
updpkgsums
updpkgsums git.PKGBUILD
echo "creating .SRCINFO"
echo "makepkg --printsrcinfo > .SRCINFO"
makepkg --printsrcinfo > .SRCINFO
echo "git add -f" *PKGBUILD " .SRCINFO updates.sh"
echo 'git commit -m " "'
echo "git push"
