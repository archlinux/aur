#!/bin/bash
read -r LOCALVER <<<"$(cat PKGBUILD | grep 'pkgver=' | sed 's/pkgver=//g')"
read -r UNIFONTVER <<<"$(curl -s https://unifoundry.com/pub/unifont/ | grep -Eo 'unifont-[0-9]{1,2}\.[0-9]{1,2}\.[0-9]{1,2}' | tail -1 | sed s/unifont-//g)"
read -r PKGREL <<<"$(cat PKGBUILD | grep 'pkgrel=' | sed 's/pkgrel=//g')"

PKGREL=1
# TODO: check other sources for changes to determine PKGREL

if [ "$LOCALVER" == "$UNIFONTVER" ]; then
	echo "No update available"
	exit 0
fi

echo "New version available: $UNIFONTVER"
if [[ $* == *--dry-run* ]]; then
	exit 0
fi

sed -i "s/pkgver=.*/pkgver=$UNIFONTVER/g" PKGBUILD
sed -i "s/pkgrel=.*/pkgrel=$PKGREL/g" PKGBUILD
echo "Updated version to $UNIFONTVER-$PKGREL"

updpkgsums
makepkg --printsrcinfo >.SRCINFO
git add ./PKGBUILD ./.SRCINFO
git commit -m "Version $UNIFONTVER-$PKGREL"
git push && git push aur master
