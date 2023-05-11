#!/bin/bash
read -r LOCALVER <<<"$(cat PKGBUILD | grep 'pkgver=' | sed 's/pkgver=//g')"
read -r DOPPLERVER <<<"$(wget --quiet https://github.com/DopplerHQ/cli/releases/latest -O /dev/stdout | grep -Eo 'Release [0-9]{1,2}\.[0-9]{1,2}\.[0-9]{1,2}' | head -n 1 | sed 's/Release //g')"

if [ "$DOPPLERVER" = "" ]; then
  echo "Doppler version undefined: $DOPPLERVER"
  echo "Exiting!"
  exit 0
fi

if [ "$LOCALVER" == "$DOPPLERVER" ]; then
	echo "No update available"
	exit 0
fi

echo "New version available: $DOPPLERVER"
if [[ $* == *--dry-run* ]]; then
	exit 0
fi

sed -i "s/pkgver=.*/pkgver=$DOPPLERVER/g" PKGBUILD
echo "Updated version to $DOPPLERVER"

updpkgsums
makepkg --printsrcinfo >.SRCINFO
git add ./PKGBUILD ./.SRCINFO
git commit -m "Version $DOPPLERVER"
git push && git push aur master
