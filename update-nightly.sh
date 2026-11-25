#!/usr/bin/env bash
# Point the PKGBUILD at upstream's current nightly build and refresh checksums/.SRCINFO.
# The nightly release keeps only its latest assets, so run this whenever the build fails
# with a 404 or you want a newer build.
set -euo pipefail
cd "$(dirname "$0")"

tag=$(gh api repos/xbrowsersync/app/releases/tags/nightly \
  --jq '.assets[].name | capture("^xbrowsersync_(?<v>.+)_chromium\\.zip$").v')
[[ -n $tag ]] || { echo "no chromium asset in the nightly release" >&2; exit 1; }

current=$(sed -n 's/^_tag=//p' PKGBUILD)
if [[ $tag == "$current" ]]; then
  echo "already at $tag"
  exit 0
fi

sed -i -e "s/^_tag=.*/_tag=$tag/" -e 's/^pkgrel=.*/pkgrel=1/' PKGBUILD
updpkgsums
makepkg --printsrcinfo > .SRCINFO
echo "$current -> $tag"
