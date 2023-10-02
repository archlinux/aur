#!/usr/bin/env bash
set -eu

PKGNAME='dandara-trials-of-fear-edition'
echo >&2 "Launching app"
cd "/opt/${PKGNAME}/data/noarch"
exec ./start.sh "$@"
