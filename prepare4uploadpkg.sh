#!/usr/bin/env bash

makepkg --nobuild --skipinteg

sum() {
	openssl dgst -sha256 "$1" | sed 's/^.*= //'
}

replace() {
	echo "s/^sha256sums=('.*')/sha256sums=('$(sum "$1")')/"
}

sed -i "$(replace United-Arch.tar.gz)" PKGBUILD

rm -rfv src/ United-Arch/ United-Arch.tar.gz gtk-theme-united-archers-git-*.tar.xz

namcap PKGBUILD
makepkg --printsrcinfo > .SRCINFO
git add . # PKGBUILD prepare4uploadpkg.sh .SRCINFO
git commit -m "New package commit"
git push

exit
