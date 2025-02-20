makepkg
makepkg --printsrcinfo > .SRCINFO
rm -rf pkg src peroxide *.zst
git add PKGBUILD .SRCINFO update.sh
git commit -m "update"
git push