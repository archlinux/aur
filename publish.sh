#!/usr/bin/bash

set -e # exit on error

./clean.sh

# run tests first
dotnet test

# update SRCINFO
makepkg --printsrcinfo > .SRCINFO
(git add .SRCINFO && git commit -m "SRCINFO" && git push) || true

# build the executable
makepkg -Cf --noconfirm

# push to aur
if [ -z "$(git remote | grep aur)" ]; then
  git remote add aur ssh://aur@aur.archlinux.org/rgx-git.git
fi
git push aur
