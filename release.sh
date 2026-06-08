#!/bin/bash
version=`cat PKGBUILD | grep -Po '(?<=pkgver=)[^;]+'`

echo "[*] Start make SRCINFO"
makepkg --printsrcinfo > .SRCINFO
echo "[*] Push to Git repository"
git add PKGBUILD .SRCINFO
echo "[*] Update firefox-esr to version $version" 
git commit -m "update firefox-esr to version $version"
git push
echo "[*] Done."

