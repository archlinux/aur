#!/usr/bin/env bash
# Query version information and update PKGBUILD for the AppImage release.
# Release metadata comes from the Antigravity Hub updater API. AppImages are
# composite Google Cloud Storage objects, so their ETags are not MD5 hashes;
# download each changed release to calculate its package checksum.
set -euo pipefail

releases_url='https://antigravity-hub-auto-updater-974169037036.us-central1.run.app/releases'
storage_url='https://storage.googleapis.com/antigravity-public/antigravity-hub'

pkgbuild_var() {
    grep "^$1=" PKGBUILD | cut -d= -f2- || { echo "error: $1 not found in PKGBUILD" >&2; exit 1; }
}

show_change() {
    local label=$1 old=$2 new=$3
    if [[ $old != "$new" ]]; then
        printf '  %-22s %s -> %s\n' "$label" "$old" "$new"
    fi
}

releases_json=$(curl -fsSL "$releases_url") \
    || { echo "error: failed to fetch Antigravity Hub releases" >&2; exit 1; }

release=$(sed -nE \
    's/^[[:space:]]*\[[[:space:]]*\{[[:space:]]*"version"[[:space:]]*:[[:space:]]*"([0-9]+\.[0-9]+\.[0-9]+)"[[:space:]]*,[[:space:]]*"execution_id"[[:space:]]*:[[:space:]]*"([0-9]+)".*/\1-\2/p' \
    <<<"$releases_json")
[[ -n $release ]] \
    || { echo "error: could not parse the latest Antigravity Hub release" >&2; exit 1; }

version=${release%-*}
execution_id=${release##*-}

appimage_md5() {
    local arch=$1 checksum
    local url="$storage_url/$release/$arch/Antigravity.AppImage"

    echo "downloading $arch AppImage to calculate its MD5 checksum..." >&2
    if ! checksum=$(curl -fsSL --retry 3 "$url" | md5sum | cut -d' ' -f1); then
        echo "error: failed to download or checksum the $arch AppImage" >&2
        return 1
    fi
    [[ $checksum =~ ^[0-9a-f]{32}$ ]] \
        || { echo "error: invalid $arch AppImage checksum" >&2; return 1; }
    printf '%s\n' "$checksum"
}

current_pkgver=$(pkgbuild_var pkgver)
current_execution_id=$(pkgbuild_var _execution_id)
vcmp=$(vercmp "$version" "$current_pkgver")

if (( vcmp < 0 )); then
    echo "error: fetched version $version is older than current $current_pkgver" >&2
    exit 1
fi

if (( vcmp == 0 )) && [[ $current_execution_id == "$execution_id" ]]; then
    echo "already up to date ($version)"
    exit 0
fi

current_md5_x86_64=$(pkgbuild_var md5sums_x86_64 | sed "s/[^']*'\([^']*\)'.*/\1/")
current_md5_aarch64=$(pkgbuild_var md5sums_aarch64 | sed "s/[^']*'\([^']*\)'.*/\1/")

md5_x86_64=$(appimage_md5 linux-x64)
md5_aarch64=$(appimage_md5 linux-arm)

if (( vcmp > 0 )); then
    printf '  %-22s %s -> %s\n' pkgver "$current_pkgver" "$version"
fi
show_change _execution_id    "$current_execution_id"   "$execution_id"
show_change md5sums_x86_64   "$current_md5_x86_64"     "$md5_x86_64"
show_change md5sums_aarch64  "$current_md5_aarch64"    "$md5_aarch64"

sed -i \
    -e "s|^pkgver=.*|pkgver=$version|" \
    -e "s|^_execution_id=.*|_execution_id=$execution_id|" \
    -e "s|^pkgrel=.*|pkgrel=1|" \
    -e "s|^md5sums_x86_64=.*|md5sums_x86_64=('$md5_x86_64')|" \
    -e "s|^md5sums_aarch64=.*|md5sums_aarch64=('$md5_aarch64')|" \
    PKGBUILD

echo "PKGBUILD updated to $version. Now run: makepkg --printsrcinfo > .SRCINFO"
