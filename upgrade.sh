#!/bin/bash

set -e

current=`grep pkgver= PKGBUILD | cut -d'=' -f 2`
latest=`git -c 'versionsort.suffix=-' ls-remote --tags --sort='v:refname' https://github.com/axllent/mailpit \
	| grep -v '{}' \
	| awk '{ print $2 }' \
	| tail -n 1 \
	| cut -d'/' -f 3 \
	| tr -d 'v'`

if [ $current = $latest ]; then
	echo "nothing to upgrade"
	exit 0
fi

echo "upgrading to $latest"

sed -i "s/pkgver=.*/pkgver=$latest/" PKGBUILD

cat PKGBUILD | sed -n '/#/,/sha256sums/p' | head -n -1 > PKGNEW
mv PKGNEW PKGBUILD

makepkg --skipchecksums -o

makepkg -g >> PKGBUILD
makepkg --printsrcinfo > .SRCINFO

makepkg -si

git add .SRCINFO
git add PKGBUILD
git commit -m "pump to $latest"
