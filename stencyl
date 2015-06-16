#!/bin/sh
LOCAL="$HOME/.local/share/stencyl"
if [ ! -d "$LOCAL" ]; then
    mkdir -p "$LOCAL"

    cd /usr/share/stencyl
    for f in *; do
        ln -s /usr/share/stencyl/"$f" "$LOCAL/$f"
    done

    rm -f "$LOCAL/games"
    mkdir -p "$LOCAL/games"
fi

cd "$LOCAL"
exec ./Stencyl "$@"