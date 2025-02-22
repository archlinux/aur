#!/usr/bin/env bash

export script_name="${0##*/}"

conf_name=mekhq-0.50.03
if [[ -n "$MEKHQ_CONF_NAME" ]]
then
    conf_name="$MEKHQ_CONF_NAME"
fi

conf="$HOME/.config/${conf_name}"

if [[ -n "$XGD_CONFIG_HOME" ]]
then
    conf="$XDG_CONFIG_HOME/${conf_name}"
fi

if [[ ! -d "$conf" ]]
then
    mkdir -p "$conf"
    rsync -avc /usr/lib/mekhq/ "$conf/"
fi

startup_name="MekHQ"

case "${script_name}" in
    
    "megamek")
        startup_name="MegaMek"
        ;;
    "megameklab")
        startup_name="MegaMekLab"
        ;;
esac    

cd "${conf}"

exec env MEGAMEK_CONFPATH="$conf" "${conf}/bin/${startup_name}"
