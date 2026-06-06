#!/usr/bin/env bash
# Creates the symlinks that point the in-source-tree writes (drill 1,
# group A) at /var/lib/odysseus-ai/services/. Run by post_install and
# post_upgrade.
set -euo pipefail
APP=/usr/lib/odysseus-ai/app
STATE=/var/lib/odysseus-ai

mkdir -p "$STATE/services" "$STATE/services/cache/search" "$STATE/services/cache/content" "$STATE/static"
chown -R odysseus:odysseus "$STATE/services" "$STATE/static"

# services/search/cache.py creates services/cache/{search,content} on import.
# We can't let those writes happen in the read-only /usr/lib/odysseus-ai/app
# tree, so we pre-create the cache dirs in /var/lib/odysseus-ai/services/
# and symlink them. The parent services/cache/ doesn't exist in the
# package, so create it first.
mkdir -p "$APP/services/cache"
ln -sfT "$STATE/services/cache/search"   "$APP/services/cache/search"
ln -sfT "$STATE/services/cache/content"  "$APP/services/cache/content"

# services/search/analytics.py writes two files into services/ (parent
# of the analytics.py file) at import time. Symlink them to writable state.
ln -sf  "$STATE/services/search_analytics.json"    "$APP/services/search_analytics.json"
ln -sf  "$STATE/services/search_engine_error.log"  "$APP/services/search_engine_error.log"

# app.py does os.makedirs(STATIC_DIR) at import time. With BASE_DIR=CWD
# (per the AUR patch), STATIC_DIR resolves to $STATE/static. We just
# pre-created it above.
