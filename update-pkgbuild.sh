#!/usr/bin/env bash
set -e

REPO="phacility/arcanist"
BRANCH="stable"

BRANCH_API_URL="https://api.github.com/repos/${REPO}/branches/${BRANCH}"
COMMIT=$(curl --silent "${BRANCH_API_URL}" | jq -r '.commit.sha' -)
sed -i "/_commit=/c\\_commit=${COMMIT}" PKGBUILD
updpkgsums
makepkg -s
makepkg --printsrcinfo > .SRCINFO
git add .
git commit -m "Update to latest stable version (${COMMIT})"
