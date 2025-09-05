#!/usr/bin/env bash
set -eu

PKGNAME='superliminal'
echo >&2 "Launching game"
cd "/opt/${PKGNAME}"
exec game/Superliminal "$@"
