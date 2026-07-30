#!/bin/bash
set -euo pipefail

if [[ ! -f PKGBUILD ]]; then
	echo "no pkgbuild" >&2
	exit 1
fi

makepkg --nobuild --noprepare --clean >/dev/null

pkgver=$(grep -m1 '^pkgver=' PKGBUILD | cut -d= -f2)
if [[ -z "$pkgver" ]]; then
	echo "failed get pkgver" >&2
	exit 1
fi

updpkgsums
makepkg --printsrcinfo > .SRCINFO

rm -rf src shit

if git diff --quiet -- PKGBUILD .SRCINFO; then
	echo "unchanged"
	exit 0
fi

git diff -- PKGBUILD .SRCINFO

read -rp "commit and push update to $pkgver? [Y/n] " reply
if [[ -n "$reply" && ! "$reply" =~ ^[Yy]$ ]]; then
    echo "aborted"
    exit 0
fi

git commit -am "update to $pkgver"
git push
