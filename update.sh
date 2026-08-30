#!/bin/bash

set -euo pipefail

CI_MODE=false
if [[ "$*" == *"--ci"* ]]; then
  CI_MODE=true
  echo "Running in CI mode - will skip commit operations"
fi

if ! command -v jq >/dev/null 2>&1; then
  echo "Install jq with 'pacman -S jq'"
  exit 1
fi

latest_version=$(curl -fsSL "https://api.github.com/repos/krille-chan/fluffychat/releases?per_page=20" | jq -er 'first(.[] | select(.draft == false and .prerelease == false and any(.assets[]; .name == "fluffychat-linux-x64.tar.gz")) | .tag_name | ltrimstr("v"))')
echo "Latest FluffyChat version: v${latest_version}"

sed -i "s/^pkgver=.*$/pkgver=${latest_version}/" ./PKGBUILD

if ! git diff --quiet HEAD PKGBUILD; then

  if pacman -Qi pacman-contrib > /dev/null 2>&1; then
    updpkgsums
  else
    echo "Install pacman-contrib with 'pacman -S pacman-contrib'"
    exit 1
  fi

  makepkg --printsrcinfo > .SRCINFO

  makepkg -si

  if [ "$CI_MODE" = false ]; then
    # Only commit if not in CI mode
    git add PKGBUILD .SRCINFO
    git commit -m "Updated version to ${latest_version}"
    git push origin master
  else
    echo "Skipping commit in CI mode"
  fi
else
  echo "No updates found!"
fi
