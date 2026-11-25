#!/usr/bin/env bash
# Bump to upstream's latest GitHub release, provided addons.mozilla.org already has the
# same version (the Firefox XPI comes from AMO because it is Mozilla-signed).
set -euo pipefail
cd "$(dirname "$0")"

tag=$(gh api repos/dhowe/AdNauseam/releases/latest --jq .tag_name)
ver=${tag#v}
read -r amo_ver amo_file < <(curl -fsS https://addons.mozilla.org/api/v5/addons/addon/adnauseam/ \
  | jq -r '"\(.current_version.version) \(.current_version.file.id)"')

current=$(sed -n 's/^pkgver=//p' PKGBUILD)
if [[ $ver == "$current" ]]; then
  echo "already at $ver"
  exit 0
fi
if [[ $amo_ver != "$ver" ]]; then
  echo "GitHub is at $ver but AMO is at $amo_ver: wait for AMO" >&2
  exit 1
fi

sed -i -e "s/^pkgver=.*/pkgver=$ver/" -e 's/^pkgrel=.*/pkgrel=1/' \
  -e "s/^_amo_file=.*/_amo_file=$amo_file/" PKGBUILD
updpkgsums
makepkg --printsrcinfo > .SRCINFO
echo "$current -> $ver"
