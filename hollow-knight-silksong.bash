#!/usr/bin/env bash
set -eu

PKGNAME='hollow-knight-silksong'
echo >&2 "Launching game"
cd "/opt/${PKGNAME}"
exec ./start.sh "$@"
