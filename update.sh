#!/bin/bash
set -e

# current version
ver=$(curl -sL https://api.github.com/repos/akiver/cs-demo-manager/releases/latest \
  | jq -r ".tag_name")
ver=${ver:1}
current=$(rg PKGBUILD -e 'pkgver=' | cut -d "=" -f 2)

echo Latest: $ver. Current: $current
if [ $ver = $current ]; then
  echo Nothing to do
  exit
fi

# make sure we don't have outdated tree
git fetch
git pull

# adjust PKGBUILD
sed -i.old "s/pkgver=\(.*\)/pkgver=$ver/" PKGBUILD
updpkgsums

makepkg --verifysource -f
makepkg --printsrcinfo > .SRCINFO

# cleanup
rm CS-Demo-*
rm AKIVER*

# deploy
git add .
git commit -m "[auto] version bump"
git push
