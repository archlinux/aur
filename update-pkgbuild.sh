#!/usr/bin/env bash
set -euo pipefail

repo='https://downloads.claude.ai/claude-desktop/apt/stable'
pkgbuild='PKGBUILD'

latest_for_arch() {
  local deb_arch="$1"
  curl -fsSL "${repo}/dists/stable/main/binary-${deb_arch}/Packages" |
    awk '
      BEGIN { RS=""; FS="\n" }
      /Package: claude-desktop/ {
        version = filename = sha256 = ""
        for (i = 1; i <= NF; i++) {
          if ($i ~ /^Version: /) { sub(/^Version: /, "", $i); version = $i }
          if ($i ~ /^Filename: /) { sub(/^Filename: /, "", $i); filename = $i }
          if ($i ~ /^SHA256: /) { sub(/^SHA256: /, "", $i); sha256 = $i }
        }
        print version "\t" filename "\t" sha256
      }
    ' |
    sort -V |
    tail -n1
}

amd64="$(latest_for_arch amd64)"
arm64="$(latest_for_arch arm64)"

amd64_ver="${amd64%%$'\t'*}"
arm64_ver="${arm64%%$'\t'*}"
amd64_sha="${amd64##*$'\t'}"
arm64_sha="${arm64##*$'\t'}"
current_ver="$(awk -F= '/^pkgver=/ { print $2; exit }' "${pkgbuild}")"

if [[ "${amd64_ver}" != "${arm64_ver}" ]]; then
  printf 'Version mismatch: amd64=%s arm64=%s\n' "${amd64_ver}" "${arm64_ver}" >&2
  exit 1
fi

sed -i \
  -e "s/^pkgver=.*/pkgver=${amd64_ver}/" \
  -e "s/^sha256sums_x86_64=.*/sha256sums_x86_64=('${amd64_sha}')/" \
  -e "s/^sha256sums_aarch64=.*/sha256sums_aarch64=('${arm64_sha}')/" \
  "${pkgbuild}"

if [[ "${current_ver}" != "${amd64_ver}" ]]; then
  sed -i -e "s/^pkgrel=.*/pkgrel=1/" "${pkgbuild}"
fi

makepkg --printsrcinfo > .SRCINFO
printf 'Updated %s to %s\n' "${pkgbuild}" "${amd64_ver}"
