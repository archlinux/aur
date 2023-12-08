#!/usr/bin/env bash
set -eu

PKGNAME='truberbrook'
echo >&2 "Launching app"
cd "/opt/${PKGNAME}"
exec ./start.sh "$@"
