#!/usr/bin/env bash
set -eu

PKGNAME='baba-is-you'
echo >&2 "Launching game"
cd "/opt/${PKGNAME}"
exec ./run.sh "$@"
