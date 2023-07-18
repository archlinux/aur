#!/usr/bin/env bash
set -eu

PKGNAME='slay-the-princess'
echo >&2 "Launching app"
cd "/opt/${PKGNAME}/data/noarch"
exec ./start.sh "$@"
