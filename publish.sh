#!/bin/bash

set -e # exit on error

# make prebuilt executable
dotnet clean
dotnet publish -c Release --use-current-runtime

# update SRCINFO
git clean -f
git reset --hard
makepkg --printsrcinfo > .SRCINFO
(git add .SRCINFO && git commit -m "SRCINFO" && git push) || true

# verify that makepkg works
makepkg -Cc --noconfirm

# push to aur
if [ -z "$(git remote | grep aur)" ]; then
  git remote add aur ssh://aur@aur.archlinux.org/rgx-git.git
fi
git push aur
