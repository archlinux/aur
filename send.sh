#!/usr/bin/env bash

cp PKGBUILD.in PKGBUILD

search() {
   grep "^\\s*$1=" PKGBUILD | sed "s/^\\s*$1=\\([^$]*\\)/\\1/"
}

# Read basic information about the package
pkgname="$(search pkgname)"
pkgver="$(search pkgver)"

# Download the current release
wget "https://github.com/Benni3D/${pkgname}/archive/v${pkgver}.tar.gz" || exit 1

# Change the md5sums
sed -i "s/^md5sums=.*/md5sums=\\('$(md5sum "v${pkgver}.tar.gz" | awk '{print $1}')'\\)/" PKGBUILD

# Clean up
rm "v${pkgver}.tar.gz"

# Generate .SRCINFO

arch=$(. PKGBUILD; echo "${arch[@]}")
license=$(. PKGBUILD; echo "${license[@]}")
get_from_PKGBUILD() {
   grep "^$1=" PKGBUILD | sed "s/$1=/\t$1 = /;s/\${pkgver}/${pkgver}/" | tr -d "\"'()" >> .SRCINFO
}

echo "pkgbase = ${pkgname}" > .SRCINFO
get_from_PKGBUILD pkgdesc
get_from_PKGBUILD pkgver
get_from_PKGBUILD pkgrel
get_from_PKGBUILD url
for a in ${arch}; do
   printf "\tarch = ${a}\n" >> .SRCINFO
done
for a in ${license}; do
   printf "\tlicense = ${a}\n" >> .SRCINFO
done
get_from_PKGBUILD depends
get_from_PKGBUILD optdepends
get_from_PKGBUILD source
get_from_PKGBUILD md5sums
printf "\npkgname = ${pkgname}\n\n" >> .SRCINFO

printf "Send [Yn]: "
read -r confirmation

echo "${confirmation}" | grep -q '[nN]' && exit 1

# Push to AUR repository
git add .
git commit -m "Updated to v${pkgver}"
git push origin master
