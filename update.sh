#!/usr/bin/env bash
# Called by Makefile after version and repository checks.
LATEST_VERSION=${1:?Makefile must supply the checked version}

WORK=$(mktemp -d "$PWD/.release.XXXXXX") || exit 1
trap 'rm -rf -- "$WORK"' EXIT
trap 'exit 130' INT
trap 'exit 143' TERM HUP

cp -- PKGBUILD Makefile kanata-switcher.install "$WORK/" || exit 1
(
    cd "$WORK" || exit 1
    sed --in-place -e "s/^pkgver=.*/pkgver=$LATEST_VERSION/" -e 's/^pkgrel=.*/pkgrel=1/' PKGBUILD || exit 1
    SRCDEST="$WORK" updpkgsums && env --unset=MAKEFLAGS make --no-print-directory lint srcinfo
) || exit 1
mv -- "$WORK/PKGBUILD" PKGBUILD && mv -- "$WORK/.SRCINFO" .SRCINFO || exit 1
git add -- PKGBUILD .SRCINFO Makefile update.sh kanata-switcher.install && git commit --gpg-sign --message "feat: update to $LATEST_VERSION"
