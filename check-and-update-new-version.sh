#!/bin/bash

touch lastVersion
lastVersion=`cat lastVersion`
currentVersion=`curl https://www.mkgmap.org.uk/download/mkgmap.html --silent | grep "Download mkgmap release" | sed -rn 's/.*([[:digit:]][[:digit:]][[:digit:]][[:digit:]]).*/\1/p'`

if [ "${lastVersion}" = "${currentVersion}" ]; then
    exit 0
fi

sed -i "s/pkgver=.*/pkgver=${currentVersion}/g" PKGBUILD
updpkgsums
makepkg --printsrcinfo > .SRCINFO
git add PKGBUILD .SRCINFO
git commit -m "release version ${currentVersion}"
git push

echo $currentVersion > lastVersion

rm "mkgmap-r${currentVersion}.zip"

