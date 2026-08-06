#!/bin/sh
export LEPTOS_SITE_ROOT=/usr/share/jas/site JAS_CONFIG=/etc/jas/jas.toml
exec /usr/lib/jas/jas-bin "$@"
