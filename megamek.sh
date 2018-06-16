#!/usr/bin/env bash

conf=$HOME/.config/megamek

if [[ -n "$XGD_CONFIG_HOME" ]]
then
    conf="$XDG_CONFIG_HOME/megamek"
fi

if [[ ! -d "$conf" ]]
then
    mkdir -p "$conf"
fi

if [[ ! -d "$conf/mmconf" ]]
then
    cp -af /usr/lib/megamek/mmconf "$conf/"
fi

exec env MEGAMEK_CONFPATH="$conf" /usr/lib/megamek/startup.sh
