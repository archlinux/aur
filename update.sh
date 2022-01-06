#!/bin/sh
set -xe

source ./PKGBUILD

GITLAB_USER="azelpg"
PROJECT_ID=$(curl "https://gitlab.com/api/v4/users/${GITLAB_USER}/projects" | jq '.[] | select(.path == "'"${pkgname}"'") | .id')
LATEST_RELEASE=$(curl "https://gitlab.com/api/v4/projects/${PROJECT_ID}/releases" | jq -r '.[0].tag_name' | sed 's/^v//')

sed -i 's/pkgver=.*/pkgver='"${LATEST_RELEASE}"'/' PKGBUILD
updpkgsums
