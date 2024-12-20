#!/bin/bash

set -eo pipefail

build_ver=`grep ^pkgver= PKGBUILD | cut -d= -f2`
release_ver=`curl --silent 'https://api.github.com/repos/novomesk/qt-heic-image-plugin/releases/latest' | jq -r .tag_name` 
new_ver=`echo -e "${release_ver:1}\n$build_ver" | sort -rV | head -n 1`

if [ $new_ver = $build_ver -a "${initial}x" = "x" ] ; then
    exit
fi

echo "New version available: $new_ver (last build is $build_ver)"
sed -i -e "s/^pkgver=.*/pkgver=$new_ver/" PKGBUILD
sed -i -e "s/^pkgrel=.*/pkgrel=1/" PKGBUILD
updpkgsums -m

echo "Building package"
makepkg --skippgpcheck -CcLm | tee build.log

# Build is successful, will push to aur
makepkg --printsrcinfo > .SRCINFO
git add PKGBUILD .SRCINFO
git commit -m "Released $new_ver-1"
git push
