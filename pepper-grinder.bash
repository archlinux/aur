#!/usr/bin/env bash
set -eu

PKGNAME='pepper-grinder'
echo >&2 "Launching app"
cd "/opt/${PKGNAME}"
exec ./start.sh "$@"
