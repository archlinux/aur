#!/usr/bin/env bash
set -eu

PKGNAME='slay-the-princess'
echo >&2 "Launching game"
cd "/opt/${PKGNAME}"
exec ./SlaythePrincessDemo.sh "$@"
