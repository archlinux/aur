#!/bin/bash

pkgname="liteloader-qqnt-mspring-theme-bin"
pkgver=""

while true; do
	echo -n "> "
	read -r pkgver
	sed -i "s/^pkgver=.*$/pkgver='${pkgver}'/g" PKGBUILD
	makepkg --verifysource
	sed -i "s/^sha256sums=.*$/sha256sums=('$(sha256sum ${pkgname}-${pkgver}.zip | awk '{ print $1 }')')/g" PKGBUILD
	sed -i "s/^b2sums=.*$/b2sums=('$(b2sum ${pkgname}-${pkgver}.zip | awk '{ print $1 }')')/g" PKGBUILD
	makepkg -sif
	kill $!
	linuxqq &>/dev/null &
	makepkg --printsrcinfo >.SRCINFO
	git add PKGBUILD .SRCINFO
	git commit -m "Upgrade to ${pkgver}"
done
