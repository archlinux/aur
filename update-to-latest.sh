#!/usr/bin/env bash

release_data=$(
  curl -s https://api.github.com/repos/project-gauntlet/gauntlet/releases/latest
)

tag_name=$(
  echo "$release_data" | jq -r '.tag_name'
)

hash=$(
  echo "$release_data" \
    | jq -r '.assets[] | select(.browser_download_url | match(".+\\.tar\\.gz")) | .browser_download_url' \
    | wget -q -i - -O - \
    | sha256sum \
    | awk '{print $1}'
)

version=${tag_name#v} # remove v prefix

sed -i -E "s/pkgver=(.+)/pkgver=$version/" PKGBUILD
sed -i -E "s/sha256sums=\\('(.+)'\\)/sha256sums=\\('$hash'\\)/" PKGBUILD

makepkg --printsrcinfo > .SRCINFO

git add .SRCINFO PKGBUILD
git commit -m "Gauntlet $tag_name"
git push