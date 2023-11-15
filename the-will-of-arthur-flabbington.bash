#!/usr/bin/env bash
set -eu

PKGNAME='the-will-of-arthur-flabbington'
echo >&2 "Launching app"
cd "/opt/${PKGNAME}/data/noarch"
exec ./start.sh "$@"
