#!/bin/sh

set -e

SCRIPT_DIR="$(dirname "$0")"
cd "$SCRIPT_DIR"

source ./PKGBUILD

#VERSION="$(curl -H "Accept: application/vnd.github.v3+json" "https://api.github.com/repos/${_repo}/tags" 2>/dev/null | jq -r '.[0].name')"
#VERSION="$(curl -H "Accept: application/vnd.github.v3+json" "https://api.github.com/repos/${_repo}/releases/latest" 2>/dev/null | jq -r '.tag_name')"
#VERSION="$(curl -H "Accept: application/vnd.github.v3+json" "https://api.github.com/repos/${_repo}/tags" 2>/dev/null | jq -r '.[0].name' | cut -c 2-)"
#VERSION="$(curl -H "Accept: application/vnd.github.v3+json" "https://api.github.com/repos/${_repo}/releases/latest" 2>/dev/null | jq -r '.tag_name' | cut -c 2-)"
_APP_INFO="$(curl "https://apps.nextcloud.com/api/v1/platform/21.0.0/apps.json" 2>/dev/null)"
VERSION="$(echo "${_APP_INFO}" | jq -r '[.[] | select(.id == "passwords") | .releases[] | select(.isNightly == false)] | .[0].version')"
JOBID="$(echo "${_APP_INFO}" | jq -r '[.[] | select(.id == "passwords") | .releases[] | select(.isNightly == false)] | .[0].download' | cut -d/ -f 8)"

if [ "${pkgver}" = "${VERSION}" ]; then
  echo "${pkgname}: No updates"
  exit
fi

echo "${pkgname}: ${pkgver} -> ${VERSION} (${JOBID})"

if [ "$1" = "--check" ]; then
  exit
fi

# Update
sed -i -e "s/^pkgver=.*\$/pkgver='${VERSION}'/" -e "s/^pkgrel=.*\$/pkgrel=1/" -e "s/^_jobid=.*\$/_jobid='${JOBID}'/" PKGBUILD
updpkgsums
makepkg --printsrcinfo > .SRCINFO

# Build and install
makepkg -sicr

# Commit
git add .
git commit -m "update to ${VERSION};"
