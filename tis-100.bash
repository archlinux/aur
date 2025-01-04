#!/usr/bin/env bash
set -eu

PKGNAME='tis-100'
echo >&2 "Launching app"
cd "/opt/${PKGNAME}"
exec ./start.sh "$@"
