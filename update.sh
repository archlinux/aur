#!/usr/bin/env bash

set -euo pipefail

ver="$(curl -sSL "https://api.github.com/repos/raxod502/pass-ln/releases/latest" | jq -r .tag_name | sed 's/^v//')"

rm -rf tmp
mkdir -p tmp
wget "https://github.com/raxod502/pass-ln/releases/download/v${ver}/pass-ln-pkgbuild-${ver}.tar.gz" -O tmp/pass-ln-pkgbuild.tar.gz

tar -xf tmp/pass-ln-pkgbuild.tar.gz --strip-components=1
makepkg --printsrcinfo > .SRCINFO

git add .
git commit -m "pass-ln ${ver}"
git show
