#!/bin/sh
# makepkg download agent for free itch.io games.
# Usage: itch-dl.sh itch://<user>/<game>/<upload_id> <output-file>
#
# itch.io has no stable download URLs: you POST to the game's /file/<upload_id>
# endpoint to receive a signed CDN URL that expires after 60 seconds.
set -eu

url=$1
out=$2

rest=${url#itch://}
user=${rest%%/*}
rest=${rest#*/}
game=${rest%%/*}
upload_id=${rest#*/}

resp=$(curl -sSf -X POST "https://${user}.itch.io/${game}/file/${upload_id}")
dl=$(printf '%s' "$resp" | sed -e 's/.*"url":"//' -e 's/".*//' -e 's|\\/|/|g')

if [ -z "$dl" ] || [ "$dl" = "$resp" ]; then
    echo "itch-dl: could not extract download URL from itch.io response" >&2
    exit 1
fi

exec curl -fL -o "$out" "$dl"
