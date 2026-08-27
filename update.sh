#!/usr/bin/env bash
# Prepare a version bump: query upstream (or use $1 as the version),
# rewrite the PKGBUILD, refresh checksums and .SRCINFO, record the version
# with nvtake. Does not build, commit or push.
set -euo pipefail

cd "$(dirname "$(readlink -f "$0")")"

readonly config=.nvchecker.toml
readonly name=aegisub-dependency-control

current=$(source ./PKGBUILD; echo "$pkgver")

if (( $# )); then
    new=$1
else
    nvchecker -c "$config"
    new=$(nvcmp -c "$config" --all --json | jq -r --arg n "$name" \
        '.[] | select(.name == $n) | .newver')
    [[ -n $new && $new != null ]] || { echo "no version reported for $name" >&2; exit 1; }
fi

if [[ $new == "$current" ]]; then
    echo "Already at $current."
    exit 0
fi
if [[ $(vercmp "$new" "$current") -lt 0 ]]; then
    echo "Refusing downgrade: $current -> $new" >&2
    exit 1
fi

echo "Updating $current -> $new"
sed -i -e "s/^pkgver=.*/pkgver=$new/" -e "s/^pkgrel=.*/pkgrel=1/" PKGBUILD
updpkgsums
makepkg --printsrcinfo > .SRCINFO
nvtake -c "$config" "$name=$new"  # NAME=VERSION, so an explicit $1 is recorded too

echo
git diff --stat -- PKGBUILD .SRCINFO
