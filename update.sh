#!/usr/bin/env bash
# Query version information and update PKGBUILD for the AppImage release.
# md5sums for the AppImages are pulled from the Google Cloud Storage ETag
# header (which is the hex MD5 for non-composite objects), so the binaries
# are not downloaded.
set -euo pipefail

pkgbuild_var() {
    grep "^$1=" PKGBUILD | cut -d= -f2- || { echo "error: $1 not found in PKGBUILD" >&2; exit 1; }
}

show_change() {
    local label=$1 old=$2 new=$3
    if [[ $old != "$new" ]]; then
        printf '  %-22s %s -> %s\n' "$label" "$old" "$new"
    fi
}

# Pulls md5 from the ETag header. GCS returns the hex MD5 for non-composite
# objects, which both AppImage builds are.
fetch_md5() {
    local url=$1
    local etag
    etag=$(curl -fsSLI "$url" | awk -F'"' 'tolower($0) ~ /^etag:/ {print $2; exit}' | tr -d '\r')
    if [[ ! $etag =~ ^[0-9a-f]{32}$ ]]; then
        echo "error: could not extract md5 from ETag for $url (got: '$etag')" >&2
        return 1
    fi
    printf '%s' "$etag"
}

current_pkgver=$(pkgbuild_var pkgver)
current_execution_id=$(pkgbuild_var _execution_id)
current_md5_x86_64=$(pkgbuild_var md5sums_x86_64 | sed "s/[^']*'\([^']*\)'.*/\1/")
current_md5_aarch64=$(pkgbuild_var md5sums_aarch64 | sed "s/[^']*'\([^']*\)'.*/\1/")

releases_json=$(
    curl -fsSL 'https://antigravity-auto-updater-974169037036.us-central1.run.app/releases'
) || { echo "error: failed to fetch releases" >&2; exit 1; }

latest=''
while IFS= read -r ver; do
    if [[ -z $latest ]] || (( $(vercmp "$ver" "$latest") > 0 )); then
        latest=$ver
    fi
done < <(echo "$releases_json" | jq -r '.[].version')

execution_id=$(echo "$releases_json" \
    | jq -r --arg v "$latest" '.[] | select(.version == $v) | .execution_id')

base_url="https://storage.googleapis.com/antigravity-public/antigravity-hub/${latest}-${execution_id}"
url_x86_64="$base_url/linux-x64/Antigravity.AppImage"
url_aarch64="$base_url/linux-arm/Antigravity.AppImage"

md5_x86_64=$(fetch_md5 "$url_x86_64")
md5_aarch64=$(fetch_md5 "$url_aarch64")

vcmp=$(vercmp "$latest" "$current_pkgver")

if (( vcmp < 0 )); then
    echo "error: fetched version $latest is older than current $current_pkgver" >&2
    exit 1
fi

if (( vcmp == 0 )) \
   && [[ $current_execution_id == "$execution_id" \
      && $current_md5_x86_64  == "$md5_x86_64" \
      && $current_md5_aarch64 == "$md5_aarch64" ]]; then
    echo "already up to date ($latest)"
    exit 0
fi

if (( vcmp > 0 )); then
    printf '  %-22s %s -> %s\n' pkgver "$current_pkgver" "$latest"
fi
show_change _execution_id    "$current_execution_id"   "$execution_id"
show_change md5sums_x86_64   "$current_md5_x86_64"     "$md5_x86_64"
show_change md5sums_aarch64  "$current_md5_aarch64"    "$md5_aarch64"

sed -i \
    -e "s|^pkgver=.*|pkgver=$latest|" \
    -e "s|^_execution_id=.*|_execution_id=$execution_id|" \
    -e "s|^pkgrel=.*|pkgrel=1|" \
    -e "s|^md5sums_x86_64=.*|md5sums_x86_64=('$md5_x86_64')|" \
    -e "s|^md5sums_aarch64=.*|md5sums_aarch64=('$md5_aarch64')|" \
    PKGBUILD

echo "PKGBUILD updated to $latest. Now run: makepkg --printsrcinfo > .SRCINFO"
