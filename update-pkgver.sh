#!/bin/sh
# Script updating the PKGBUILD and .SRCINFO files.
#
# The script extracts the latest version from the upstream git repository (by
# looking at tags matching vXX.YY and vXX.YY.WW format).  With that it updates
# pkgver, pkgrel and sha256sums variables in PKGBUILD and then attempts to make
# the package inside of a Docker image.
#
# The script sources PKGBUILD file which must therefore be a trusted file.

set -eu

die() {
	echo "${0##*/}: $*" >&2
	exit 1
}

pkgname=urxvt-tabbedex
pkgrel=1
repo=https://github.com/mina86/$pkgname.git

echo ':::: Determining latest version…'
pkgver=$(git ls-remote --tags --refs --sort=-refname "$repo" 'v*.*' | sed -ne '
	\#.*refs/tags/v\([0-9]\+\.[0-9]\+\(\.[0-9]\+\)\?\)$# { s//\1/p; q }
')
test -n "$pkgver" || die 'unable to figure out latest version'
echo ":::: $pkgname $pkgver-$pkgrel"

sed -i -e "
	s/^pkgname=.*/pkgname=$pkgname/
	s/^pkgver=.*/pkgver=$pkgver/
	s/^pkgrel=.*/pkgrel=$pkgrel/
" PKGBUILD

pkgfile=$pkgname-$pkgver-$pkgrel-any.pkg.tar.zst
test ! -e "$pkgfile" || die "$pkgfile: file already exists"

echo
echo ':::: Calculating checksum…'
srcfile=$(bash -euc '. PKGBUILD; wget -c "$source"; echo "${source##*/}"')
sum=$(sha256sum <"$srcfile" | awk '{print $1}')
sed -i "s/^sha256sums=('.*'/sha256sums=('$sum'/" PKGBUILD
echo ":::: $sum $srcfile"

echo
echo ':::: Updating .SRCINFO and building package…'
docker run --rm -v "$PWD:/pkg" -w /pkg archlinux:latest sh -euc '
	useradd -m builder
	chown -R builder .
	pacman -Sy --noconfirm base-devel
	exec su builder -c "
		set -eux; makepkg --printsrcinfo >.SRCINFO; makepkg -d"
'
test -e "$pkgfile" || die "$pkgfile: package file has not been created"

echo
echo ":::: Contents of $pkgfile"
tar tf "$pkgfile"
