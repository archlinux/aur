#!/usr/bin/env bash
set -e

REPO="phacility/libphutil"
BRANCH="stable"

BRANCH_API_URL="https://api.github.com/repos/${REPO}/branches/${BRANCH}"

BRANCH_API_DATA="$(curl --silent ${BRANCH_API_URL})"
COMMIT=$(echo "${BRANCH_API_DATA}" | jq -r '.commit.sha' -)
VERSION=$(echo "${BRANCH_API_DATA}" | jq -r '.commit.commit.message' - | sed -e 's/(stable) Promote //g' -e 's/ Week /\./g')

sed -i "/_commit=/c\\_commit=${COMMIT}" PKGBUILD
sed -i "/pkgver=/c\pkgver=${VERSION}" PKGBUILD

updpkgsums
makepkg -s
makepkg --printsrcinfo > .SRCINFO
git add .
git commit -m "Update to ${VERSION}"
