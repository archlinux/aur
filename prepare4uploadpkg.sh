#!/usr/bin/env bash

makepkg --nobuild --skipinteg

rm -rf src/ macOS-Sierra/ gtk-theme-macOS-Sierra-archers-git-*.tar.xz

namcap PKGBUILD
makepkg --printsrcinfo > .SRCINFO
git add . # PKGBUILD prepare4uploadpkg.sh .SRCINFO
git commit -m "New package commit"
git push --set-upstream origin master

exit
