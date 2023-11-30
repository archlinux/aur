#!/bin/bash

# - Fetch the sha of the current aur version via http api.
# - Fetch the sha of the head of jojo's MuseScore 3.x branch via http api.
# - Take no further action if the shas are equal.
# - Update the _commit variable of PKGBUILD.
# - Build the package (updates pkgver and maybe pkgrel of PKGBUILD).
# - Update .SRCINFO.
# - Take no further action unless $COMMIT is set to 1.
# - The commit message is simply "${pkgver}-${pkgrel}".
# - If a commit for the current pkgver/pkgrel already exists, then
#   exit with error status.
# - Commit (but do not push) the updated PKGBUILD and .SRCINFO.

AUR_DATA_FILE="aur_data.json" # for testing
AUR_DATA_URL="https://aur.archlinux.org/rpc/v5/info?arg[]=musescore3-git"

GH_DATA_FILE="gh_data.json" # for testing
GH_DATA_URL="https://api.github.com/repos/Jojo-Schmitz/MuseScore/commits/3.x"

set_from_file_or_url() {
    local VAR="$1"
    local FILE="$2"
    local URL="$3"

    if [ -f "$FILE" ]; then
        declare -g $VAR="$(cat "$FILE")"
    else
        declare -g $VAR="$(curl -s "$URL")"
    fi
}

set_aur_data() {
    set_from_file_or_url "AUR_DATA" "$AUR_DATA_FILE" "$AUR_DATA_URL"
}

set_gh_data() {
    set_from_file_or_url "GH_DATA" "$GH_DATA_FILE" "$GH_DATA_URL"
}

aur_version() {
    jq -r '.["results"][0]["Version"]' <<< "$AUR_DATA"
}

aur_sha() {
    aur_version | sed -E 's|.*\.r[0-9]+\.([0-9a-z]+)-.*|\1|'
}

gh_sha_long() {
    jq -r '.["sha"]' <<< "$GH_DATA"
}

gh_sha() {
    local SHA=$(gh_sha_long)

    echo "${SHA:0:7}"
}

pkg_ver() {
    grep ^pkgver= PKGBUILD | cut -d = -f 2
}

pkg_rel() {
    grep ^pkgrel= PKGBUILD | cut -d = -f 2
}

pkg_filename() {
    local VER="$(pkg_ver)"
    local REL="$(pkg_rel)"
    local MACHINE="$(uname -m)"
    local EXT="zst"

    echo "musescore3-git-${VER}-${REL}-${MACHINE}.pkg.tar.${EXT}"
}

up_to_date() {
    local AUR_SHA="$(aur_sha)"
    local GH_SHA="$(gh_sha)"
    local INFO="aur=$AUR_SHA git=$GH_SHA"

    if [ "$AUR_SHA" = "$GH_SHA" ]; then
        echo "aur is up to date: $INFO" 
        return 0
    else
        echo "aur is stale: $INFO"
        return 1
    fi
}

patch() {
    local SHA="$(gh_sha_long)"

    sed -i "s|^_commit=.*\$|_commit=\"${SHA}\"|" PKGBUILD
}

build() {
    rm -rf pkg src
    makepkg -s

    if ! [ -f "$(pkg_filename)" ]; then
        echo "build failed"
        exit 1
    fi

    makepkg --printsrcinfo > .SRCINFO
}

commit() {
    if [ "$COMMIT" != "1" ]; then
        echo "Note: \$COMMIT is not set to 1"
        echo "      PKGBUILD and .SRCINFO changes were not committed"
        return 0
    fi

    local VER="$(pkg_ver)-$(pkg_rel)"
    
    if git log | grep -m 1 -e "^[[:space:]]*${VER}\$" >/dev/null; then
        echo "error: a commit for $VER already exists"
        exit 1
    fi

    git commit -m "$VER" PKGBUILD .SRCINFO
    git log -1
}

main() {
    set -e

    set_aur_data
    set_gh_data

    if ! up_to_date; then
        patch
        build
        commit
    fi
}

main
