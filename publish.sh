#!/bin/bash

set -e # exit on error
tar="rgx.tar.gz"

git pull
dotnet clean
dotnet build -c Release

# update SRCINFO
makepkg --printsrcinfo > .SRCINFO
git reset || true
(git add .SRCINFO && git commit -m "SRCINFO" && git push) || true

# create tarball
rm -f "$tar" || true
tar -zcvf "$tar" LICENSE PKGBUILD .SRCINFO rgx.csproj ./**.cs bin/Release/net6.0

# push to aur
if [ -z "$(git remote | grep aur)" ]; then
  git remote add aur ssh://aur@aur.archlinux.org/rgx-git.git
fi
git push aur
