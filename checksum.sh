#!/usr/bin/env bash
set -euo pipefail

API_URL="https://api.inkdrop.app/download/latest"
DIST_URL="https://dist.inkdrop.app/releases"

usage() {
    cat <<EOF
Usage: $(basename "$0") [--help] <PKGVERSION>

Print the sha512 checksum of each Linux zip for an Inkdrop release, one line per pacman arch:
  x86_64: <sha512>
  aarch64: <sha512>

When PKGVERSION is the latest release, the checksums come from ${API_URL}.
Otherwise the zips are downloaded and hashed locally, since the API only describes the latest release.

Exits non-zero if the release does not exist.
EOF
}

case "${1:-}" in
    -h|--help) usage; exit 0 ;;
    "") usage >&2; exit 1 ;;
esac

PKGVER=$1
declare -A ARCHES=([x86_64]=x64 [aarch64]=arm64)

latest=$(curl -sf "${API_URL}" || true)

for arch in x86_64 aarch64; do
    upstream=${ARCHES[$arch]}
    sum=""
    if [ -n "${latest}" ] && [ "$(jq -r .version <<<"${latest}")" = "${PKGVER}" ]; then
        sum=$(jq -r --arg a "${upstream}" '.links.linux[] | select(.arch == $a and .type == "zip") | .sha512Checksum' <<<"${latest}")
    fi
    if [ -z "${sum}" ]; then
        sum=$(curl -sfL "${DIST_URL}/inkdrop-${PKGVER}-${upstream}-linux.zip" | sha512sum | cut -d ' ' -f 1) \
            || { echo "inkdrop ${PKGVER} (${upstream}) not found" >&2; exit 1; }
    fi
    echo "${arch}: ${sum}"
done
