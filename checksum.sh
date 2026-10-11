#!/bin/bash
[ -z "$1" ] && { echo "usage $0 <PKGVERSION>"; exit 1; }
# Taken from the release's own SHA256SUMS, which the release workflow writes over
# the artefacts it publishes.
curl -sL https://github.com/Botropolis-City/botropolis/releases/download/v$1/SHA256SUMS |
    grep -E -e "-${1//./\\.}-linux-(amd64|arm64)\.tar\.gz$" |
    while read -r sum file; do
        case "$file" in
            *amd64*) echo "x86_64:  $sum" ;;
            *arm64*) echo "aarch64: $sum" ;;
        esac
    done
