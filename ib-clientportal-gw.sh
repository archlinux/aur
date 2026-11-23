#!/bin/sh
set -eu

prefix=/usr/share/ib-clientportal-gw
state="${XDG_STATE_HOME:-"$HOME/.local/state"}/ib-clientportal-gw"

mkdir -p "$state/root" "$state/logs"
cp -an "$prefix/root/." "$state/root/"
ln -sfn "$prefix/bin" "$state/bin"
ln -sfn "$prefix/build" "$state/build"
ln -sfn "$prefix/dist" "$state/dist"
ln -sfn "$prefix/doc" "$state/doc"

cd "$state"
exec bin/run.sh "${1:-root/conf.yaml}"
