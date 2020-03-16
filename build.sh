#!/usr/bin/env bash
# https://github.com/olivergondza/bash-strict-mode
set -euo pipefail
trap 's=$?; echo >&2 "$0: Error on line "$LINENO": $BASH_COMMAND"; exit $s' ERR

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
cd "$DIR"

namcap -i PKGBUILD
makepkg --printsrcinfo > .SRCINFO
makepkg -f PKGBUILD
