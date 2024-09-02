#!/usr/bin/env bash
echo "Scraping latest aws-iam-authenticator version from https://api.github.com/repos/kubernetes-sigs/aws-iam-authenticator/releases"
latestversion=$(curl -sq https://api.github.com/repos/kubernetes-sigs/aws-iam-authenticator/releases | jq -r ".[].tag_name" | head -n 1)
echo "Latest aws-iam-authenticator version: ${latestversion}"

echo "==> Updating PKGBUILD version to ${latestversion/v/}-1"
sed -i "s|^pkgver=.*$|pkgver=${latestversion/v/}|; s|^pkgrel=.*$|pkgrel=1|" PKGBUILD
updpkgsums

echo "==> Generating .SRCINFO"
makepkg --printsrcinfo > .SRCINFO
