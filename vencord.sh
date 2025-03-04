#!/bin/sh
# Copyright (c) 2024 Vendicated and Vencord contributors

set -e

outfile=$(mktemp /tmp/vencord.XXXXXX)
trap 'rm -f "$outfile"' EXIT

curl -sSL https://github.com/Vendicated/VencordInstaller/releases/latest/download/VencordInstallerCli-Linux \
 --output "$outfile"

chmod +x "$outfile"

while IFS= read -r package || [ -n "$package" ]; do
    branch=${package#discord-}

    if [[ -z $branch ]]; then
        branch="stable"
    fi

    "$outfile" -install -branch "$branch"
done
