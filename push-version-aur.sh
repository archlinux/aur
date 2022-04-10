# Generate the checksums automatically
sed -i "s/^sha256sums=.*/$(makepkg -g -f -p PKGBUILD)/" ./PKGBUILD

# Generate pagkage metadata
makepkg --printsrcinfo > .SRCINFO

# Push it to AUR
git add PKGBUILD .SRCINFO
git commit -m "New version"
git push ssh://aur@aur.archlinux.org/wofi-calc-git.git master

# Bye
echo -e "\n-------------------------------------------------------------------"
echo -e "NEW VERSION GENERATED\n"
