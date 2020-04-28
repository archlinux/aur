#!/bin/bash

latest_version=$(curl -Is "https://github.com/snyk/snyk/releases/latest" | grep "location" | sed "s#.*tag/v##g" | tr -d "\r")
echo "Latest Snyk CLI Version: v${latest_version}"

sed -i "s/^pkgver=.*$/pkgver=${latest_version}/" ./PKGBUILD

if ! git diff --quiet HEAD PKGBUILD; then
  updpkgsums

  makepkg --printsrcinfo > .SRCINFO

  makepkg -si

  git add PKGBUILD .SRCINFO

  git commit -m "Updated version to ${latest_version}"

  snyk --version

  git push origin master
else
  echo "No updates found!"
fi
