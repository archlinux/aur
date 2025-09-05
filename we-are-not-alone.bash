#!/usr/bin/env bash
set -eu

PKGNAME='we-are-not-alone'
echo >&2 "Launching game"
cd "/opt/${PKGNAME}"
exec ./start.sh "$@"
