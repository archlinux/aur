#!/usr/bin/env bash
set -eu

PKGNAME='truberbrook'
echo >&2 "Launching game"
cd "/opt/${PKGNAME}"
exec ./Truberbrook.x86 "$@"
