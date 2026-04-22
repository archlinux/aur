#!/usr/bin/env bash
set -euo pipefail

pkgname="pi-ext-powerline-footer"
current_pkgver="$(awk -F= '/^pkgver=/{print $2}' PKGBUILD)"
# Query upstream using structured logs
nvlog="$(mktemp)"
trap 'rm -f "$nvlog"' EXIT
nvchecker -c .nvchecker.toml --logger=json >"$nvlog"

latest_pkgver="$(jq -r --arg p "$pkgname" 'select((.event == "updated" or .event == "up-to-date") and .name == $p) | .version' "$nvlog" | tail -n1)"

if [[ -z "$latest_pkgver" || "$latest_pkgver" == "null" ]]; then
  echo "nvchecker returned no version for $pkgname" >&2
  exit 1
fi

if [[ "$latest_pkgver" == "$current_pkgver" ]]; then
  echo "$pkgname is up to date ($current_pkgver)"
  exit 0
fi

echo "Updating $pkgname: $current_pkgver -> $latest_pkgver"

tmp="$(mktemp)"
awk -v v="$latest_pkgver" '
  /^pkgver=/ { print "pkgver=" v; next }
  /^pkgrel=/ { print "pkgrel=1"; next }
  { print }
' PKGBUILD >"$tmp"
mv "$tmp" PKGBUILD

updpkgsums
makepkg --printsrcinfo >.SRCINFO
makepkg -s --nobuild
namcap PKGBUILD

# Mark this version as accepted/processed
nvtake -c .nvchecker.toml "$pkgname"

echo "Done. Review diff, then commit."
