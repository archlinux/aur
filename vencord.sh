#!/bin/sh
# Copyright (c) 2024 Vendicated and Vencord contributors

set -e

outfile=$(mktemp /tmp/vencord.XXXXXX)
trap 'rm -f "$outfile"' EXIT

set -- "XDG_CONFIG_HOME=$XDG_CONFIG_HOME"

curl -sS https://github.com/Vendicated/VencordInstaller/releases/latest/download/VencordInstallerCli-Linux \
 --output "$outfile" \

chmod +x "$outfile"

yes "" | env "$@" "$outfile"