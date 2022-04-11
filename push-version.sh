# Generate checksums
sed -i "s/^sha256sums=.*/$(makepkg -g -f -p PKGBUILD)/" ./PKGBUILD

# Generate metadata
makepkg --printsrcinfo > .SRCINFO

# Add and push to git
git add PKGBUILD .SRCINFO
git commit
git push
