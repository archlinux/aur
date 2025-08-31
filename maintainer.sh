#!/bin/bash
# (for PKGBUILD maintainer)
#
# updates fields in PKGBUILD to latest release.
# We retrieve a file with metadata with lines such as :
#    Name = LTspice 24.1.9
#    ProductVersion = 24.1.9.1
#    URL = https://LTspice.analog.com/download/24.1.9/LTspice64.msi
#    SHA256 = AF93F7916FE70CDF7D99B4E4943AE67A0737C1F2286AD9900BC1DE028A1E987F
# We'll use ProductVersion for our pkver now.

curl -s -o updates.txt https://ltspice.analog.com/download/updates.txt

newversion=$(sed -n -e '/^ProductVersion/s/.*= //p' updates.txt)
newurl=$(sed -n -e '/^URL/s/.*= //p' updates.txt)
newsum=$(sed -n -e '/^SHA256/s/.*= //p' updates.txt)

# echo $newversion
# echo $newurl
# echo $newsum

sed -i -e 's/^pkgver.*/pkgver='$newversion'/' PKGBUILD
sed -i -e "/msi::http/s#http.*msi#$newurl#" PKGBUILD
sed -i -e "s/^installer_sha256.*/installer_sha256='$newsum'/" PKGBUILD

makepkg --printsrcinfo > .SRCINFO
git diff
