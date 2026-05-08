#!/bin/sh
# Codex Proxy launcher: stage a writable working dir under XDG_DATA_HOME
# linking to the read-only assets in /usr/lib/codex-proxy.
#
# OAuth is delegated to the Codex CLI (`codex login` writes
# ~/.codex/auth.json). We extract the access token here and pass it via
# CODEX_JWT_TOKEN so the proxy skips its own OAuth/dashboard flow.

PREFIX=/usr/lib/codex-proxy
WORKDIR="${XDG_DATA_HOME:-$HOME/.local/share}/codex-proxy"
AUTH_FILE="${CODEX_AUTH_FILE:-$HOME/.codex/auth.json}"

mkdir -p "$WORKDIR/data"
for d in config public node_modules dist native package.json; do
    target="$PREFIX/$d"
    link="$WORKDIR/$d"
    [ -e "$target" ] || continue
    if [ -L "$link" ] || [ ! -e "$link" ]; then
        ln -sfn "$target" "$link"
    fi
done

if [ -z "$CODEX_JWT_TOKEN" ] && [ -r "$AUTH_FILE" ]; then
    CODEX_JWT_TOKEN=$(node -e "
        try {
            const a = JSON.parse(require('fs').readFileSync(process.argv[1], 'utf8'));
            const t = a.tokens?.access_token || a.access_token || a.OPENAI_API_KEY;
            if (t) process.stdout.write(t);
        } catch (e) { process.exit(1); }
    " "$AUTH_FILE" 2>/dev/null)
    [ -n "$CODEX_JWT_TOKEN" ] && export CODEX_JWT_TOKEN
fi

cd "$WORKDIR"
exec node "$PREFIX/dist/index.js" "$@"
