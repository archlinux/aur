#!/bin/bash

pkgver=$(awk -F= '/^pkgver=/{print $2}' PKGBUILD)
repo=$(awk -F'/' '/^url=/{print $4"/"$5}' PKGBUILD)
latest=$(curl -s https://api.github.com/repos/$repo/releases/latest | awk -F\" '/tag_name/{print $4}')

sed -i -e "s/^pkgver=.*/pkgver=${latest}/" PKGBUILD

if (git diff --exit-code PKGBUILD); then
	echo "Package has most recent version ${latest}"
	exit 0
fi

sed -i -e 's/pkgrel=.*/pkgrel=1/' PKGBUILD

if command -v /usr/local/bin/printsrcinfo > /dev/null; then
  /usr/local/bin/printsrcinfo > .SRCINFO
else
  makepkg --printsrcinfo > .SRCINFO
fi

git add PKGBUILD .SRCINFO
git commit -m "update ${latest}"
git push
