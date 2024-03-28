#!/usr/bin/env bash

# Purpose of this script:
# 1. Reads latest tag from GitHub repo and injects it into PKGBUILD
# 2. Run makepkg in order to download the release archive, updated checksums
# 3. Have makepkg write .SRCINFO

# Usage:
# 1. Run this script.
# 2. Commit changes

TEMPLATE=./PKGBUILD.dist
TEMP_FILE=$(mktemp)
PKGBUILD=./PKGBUILD
REPO_OWNER="albar965"
REPO_NAME="littlenavmap"
TAGS=$(curl -s "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/tags")
LNM_PKG_VER=$(echo "$TAGS" | jq -r 'map(select(.name | test("^v?\\d+\\.\\d+\\.\\d+$"))) | max_by(.name | sub("^v";"") | split(".") | map(tonumber) | .[0] * 1000000 + .[1] * 1000 + .[2]) | .name | sub("^v";"")')

export LNM_PKG_VER

rm ./*.pkg.tar 2>/dev/null

# shellcheck disable=SC2016
envsubst '${LNM_PKG_VER}' < $TEMPLATE > "${TEMP_FILE}"

cp "${TEMP_FILE}" $PKGBUILD
makepkg -g >> $PKGBUILD # update checksums
makepkg -c -f --install # create pkg and install
makepkg --printsrcinfo > .SRCINFO