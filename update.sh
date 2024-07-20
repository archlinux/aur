#!/bin/bash

latest_version=$(curl -s "https://opera-versions.flawcra.cc" | grep -oP '(?<="latest":")[^"]*')
echo "Latest Opera Version: v${latest_version}"

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

  git add PKGBUILD .SRCINFO

  git commit -m "Updated version to ${latest_version}"

  #git push origin master
else
  echo "No updates found!"
fi
