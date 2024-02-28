#!/usr/bin/env bash
set -eu

PKGNAME='rail-route'
echo >&2 "Launching app"
cd "/opt/${PKGNAME}"
exec ./start.sh "$@"
