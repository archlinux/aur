#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# Update PKGBUILD and .SRCINFO for given version, push changes to AUR

REPO="https://github.com/airbrake/airbrake-cli"

version="$1"
pkgrel="${2:-1}"

checksum_file="${REPO}/releases/download/v${version}/airbrake_${version}_checksums.txt"
checksum="$(curl -sL "$checksum_file" | grep 'linux' | cut -d ' ' -f 1)"

sed -i "s/pkgver=.*/pkgver=$version/" PKGBUILD && echo "Updated pkgver to $version"
sed -i "s/sha256sums=.*/sha256sums=('$checksum')/" PKGBUILD && echo "Updated checksum"
sed -i "s/pkgrel=.*/pkgrel=$pkgrel/" PKGBUILD && echo "Updated pkgrel to $pkgrel"

# Check PKGBUILD sanity
namcap PKGBUILD && echo "PKGBUILD is sane"

makepkg --printsrcinfo >.SRCINFO && echo "Updated .SRCINFO"

# make sure it builds
makepkg --syncdeps

# check package sanity
namcap "airbrake-cli-${version}-${pkgrel}-x86_64.pkg.tar.zst" && echo "Package is sane"

git add PKGBUILD .SRCINFO
git commit -m "Update to v${version} release ${pkgrel}"
git push

echo "Successfully updated to v${version} release ${pkgrel}"

# clean up
rm -rf \
	./src \
	./pkg \
	"airbrake-cli-${version}-${pkgrel}-x86_64.pkg.tar.zst" \
	"airbrake_${version}_linux_x86_64.tar.gz"
