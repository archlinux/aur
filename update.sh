#!/bin/bash
set -e

# current version
ver=$(curl -sL https://api.github.com/repos/akiver/cs-demo-manager/releases/latest \
  | jq -r ".tag_name")
ver=${ver:1}

echo Found version $ver. Adjusting PGKBUILD.
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
