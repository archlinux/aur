#!/bin/bash
version=`cat PKGBUILD | grep -Po '(?<=pkgver=)[^;]+'`

echo "[*] Start make SRCINFO"
makepkg --printsrcinfo > .SRCINFO
echo "[*] Push to Git repository"
git add PKGBUILD .SRCINFO
echo "[*] Downgrade to fix pre_commit to version $version" 
git commit -m "updating pre_commit to version $version"
git push
echo "[*] Done."

