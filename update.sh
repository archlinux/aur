makepkg
makepkg --printsrcinfo > .SRCINFO
git add .
git add PKGBUILD .SRCINFO update.sh
git commit -m "update"
git push
