#!/usr/bin/env bash
set -e

VERSION="${1:-master}"
RAW_BASE="https://raw.githubusercontent.com/playit-cloud/playit-agent/${VERSION}"

curl -L -o PKGBUILD "${RAW_BASE}/arch/bin/PKGBUILD"
curl -L -o playit-bin.install "${RAW_BASE}/arch/bin/playit-bin.install"

updpkgsums
makepkg --printsrcinfo > .SRCINFO

git clean -fdx
