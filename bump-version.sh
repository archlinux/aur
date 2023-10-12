#!/bin/bash

bump-version() {
	local pkgver=$1
	current_pkgver=$(awk -F= '/^pkgver=/ { print $2 }' ./PKGBUILD )

	if [ "$pkgver" = "$current_pkgver" ]; then
        echo "ERROR: New version is the same as the current one!" >&2
        exit 1
	fi

    set -eo pipefail
	local _hash=$(curl -Ls "https://github.com/ledgerwatch/erigon/archive/refs/tags/v${pkgver}.tar.gz" |
		b2sum | awk '{print $1}')

	sed -i ./PKGBUILD -Ee "/^pkgver=/ s/=.*/=${pkgver}/" \
		-Ee "/^b2sums=/ s/'\\w+'/'${_hash}'/"

	makepkg --printsrcinfo >./.SRCINFO
}

while getopts "h" arg; do
	case $arg in
	h)
		cat << STR
Usage:

    ./bump-version.sh '<new_version>'
STR
		exit 0
		;;
	esac
done

bump-version $@
