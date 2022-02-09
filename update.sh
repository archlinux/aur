#!/bin/sh 
makepkg --printsrcinfo > .SRCINFO
git add PKGBUILD .SRCINFO
read -p "Commit message:" msg
git commit -m $msg
git push
