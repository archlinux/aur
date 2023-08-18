#!/usr/bin/env bash
set -eu

PKGNAME='book-of-hours'
echo >&2 "Launching app"
cd "/opt/${PKGNAME}/data/noarch"
exec ./start.sh "$@"
