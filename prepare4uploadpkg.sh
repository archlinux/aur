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

namcap PKGBUILD && makepkg --printsrcinfo > .SRCINFO || exit 1
git add . || exit 1 # PKGBUILD prepare4uploadpkg.sh .SRCINFO
git commit -am "New package commit" || exit 1
git push --set-upstream origin master || exit 1

###read -p "Press [Enter] key to exit..."

exit $?
