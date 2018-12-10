#!/usr/bin/env bash

makepkg --nobuild --skipinteg || exit 1

rm -rf pkg/ src/ conky*

namcap PKGBUILD && makepkg --printsrcinfo > .SRCINFO || exit 1
git add . || exit 1 # PKGBUILD prepare4uploadpkg.sh .SRCINFO
git commit -am "Nvidia support again... yes!" || exit 1
git push --set-upstream origin master || exit 1

read -p "Press [Enter] key to exit..."

exit $?
