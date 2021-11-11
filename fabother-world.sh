#!/bin/sh

mkdir -p "${XDG_CONFIG_HOME:-$HOME/.config}"/fabother-world/data

exec /usr/share/fabother-world/fabother-world \
     --datapath="${XDG_CONFIG_HOME:-$HOME/.config}"/fabother-world/data \
     --savepath="${XDG_CONFIG_HOME:-$HOME/.config}"/fabother-world "$@"
