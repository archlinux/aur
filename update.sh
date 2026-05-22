#!/usr/bin/env bash
# Query version information and update PKGBUILD for the AppImage release.
# md5sums for the AppImages are pulled from the Google Cloud Storage XML
# listing ETags (the hex MD5 for non-composite objects), so the binaries are
# not downloaded.
set -euo pipefail

listing_url='https://storage.googleapis.com/antigravity-public?prefix=antigravity-hub/'

pkgbuild_var() {
    grep "^$1=" PKGBUILD | cut -d= -f2- || { echo "error: $1 not found in PKGBUILD" >&2; exit 1; }
}

show_change() {
    local label=$1 old=$2 new=$3
    if [[ $old != "$new" ]]; then
        printf '  %-22s %s -> %s\n' "$label" "$old" "$new"
    fi
}

release_listing=$(
    curl -fsSL "$listing_url"
) || { echo "error: failed to fetch release listing" >&2; exit 1; }

if grep -q '<IsTruncated>true</IsTruncated>' <<<"$release_listing"; then
    echo "error: release listing is truncated; update pagination before continuing" >&2
    exit 1
fi

current_pkgver=$(pkgbuild_var pkgver)
current_execution_id=$(pkgbuild_var _execution_id)
current_md5_x86_64=$(pkgbuild_var md5sums_x86_64 | sed "s/[^']*'\([^']*\)'.*/\1/")
current_md5_aarch64=$(pkgbuild_var md5sums_aarch64 | sed "s/[^']*'\([^']*\)'.*/\1/")

declare -A release_version release_execution_id release_last_modified release_md5_x86_64 release_md5_aarch64

while IFS= read -r block; do
    key=$(sed -n 's:.*<Key>\([^<]*\)</Key>.*:\1:p' <<<"$block")
    [[ $key =~ ^antigravity-hub/([0-9]+)\.([0-9]+)\.([0-9]+)-([0-9]+)/(linux-x64|linux-arm)/Antigravity\.AppImage$ ]] || continue

    major=${BASH_REMATCH[1]}
    if (( major >= 100 )); then
        continue
    fi

    version="${BASH_REMATCH[1]}.${BASH_REMATCH[2]}.${BASH_REMATCH[3]}"
    execution_id="${BASH_REMATCH[4]}"
    arch="${BASH_REMATCH[5]}"
    release="${version}-${execution_id}"
    etag=$(sed -n 's:.*<ETag>"\([0-9a-f]\{32\}\)"</ETag>.*:\1:p' <<<"$block")
    last_modified=$(sed -n 's:.*<LastModified>\([^<]*\)</LastModified>.*:\1:p' <<<"$block")

    if [[ -z $etag ]]; then
        echo "error: could not extract md5 from ETag for $key" >&2
        exit 1
    fi

    release_version[$release]=$version
    release_execution_id[$release]=$execution_id
    if [[ -z ${release_last_modified[$release]:-} || $last_modified > ${release_last_modified[$release]} ]]; then
        release_last_modified[$release]=$last_modified
    fi

    case $arch in
        linux-x64) release_md5_x86_64[$release]=$etag ;;
        linux-arm) release_md5_aarch64[$release]=$etag ;;
    esac
done < <(sed 's:</Contents>:</Contents>\n:g' <<<"$release_listing")

latest_release=''
latest=''
for release in "${!release_version[@]}"; do
    [[ -n ${release_md5_x86_64[$release]:-} && -n ${release_md5_aarch64[$release]:-} ]] || continue

    ver=${release_version[$release]}
    if [[ -z $latest_release ]] \
        || (( $(vercmp "$ver" "$latest") > 0 )) \
        || { (( $(vercmp "$ver" "$latest") == 0 )) && [[ ${release_last_modified[$release]} > ${release_last_modified[$latest_release]} ]]; }; then
        latest_release=$release
        latest=$ver
    fi
done

if [[ -z $latest_release ]]; then
    echo "error: no complete Linux AppImage release found in listing" >&2
    exit 1
fi

execution_id=${release_execution_id[$latest_release]}
md5_x86_64=${release_md5_x86_64[$latest_release]}
md5_aarch64=${release_md5_aarch64[$latest_release]}

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
