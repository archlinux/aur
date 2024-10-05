#!/usr/bin/env bash
set -eu

PKGNAME='night-in-the-woods'
echo >&2 "Launching app"
cd "/opt/${PKGNAME}"
exec ./start.sh "$@"
