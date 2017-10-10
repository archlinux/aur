#!/usr/bin/bash
# script courtesy of @papajoke
# modifed by @fhdk
# get last ffver
ffpkgver=$(curl -s "https://ftp.mozilla.org/pub/devedition/releases/" | awk -F'/' '/href.*releases\// {print $5}' | sort -Vr | head -n1)
echo "Latest release  : ${ffpkgver}"
# current pkgver
curpkgver=$(cat PKGBUILD | awk -F'=' '$1=="pkgver"{print $2}')
echo "Current package : ${curpkgver}"
[ "${ffpkgver}" == "${curpkgver}" ] && exit 0
[ -e "PKGBUILD" ] || exit 1
# update PGKBUILD
sed -i -e "s/pkgver=.*/pkgver=${ffpkgver}/" ./PKGBUILD
updpkgsums
makepkg --printsrcinfo >.SRCINFO
rm -f SHA512SUM* *.tar.bz2
git commit PKGBUILD .SRCINFO -m "${ffpkgver}"
git push -u origin
