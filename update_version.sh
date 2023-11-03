#!/bin/bash
# vim: set ft=sh ts=4 sw=4 et:

github_owner=coder
github_project=coder
major_version=2
vers=

set -e
. /usr/share/makepkg/util/util.sh

warning "This script calls out to github's API to determine the latest"
warning "version and build number. Press Ctrl+C within 2 seconds to abort."
sleep 2

if [ -n "$1" ]; then
    vers="$1"; shift
else
    msg "Getting latest ${github_project} release"
    gh_url="https://api.github.com/repos/${github_owner}/${github_project}/git/matching-refs/tags/v${major_version}."
    vers=$(curl -SsLl "${gh_url}" | jq -r 'reverse | .[0].ref' | sed -re 's;^refs/tags/v;;')
    if ! [[ "$vers" =~ ^[0-9]+(\.[0-9]+)+$ ]]; then
		echo "Version string "\""${vers}"\"" doesn't look like a valid version number" >&2
		exit 1
    fi
fi

msg "Using ${github_project} version: ${vers}"

sed -re "s;^pkgver=.+$;pkgver="\""${vers}"\"";" -i PKGBUILD

# replace all checksums with 'SKIP' to retain as a placeholder
sed -zre "s;sha256sums(_[a-z0-9_]+)?=\('([a-f0-9]{64}|SKIP)'(\n *'([a-f0-9]{64}|SKIP)')*\);sha256sums\1=('SKIP');g" -i PKGBUILD

# append new checksums to PKGBUILD
makepkg -g >> PKGBUILD

# delete placeholders
sed -re "/^sha256sums_[a-z0-9_]+=\('SKIP'\)$/ d" -i PKGBUILD

makepkg --printsrcinfo > .SRCINFO
