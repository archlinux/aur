#!/bin/bash
set -eu
umask 077

data_home=${XDG_DATA_HOME:-"$HOME/.local/share"}
case "$data_home" in
    /*) ;;
    *) echo 'easycli: XDG_DATA_HOME must be an absolute path' >&2; exit 1 ;;
esac
data_dir="$data_home/easycli"
mkdir -p "$data_dir/cpa-core"
staging=$(mktemp -d "$data_dir/.package.XXXXXX")
trap 'rm -rf -- "$staging"' EXIT

# Linux upstream stores configuration and its managed core beside the executable.
for source in /usr/lib/easycli/EasyCLIProxyAPI /usr/lib/easycli/core-version.txt /usr/lib/easycli/cpa-core/*.tar.gz; do
    relative=${source#/usr/lib/easycli/}
    if ! cmp -s "$source" "$data_dir/$relative"; then
        cp --reflink=auto -- "$source" "$staging/${source##*/}"
        mv -fT -- "$staging/${source##*/}" "$data_dir/$relative"
    fi
done
rm -rf -- "$staging"
trap - EXIT

# Keep login autostart routed through the packaged launcher after AUR upgrades.
export APPIMAGE=/usr/bin/easycli
exec "$data_dir/EasyCLIProxyAPI" "$@"
