#!/bin/bash

read -p "Enter the new pkgver: " pkgver
read -p "Enter the new pkgrel: " pkgrel

sed -i "s/^pkgver=.*$/pkgver=${pkgver}/" ./PKGBUILD
sed -i "s/^pkgrel=.*$/pkgrel=${pkgrel}/" ./PKGBUILD

if ! git diff --quiet HEAD PKGBUILD; then

  if pacman -Qi pacman-contrib > /dev/null 2>&1; then
    updpkgsums
  else
    echo "Install pacman-contrib with 'pacman -S pacman-contrib'"
    exit 1
  fi

  makepkg --printsrcinfo > .SRCINFO

  makepkg -si

  git add .

  git commit -m "Updated version to ${pkgver}-${pkgrel}"

  git push origin master
else
  echo "No updates found!"
fi