#!/usr/bin/env bash
# Check upstream for newer worklink build and prepare an AUR release commit.
set -euo pipefail
cd "$(dirname "$(readlink -f "$0")")"
. "$(dirname "$PWD")/lib/bump.sh"

API='https://www.cm-worklink.com/lappst/hostplatform/downloadKey?build=0&versionChannel=07&downloadKey=GTLc&url=https://www.cm-worklink.com/'
resp=$(curl -fsSL --max-time 30 "$API")
new_ver=$(jq -er '.data.version.versionNo' <<<"$resp")
new_build=$(jq -er '.data.version.build' <<<"$resp")
url=$(jq -er '.data.version.resourceUrl' <<<"$resp")
new_commit=$(sed -nE 's|.*worklink_[0-9.]+-[0-9]+-([0-9a-f]+)_.*|\1|p' <<<"$url")
[[ -n "$new_commit" ]] || { echo "failed to parse commit from $url" >&2; exit 2; }

aur_bump_if_changed \
    "pkgver=$new_ver" \
    "_build=$new_build" \
    "_commit=$new_commit"
