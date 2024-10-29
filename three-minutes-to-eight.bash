#!/usr/bin/env bash
set -eu

PKGNAME='three-minutes-to-eight'
echo >&2 "Launching app"
cd "/opt/${PKGNAME}"
exec ./start.sh "$@"
