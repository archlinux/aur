#!/usr/bin/env bash
set -eu

PKGNAME='unrest'
echo >&2 "Launching app"
cd "/opt/${PKGNAME}"
exec ./start.sh "$@"
