#!/bin/bash

set -e # exit on error

dotnet clean
dotnet build -c Release

# update SRCINFO
makepkg --printsrcinfo > .SRCINFO
git clean -f
git reset --hard
(git add .SRCINFO && git commit -m "SRCINFO" && git push) || true

# push to aur
if [ -z "$(git remote | grep aur)" ]; then
  git remote add aur ssh://aur@aur.archlinux.org/rgx-git.git
fi
git push aur
