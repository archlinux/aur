#!/usr/bin/env bash
set -eu

PKGNAME='firewatch'
echo >&2 "Launching app"
cd "/opt/${PKGNAME}/data/noarch"
exec ./start.sh "$@"
