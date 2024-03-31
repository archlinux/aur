#!/usr/bin/env bash
set -eu

PKGNAME='scott-whiskers-in-the-search-for-mr-fumbleclaw'
echo >&2 "Launching app"
cd "/opt/${PKGNAME}"
exec ./start.sh "$@"
