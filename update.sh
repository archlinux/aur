#!/usr/bin/env bash

cd "$(dirname "$0")" || exit 255

latest_release="$(
  curl -s https://api.github.com/repos/userdocs/qbittorrent-nox-static/releases/latest |
    jq -r .tag_name |
    tail -c +9 # remove `release-` prefix
)"             # <qbittorrent_version>_v<libtorrent_version>
qbittorrent_version="$(echo -n "$latest_release" | cut -d'_' -f1)"
libtorrent_version="$(echo -n "$latest_release" | cut -d'v' -f2)"

sed -E -i "s/qbittorrent_version=.*/qbittorrent_version=$qbittorrent_version/" ./PKGBUILD
sed -E -i "s/libtorrent_version=.*/libtorrent_version=$libtorrent_version/" ./PKGBUILD

updpkgsums && makepkg --printsrcinfo >./.SRCINFO
git add ./PKGBUILD ./.SRCINFO
git commit -m "${qbittorrent_version}_v${libtorrent_version}:1"

git clean -f
