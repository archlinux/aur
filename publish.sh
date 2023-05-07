#!/bin/bash

set -e # exit on error

dotnet clean
dotnet build -c Release --sc --use-current-runtime -p:PublishSingleFile=true

# update SRCINFO
git clean -f
git reset --hard
makepkg --printsrcinfo > .SRCINFO
(git add .SRCINFO && git commit -m "SRCINFO" && git push) || true

# push to aur
if [ -z "$(git remote | grep aur)" ]; then
  git remote add aur ssh://aur@aur.archlinux.org/rgx-git.git
fi
git push aur
