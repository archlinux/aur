#!/usr/bin/bash
set -euo pipefail

# Get pkgver from PKGBUILD and convert to git tag format
pkgver=$(grep '^pkgver=' PKGBUILD | cut -d= -f2)
tag="v${pkgver//_/-}"

# Fetch Cargo.toml from the tagged commit and extract cef version
cef_version=$(curl -fsSL "https://raw.githubusercontent.com/Stremio/stremio-linux-shell/${tag}/Cargo.toml" |
    grep '^cef = ' |
    grep -oP 'version = "\K[^"]+')

echo "cef_version=$cef_version"

# Query CDN index for the matching minimal build filename
cef_filename=$(curl -fsSL "https://cef-builds.spotifycdn.com/index.json" |
    jq -r --arg v "$cef_version" '
        .linux64.versions[]
        | select(.cef_version | startswith($v))
        | .files[]
        | select(.type == "minimal")
        | .name
      ' | head -1)

echo "cef_filename=$cef_filename"

cef_tag=$(echo "$cef_filename" | grep -oP '(?<=\+)[^+]+(?=\+)')

echo "cef_tag=$cef_tag"

cef_url="https://cef-builds.spotifycdn.com/${cef_filename}"
cef_sha=$(curl -fsSL "${cef_url}.sha256" | awk '{print $1}')

echo "cef_sha=$cef_sha"

# Update PKGBUILD
sed -i "s/^_cef_version=.*/_cef_version=${cef_version}/" PKGBUILD
sed -i "s/^_cef_full_name=.*/_cef_full_name=${cef_filename}/" PKGBUILD
