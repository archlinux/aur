#!/bin/sh
# Copyright (c) 2024 Vendicated and Vencord contributors

set -e

outfile=$(mktemp /tmp/vencord.XXXXXX)
trap 'rm -f "$outfile"' EXIT

curl -sSL https://github.com/Vendicated/VencordInstaller/releases/latest/download/VencordInstallerCli-Linux \
 --output "$outfile"

chmod +x "$outfile"

while IFS= read -r package || [ -n "$package" ]; do
    branch=""
    case $package in
        discord)
            branch="stable"
            ;;
        discord-canary)
            branch="canary"
            ;;
        discord-ptb)
            branch="ptb"
            ;;
        *)
            echo "unknown package: $package" >&2
            continue
            ;;
    esac

    "$outfile" -install -branch "$branch"
done
