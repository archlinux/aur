#!/bin/bash
read -r LOCALVER <<<"$(cat PKGBUILD | grep 'pkgver=' | sed 's/pkgver=//g')"
read -r UNIFONTVER <<<"$(curl -s https://unifoundry.com/pub/unifont/ | grep -Eo 'unifont-[0-9]{1,2}\.[0-9]{1,2}\.[0-9]{1,2}' | tail -1 | sed s/unifont-//g)"

if [ "$LOCALVER" == "$UNIFONTVER" ]; then
	echo "No update available"
	exit 0
fi

echo "New version available: $UNIFONTVER"
if [[ $* == *--dry-run* ]]; then
	exit 0
fi

sed -i "s/pkgver=.*/pkgver=$UNIFONTVER/g" PKGBUILD
echo "Updated version to $UNIFONTVER"

updpkgsums
makepkg --printsrcinfo >.SRCINFO
git add ./PKGBUILD ./.SRCINFO
git commit -m "Version $UNIFONTVER"
git push && git push aur master
