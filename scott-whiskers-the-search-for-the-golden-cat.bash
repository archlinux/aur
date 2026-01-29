#!/usr/bin/env bash
set -eu

PKGNAME='scott-whiskers-the-search-for-the-golden-cat'
echo >&2 "Launching game"
cd "/opt/${PKGNAME}"
exec ./start.sh "$@"
