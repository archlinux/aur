#!/bin/bash
wget -O teamcity.json "https://data.services.jetbrains.com/products/releases?code=TC&latest=true&type=release&downloads=linux"
downloadLink=`JSON.sh -b < teamcity.json | grep '\["TC",0,"downloads","linux","link"\]' | sed -r 's/.*(https.*)"/\1/'`
checksumLink=`JSON.sh -b < teamcity.json | grep '\["TC",0,"downloads","linux","checksumLink"\]' | sed -r 's/.*(https.*)"/\1/'`
pkgver=`JSON.sh -b < teamcity.json | grep '\["TC",0,"version"\]' | cut -f2 | cut -d "\"" -f2`

wget $downloadLink
wget $checksumLink

checksumFile=$(sed -r 's|.*/(.*\.tar\.gz\.sha256)|\1|' <<< $checksumLink)
downloadFile=$(sed -r 's|.*/(.*\.tar\.gz)|\1|' <<< $downloadLink)

sha256sum --status -c "$checksumFile"
if [ $? -eq 0 ]; then
    checksum=`sha512sum 'TeamCity-2017.1.4.tar.gz' | cut -d " " -f1`
    sed -ri "s/pkgver=.*/pkgver=$pkgver/" ./PKGBUILD
    sed -ri "s/sha512sums=\('.*'/sha512sums=\('$checksum'/" ./PKGBUILD
    sed -ri "s|source=\(.*|source=\('$downloadLink'|" ./PKGBUILD
    makepkg --printsrcinfo > .SRCINFO
    rm $checksumFile
    rm $downloadFile
else
    echo "An error occured"
fi
