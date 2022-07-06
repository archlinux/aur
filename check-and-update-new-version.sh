#!/bin/bash

touch lastVersion
lastVersion=`cat lastVersion`
currentVersion=`curl https://www.mkgmap.org.uk/download/mkgmap.html --silent | grep "Download mkgmap release" | sed -rn 's/.*([[:digit:]][[:digit:]][[:digit:]][[:digit:]]).*/\1/p'`

if [ -z "${currentVersion}" ]; then
    echo "mkgmap.org.uk is down or the version number could not be parsed"
    exit -1
fi

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

