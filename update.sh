#!/usr/bin/env bash
# Check upstream GH releases for new nix-installer tag and prep AUR bump.
set -euo pipefail
cd "$(dirname "$(readlink -f "$0")")"
. "$(dirname "$PWD")/lib/bump.sh"

resp=$(curl -fsSL --max-time 30 \
    -H 'Accept: application/vnd.github+json' \
    'https://api.github.com/repos/DeterminateSystems/nix-installer/releases/latest')
new_tag=$(jq -er '.tag_name' <<<"$resp")
new_ver=${new_tag#v}

aur_bump_if_changed "pkgver=$new_ver"
