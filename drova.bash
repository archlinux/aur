#!/usr/bin/env bash
set -eu

PKGNAME='drova-forsaken-kin'
echo >&2 "Launching app"
cd "/opt/${PKGNAME}"
exec ./start.sh "$@"
