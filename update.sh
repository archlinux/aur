#!/usr/bin/env bash
set -e

VERSION="${1:-master}"
RAW_BASE="https://raw.githubusercontent.com/playit-cloud/playit-agent/${VERSION}"

curl -L -o PKGBUILD "${RAW_BASE}/arch/build/PKGBUILD"
curl -L -o playit.install "${RAW_BASE}/arch/build/playit.install"

updpkgsums
makepkg --printsrcinfo > .SRCINFO

git clean -fdx
