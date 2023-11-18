#!/bin/bash
set -eu

PKGNAME='d-trust-card-assistant'
echo >&2 "Launching app"
cd "/opt/${PKGNAME}/"
exec wine D-Trust_Card_Assistant.exe "$@"
