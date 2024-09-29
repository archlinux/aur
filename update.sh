makepkg
makepkg --printsrcinfo > .SRCINFO
rm -rf pkg src phantom *.zst
git add .
git add PKGBUILD .SRCINFO update.sh
git commit -m "update"
git push

