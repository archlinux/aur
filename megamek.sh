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

if [[ ! -d "$conf/mmconf" ]]
then
    cp -af /usr/lib/mekhq/* "$conf/"
fi

exec env MEGAMEK_CONFPATH="$conf" "$conf/mm-startup.sh"
