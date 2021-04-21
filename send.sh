#!/bin/sh -e

PROG="fuse-tar"

cp ../PKGBUILD PKGBUILD

# Read the package version
pkgver=$(grep '^pkgver=' PKGBUILD | sed 's/pkgver=//')

# Download the current release
wget "https://github.com/Benni3D/${PROG}/archive/v${pkgver}.tar.gz"

# Change the md5sums
sed -i "s/^md5sums=.*/md5sums=\\('$(md5sum v${pkgver}.tar.gz | awk '{print $1}')'\\)/" PKGBUILD

# Clean up
rm v${pkgver}.tar.gz

# Generate .SRCINFO
change() {
   grep "^$1=" PKGBUILD | sed "s/$1=/\t$1 = /;s/\${pkgver}/${pkgver}/" | tr -d "\"'()" >> .SRCINFO
}
echo "pkgbase = ${PROG}" > .SRCINFO
change pkgdesc
change pkgver
change pkgrel
change url
change arch
change license
change depends
change optdepends
change source
change md5sums
printf "\npkgname = ${PROG}\n\n" >> .SRCINFO

# Push to AUR repository
git add .
git commit -m "Update"
git push origin master
