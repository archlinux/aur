#!/bin/bash

cd "$(dirname "$0")/pkg/collabora-online-server-nodocker"
find * -type f -exec bash -c 'file "$0" | grep -qF " ELF " && { nf="$(LC_ALL=C LANG=C ldd "$0" | grep -F "not found")"; [ -n "$nf" ] && printf "=== %s ===\\n%s\\n" "$0" "$nf"; }' {} \;
