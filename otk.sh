#!/bin/sh
# Runtime dependencies are package assets; --cached-only forbids downloads.
export DENO_DIR=/usr/lib/otk/deno-cache
export DENO_NO_UPDATE_CHECK=1
if [ -z "${OTK_CONFIG+x}" ]; then
    config=${XDG_CONFIG_HOME:-"$HOME/.config"}/otk/otk.toml
    if [ -f "$config" ]; then
        export OTK_CONFIG="$config"
    fi
fi
exec /usr/bin/deno run --cached-only --frozen --node-modules-dir=none \
    --no-code-cache --no-prompt --allow-net --allow-read --allow-write --allow-env \
    --config /usr/lib/otk/deno.json /usr/lib/otk/main.ts "$@"
