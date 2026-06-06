#!/usr/bin/env bash
# Creates the symlinks that point the in-source-tree writes (drill 1,
# group A) at /var/lib/odysseus-ai/services/. Also symlinks the read-only
# web UI (static/) so the CWD-relative path the app expects resolves
# to the actual files in /usr/lib/odysseus-ai/app/static/.
# Run by post_install and post_upgrade.
#
# Idempotent: safe to re-run. If a target path is a real dir (left over
# from a previous install that didn't know about this symlink), it is
# removed first. If it's already a symlink, it's replaced.
set -euo pipefail
APP=/usr/lib/odysseus-ai/app
STATE=/var/lib/odysseus-ai

# Helper: create a symlink at $2 -> $1, even if $2 is currently a real
# dir (which `ln -sfn` cannot replace; it would silently create a
# nested symlink inside the dir).
force_symlink() {
    local target="$1" linkpath="$2"
    if [[ -d "$linkpath" && ! -L "$linkpath" ]]; then
        # Real directory at the symlink path. Likely a leftover from a
        # previous install that did `mkdir -p` here. Remove it; the
        # contents are user state and live under STATE/ (writable
        # parent), not under the link target.
        rm -rf "$linkpath"
    fi
    ln -sfn "$target" "$linkpath"
}

# --- Writable state dirs (odysseus-owned) ---
# services/search/cache.py writes into services/cache/{search,content}
# at import time. We pre-create them under /var/lib/odysseus-ai/services/
# and symlink them so the upstream CWD-relative paths land on writable
# storage. The parent services/cache/ doesn't exist in the upstream
# tree, so we create it first (a real dir; the children are symlinks).
mkdir -p "$STATE/services" "$STATE/services/cache"
chown odysseus:odysseus "$STATE/services"
force_symlink "$STATE/services/cache/search"  "$APP/services/cache/search"
force_symlink "$STATE/services/cache/content" "$APP/services/cache/content"

# services/search/analytics.py writes two files into services/ (the
# parent of analytics.py) at import time. Symlink them to writable state.
# These need the target files to exist first so the symlink resolves.
touch "$STATE/services/search_analytics.json"
touch "$STATE/services/search_engine_error.log"
chown odysseus:odysseus "$STATE/services/search_analytics.json" \
                       "$STATE/services/search_engine_error.log"
force_symlink "$STATE/services/search_analytics.json"   "$APP/services/search_analytics.json"
force_symlink "$STATE/services/search_engine_error.log" "$APP/services/search_engine_error.log"

# --- Read-only web UI symlink ---
# The app reads static/login.html, static/index.html, static/app.js, etc.
# via CWD-relative paths (BASE_DIR is CWD per the AUR patch, so they
# resolve to /var/lib/odysseus-ai/static/<file>). The actual files ship
# in the read-only /usr/lib/odysseus-ai/app/static/. We make the state
# path a symlink to the read-only dir.
#
# Why a symlink, not a copy:
#   - The static files are pure read-only web assets (no user uploads,
#     no runtime writes). The app's only "write" to STATIC_DIR is
#     `os.makedirs(STATIC_DIR, exist_ok=True)` at import time, which
#     is a no-op when the symlink target already exists.
#   - A symlink means new upstream static files (login.html, app.js,
#     fonts/, ...) appear automatically on the next package upgrade
#     with no need to re-run this script.
#   - Saving ~1.5 MiB of duplicate copies.
#
# If upstream ever adds user-uploadable content to static/ (avatars,
# custom themes), this approach breaks. Watch for new write paths in
# app.py and re-evaluate.
force_symlink /usr/lib/odysseus-ai/app/static "$STATE/static"
