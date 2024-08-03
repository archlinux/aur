makepkg
makepkg --printsrcinfo > .SRCINFO
rm -rf pkg src Discord-Netflix
rm -rf *.zst *.gz
git add PKGBUILD .SRCINFO update.sh
git commit -m "update"
git push