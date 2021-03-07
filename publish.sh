#!/bin/bash

set -e -o pipefail

source 'PKGBUILD'

release=$(curl -fsS https://api.github.com/repos/jhaals/yopass/releases/latest)
version=$(echo "$release" | jq -r .tag_name)
if [ "$version" == "$pkgver" ]; then
  echo "Nothing to be done, latest version $version already published." >&2
  exit 1
fi

url=${source#*::}
url=${url//$pkgver/$version}
sha512sum=$(curl -fLsS -o - "$url" | shasum -a 512 | cut -d\  -f1)
sed -E -e "s/pkgver=$pkgver/pkgver=$version/" -e "s/sha512sums=\('[a-f0-9]+'\)/sha512sums=('$sha512sum')/" -i PKGBUILD

makepkg --printsrcinfo > .SRCINFO
makepkg -crfC

changelog=$(echo "$release" | jq -r .body)
date=$(echo "$release" | jq -r .published_at | cut -dT -f1)
echo -e "## $version ($date)\n\n$changelog\n\n$(cat CHANGELOG.md)" > CHANGELOG.md

git add .SRCINFO CHANGELOG.md PKGBUILD
git commit --edit --message "Publish yopass $version" --verbose
git push origin master
