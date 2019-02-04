#!/usr/bin/env bash

conf=$HOME/.config/mekhq

if [[ -n "$XGD_CONFIG_HOME" ]]
then
    conf="$XDG_CONFIG_HOME/mekhq"
fi

if [[ ! -d "$conf" ]]
then
    mkdir -p "$conf"
fi

rsync -avc /usr/lib/mekhq/ "$conf/"

cd "$conf"

exec env MEGAMEK_CONFPATH="$conf" "$conf/mm-startup"
