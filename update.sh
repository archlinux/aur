#!/bin/env bash
set -ex pipefail

PKGNAME=plex-desktop

snap_res="$(curl "https://api.snapcraft.io/v2/snaps/info/${PKGNAME}" \
  -H 'Snap-Device-Series: 16' -L)"

snap_id="$(echo "$snap_res" | jq -r '."snap-id"')"
stable_channel="$(echo "$snap_res" | jq -e '."channel-map"[] | select(.channel.name == "stable")')"

new_revision="$(echo "$stable_channel" | jq -r '.revision')"
new_version="$(echo "$stable_channel" | jq -r '.version')"
new_sha384="$(echo "$stable_channel" | jq -r '.download."sha3-384"')"
new_download="$(echo "$stable_channel" | jq -r '.download.url')"

wget "$new_download"

if [[ "$(sha384sum "${snap_id}_${new_revision}.snap" | cut -d' ' -f1)" == "$new_sha384" ]]; then
  echo "SHA384 did NOT match"
  exit 1
fi

sed -i "s|^\(_snaprev=\).*|\\1$new_revision|g" PKGBUILD
sed -i "s|^\(pkgver=\).*|\\1$new_version|g" PKGBUILD
sed -i "s|^\(pkgrel=\).*|\\11|g" PKGBUILD

updpkgsums
makepkg --printsrcinfo >.SRCINFO
git diff

read -r -p "Continue (Y/n)?" choice
case "$choice" in
y | Y | "") echo "commiting..." ;;
n | N) exit 1 ;;
*) exit 1 ;;
esac

git add PKGBUILD .SRCINFO
git commit -m "Update $PKGNAME to version $new_version"
