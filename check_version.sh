#!/bin/bash
set -e

REPO="obgnail/typora_plugin"
PKGFILE="PKGBUILD"

get_latest() {
    curl -s "https://api.github.com/repos/$REPO/releases/latest" | jq -r '.tag_name' | sed 's/^v//'
}

calc_sha512() {
    local url="$1" tmpfile="$(mktemp)"
    curl -sL "$url" > "$tmpfile"
    sha512sum "$tmpfile" | awk '{print $1}'
    rm -f "$tmpfile"
}

update_pkgbuild() {
    local version="$1" checksum="$2"
    sed -i "$PKGFILE" \
        -e "s/_plugin_ver=.*/_plugin_ver=$version/" \
        -e "s|/typora-plugin@.*/|/typora-plugin@$version/|" \
        -e "/sha512sums=/{n;n;s/'.*'/'$checksum'/}"
}

main() {
    [[ -f $PKGFILE ]] || { echo "PKGBUILD not found"; exit 1; }

    local current=$(grep -oP '_plugin_ver=\K[^ ]+' "$PKGFILE")
    local latest=$(get_latest)

    [[ $latest == $current ]] && { echo "Already up to date"; }

    echo "Updating: $current → $latest"

    local url="https://github.com/$REPO/releases/download/$latest/typora-plugin@v${latest}.zip"
    local sha512=$(calc_sha512 "$url")

    update_pkgbuild "$latest" "$sha512"
    echo "Updated $PKGFILE"
}

main "$@"
