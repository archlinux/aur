#!/usr/bin/env bash
# Author: Chmouel Boudjnah <chmouel@chmouel.com>
set -eufo pipefail
NPM_PACKAGE="${NPM_PACKAGE:-@github/copilot}"

latest=$(curl -s "https://registry.npmjs.org/${NPM_PACKAGE}/latest" | jq -r '.version')
pkgversion=$(grep '^pkgver=' PKGBUILD)
pkgversion=${pkgversion#pkgver=}

if [[ ${pkgversion} != "${latest}" ]]; then
  echo "Updating PKGBUILD from ${pkgversion} to ${latest}"
  sed -i "s/pkgver=${pkgversion}/pkgver=${latest}/" PKGBUILD
else
  echo
  printf "\033[3;31mPKGBUILD is already up to date with version %s\033[0m\n" "${pkgversion}"
  exit 0
fi

updpkgsums && makepkg --printsrcinfo >.SRCINFO
makepkg -srif
git commit -m "Bump to ${latest}" PKGBUILD .SRCINFO
git clean -f .