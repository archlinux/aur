#!/usr/bin/env bash
set -eu

PKGNAME='powers-in-the-basement'
echo >&2 "Launching game"
cd "/opt/${PKGNAME}"
exec ./pitb "$@"
