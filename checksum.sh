#!/bin/bash
[ -z "$1" ] && { echo "usage $0 <PKGVERSION>"; exit 1; }
curl -sL https://github.com/Botropolis-City/botropolis/archive/refs/tags/v$1.tar.gz | sha256sum | cut -d ' ' -f 1
