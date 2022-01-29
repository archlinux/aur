#!/bin/bash

function die() {
	echo "$@"
	exit 1
}

[ -f PKGBUILD ] || die "Could not find PKGBUILD"

tag="$(sed -n 's/^_tag="\?\([^"]*\)"\?.*$/\1/p' PKGBUILD)"
repo="$(sed -n 's/^_repo="\?\([^"]*\)"\?.*$/\1/p' PKGBUILD)"

commit="$(git ls-remote -q --tags "$repo" "$tag" | cut -f1 | tr -cd a-zA-Z0-9 )"

if [[ -z $commit ]] ; then
	die "could not find commit id for tag $tag on $repo"
else
	sed -i "s/^_commit=.*$/_commit=$commit/" PKGBUILD
fi
