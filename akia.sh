#!/bin/sh
# System Java launcher: PKCS#11 export (JRE 17+), JNA library path, XDG cwd.

set -eu

akia_data="${XDG_DATA_HOME:-$HOME/.local/share}/akia"
mkdir -p "$akia_data"
cd "$akia_data"

exec /usr/bin/java \
    --add-exports jdk.crypto.cryptoki/sun.security.pkcs11.wrapper=ALL-UNNAMED \
    -Djava.library.path=/usr/lib/akia \
    -jar /usr/share/java/akia/akia.jar \
    "$@"
