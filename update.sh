#!/bin/bash

set -ex

version="$1"
[ "$version" ]

localbranch="local/v$version"

git reset --hard
git checkout master
git branch -D "$localbranch" 2>/dev/null || true
git checkout -b "$localbranch"

awkprog='BEGIN { FS = "="; OFS = "=" } { if ($1 == "pkgver") { print "pkgver", "%s" } else { print } }'
awkprog_expand="$(printf "$awkprog" "$version")"

awk -v FS== -v OFS== "$awkprog_expand" <PKGBUILD >PKGBUILD.new
mv PKGBUILD.new PKGBUILD

makepkg --skipchecksums --cleanbuild --force
updpkgsums
mksrcinfo

git commit -a -m "Zstd version $version."

git checkout master
git merge --ff-only "$localbranch"

git show

