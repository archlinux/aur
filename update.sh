#!/usr/bin/env bash
# Update PKGBUILD/.SRCINFO to a Quaver Music release.
#
# Usage:
#   ./update.sh              # latest stable GitHub release
#   ./update.sh 1.7.3        # specific release (v prefix optional)
#
# Requires: curl, jq, makepkg, git (optional, for the final diff).
set -euo pipefail

readonly repo="Team-Quaver/quaver-music"
readonly dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
readonly pkgbuild="$dir/PKGBUILD"
readonly srcinfo="$dir/.SRCINFO"

die() { printf 'error: %s\n' "$*" >&2; exit 1; }

command -v curl >/dev/null || die "curl is required"
command -v jq >/dev/null || die "jq is required"
command -v makepkg >/dev/null || die "makepkg is required"
[[ -f "$pkgbuild" ]] || die "PKGBUILD not found: $pkgbuild"
[[ $# -le 1 ]] || die "usage: $0 [version]"

# Authenticated requests avoid the 60 req/h per-IP limit on the public API.
# Order: GITHUB_TOKEN / GH_TOKEN, then gh's stored credentials, then anonymous.
token="${GITHUB_TOKEN:-${GH_TOKEN:-}}"
api() {
  if [[ -n "$token" ]]; then
    curl -fsSL -H "Authorization: Bearer $token" -H 'Accept: application/vnd.github+json' \
      "https://api.github.com/$1"
  elif command -v gh >/dev/null && gh auth status >/dev/null 2>&1; then
    gh api "$1"
  else
    curl -fsSL -H 'Accept: application/vnd.github+json' "https://api.github.com/$1"
  fi
}

err="$(mktemp)"
trap 'rm -f "$err"' EXIT
if (( $# == 1 )); then
  tag="v${1#v}"
  release="$(api "repos/$repo/releases/tags/$tag" 2>"$err")" \
    || die "release $tag not found: $(tr -d '\n' <"$err")"
else
  release="$(api "repos/$repo/releases/latest" 2>"$err")" \
    || die "failed to query the latest release: $(tr -d '\n' <"$err")"
fi
rm -f "$err"
trap - EXIT

version="$(jq -r '.tag_name | sub("^v"; "")' <<<"$release")"
[[ "$version" =~ ^[0-9]+(\.[0-9]+)+$ ]] \
  || die "unsupported pkgver (expected numeric components): $version"

asset_name="Quaver-${version}-x86_64.AppImage"
asset="$(jq -ce --arg name "$asset_name" '
  .assets[] | select(.name == $name)
' <<<"$release")" || die "release asset not found: $asset_name"

asset_url="$(jq -r '.browser_download_url' <<<"$asset")"
digest="$(jq -r '.digest // ""' <<<"$asset")"

if [[ "$digest" == sha256:* ]]; then
  sha="${digest#sha256:}"
else
  tmp="$(mktemp)"
  trap 'rm -f "$tmp"' EXIT
  printf 'downloading %s\n' "$asset_url" >&2
  curl -fL --retry 3 -o "$tmp" "$asset_url"
  sha="$(sha256sum "$tmp" | cut -d' ' -f1)"
  rm -f "$tmp"
  trap - EXIT
fi
[[ "$sha" =~ ^[0-9a-f]{64}$ ]] || die "invalid sha256 digest: $sha"

sed -i -E \
  -e "s|^pkgver=.*|pkgver=${version}|" \
  -e "s|^pkgrel=.*|pkgrel=1|" \
  -e "s|^sha256sums=\(.*\)|sha256sums=('${sha}')|" \
  "$pkgbuild"

tmp_srcinfo="$(mktemp "$dir/.SRCINFO.XXXXXX")"
trap 'rm -f "$tmp_srcinfo"' EXIT
(
  cd "$dir"
  makepkg --printsrcinfo > "$tmp_srcinfo"
)
chmod 644 "$tmp_srcinfo"
mv "$tmp_srcinfo" "$srcinfo"
trap - EXIT

printf 'updated %s to %s (%s)\n' "$pkgbuild" "$version" "$sha"

if git -C "$dir" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  git -C "$dir" --no-pager diff -- PKGBUILD .SRCINFO
fi
