makepkg
makepkg --printsrcinfo > .SRCINFO
git add PKGBUILD .SRCINFO update.sh
git commit -m "update"
git push
rm -rf jellyfin* pkg src
rm jellyfin-*
