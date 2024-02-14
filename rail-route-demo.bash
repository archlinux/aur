#!/usr/bin/env bash
set -eu

PKGNAME='rail-route-demo'
echo >&2 "Launching app"
cd "/opt/${PKGNAME}"
exec ./start.sh "$@"
