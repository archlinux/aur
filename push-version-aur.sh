# Generate the checksums automatically
sed -i "s/^sha256sums=.*/$(makepkg -g -f -p PKGBUILD)/" ./PKGBUILD

# Generate pagkage metadata
makepkg --printsrcinfo > .SRCINFO

# Push it to AUR
git add PKGBUILD .SRCINFO
git commit -m "New version"
git push
