#!/usr/bin/bash

set -e # exit on error

echo "cleanup"
sudo rm -rf */

echo "update SRCINFO"
makepkg --printsrcinfo > .SRCINFO
(git add .SRCINFO && git commit -m "SRCINFO") || true

echo "push to aur"
if [ -z "$(git remote | grep aur)" ]; then
  git remote add aur ssh://aur@aur.archlinux.org/mc-server-hub-git.git
fi
git push --set-upstream aur master
