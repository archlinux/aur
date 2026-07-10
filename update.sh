#!/usr/bin/env bash
# Query version information and update PKGBUILD for the AppImage release.
# Google no longer permits public listing of the storage bucket. Discover the
# current release from the official download page instead; checksums come from
# the AppImage HTTP ETags (the hex MD5 for non-composite objects), so binaries
# are not downloaded.
set -euo pipefail

download_page_url='https://antigravity.google/download?platform=linux'
site_url='https://antigravity.google'

pkgbuild_var() {
    grep "^$1=" PKGBUILD | cut -d= -f2- || { echo "error: $1 not found in PKGBUILD" >&2; exit 1; }
}

show_change() {
    local label=$1 old=$2 new=$3
    if [[ $old != "$new" ]]; then
        printf '  %-22s %s -> %s\n' "$label" "$old" "$new"
    fi
}

download_page=$( 
    curl -fsSL "$download_page_url"
) || { echo "error: failed to fetch the official download page" >&2; exit 1; }

main_bundle=$( 
    grep -oE 'src="[^"]*main-[^"]*\.js"' <<<"$download_page" \
        | sed -n '1p' \
        | sed -e 's/^src="//' -e 's/"$//'
)
[[ -n $main_bundle ]] || { echo "error: could not find the download page bundle" >&2; exit 1; }

case $main_bundle in
    http://*|https://*) main_bundle_url=$main_bundle ;;
    /*) main_bundle_url="$site_url$main_bundle" ;;
    *) main_bundle_url="$site_url/$main_bundle" ;;
esac

download_bundle=$( 
    curl --compressed -fsSL "$main_bundle_url"
) || { echo "error: failed to fetch the download page bundle" >&2; exit 1; }

release_url=$( 
    grep -oE 'https://storage\.googleapis\.com/antigravity-public/antigravity-hub/[0-9]+\.[0-9]+\.[0-9]+-[0-9]+/linux-x64/Antigravity\.tar\.gz' <<<"$download_bundle" \
        | sed -n '1p'
)
[[ -n $release_url ]] || { echo "error: could not find the current Linux release" >&2; exit 1; }

release=${release_url%/linux-x64/Antigravity.tar.gz}
release=${release##*/}
version=${release%-*}
execution_id=${release##*-}

appimage_md5() {
    local arch=$1 etag
    etag=$(curl -fsSI "https://storage.googleapis.com/antigravity-public/antigravity-hub/$release/$arch/Antigravity.AppImage" \
        | sed -n 's/^[Ee][Tt][Aa][Gg]: "\([0-9a-f]\{32\}\)".*/\1/p' \
        | sed -n '1p')
    [[ -n $etag ]] || { echo "error: could not fetch the $arch AppImage checksum" >&2; exit 1; }
    printf '%s\n' "$etag"
}

current_pkgver=$(pkgbuild_var pkgver)
current_execution_id=$(pkgbuild_var _execution_id)
current_md5_x86_64=$(pkgbuild_var md5sums_x86_64 | sed "s/[^']*'\([^']*\)'.*/\1/")
current_md5_aarch64=$(pkgbuild_var md5sums_aarch64 | sed "s/[^']*'\([^']*\)'.*/\1/")

md5_x86_64=$(appimage_md5 linux-x64)
md5_aarch64=$(appimage_md5 linux-arm)

vcmp=$(vercmp "$version" "$current_pkgver")

if (( vcmp < 0 )); then
    echo "error: fetched version $version is older than current $current_pkgver" >&2
    exit 1
fi

if (( vcmp == 0 )) \
   && [[ $current_execution_id == "$execution_id" \
      && $current_md5_x86_64  == "$md5_x86_64" \
      && $current_md5_aarch64 == "$md5_aarch64" ]]; then
    echo "already up to date ($version)"
    exit 0
fi

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
