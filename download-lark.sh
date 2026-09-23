#!/usr/bin/env bash
set -euo pipefail

output=$1
api_url=${2#lark+}

link=$(curl -fsSL --proto '=https' --proto-redir '=https' "$api_url" |
    jq -er '.data.download_link')
[[ $link == https://* ]]
curl -fL --retry 2 --proto '=https' --proto-redir '=https' -o "$output" "$link"
