makepkg --printsrcinfo > .SRCINFO
git add .
git commit -m "Update PKGBUILD and .SRCINFO, Read upstream URL commit history for more information."
git push