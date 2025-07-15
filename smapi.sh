#!/bin/bash
user_lang=$(locale | grep LANG | cut -d= -f2 | cut -d_ -f1)


if [[ $user_lang == "ru" ]]; then
    SMAPI_MODS_PATH=$(kdialog --title "Выберите дерикторию которая содержит Моды для Stardew Valley" --getexistingdirectory $HOME)
    status=$?
else
    SMAPI_MODS_PATH=$(kdialog --title "Choose directory that contains Mods for Stardew Valley" --getexistingdirectory $HOME)
    status=$?
fi
clear
[[ $status == 1 ]] && exit 1


if [[ $user_lang == "ru" ]]; then
    kdialog --icon "smapi" --title "SMAPI" --passivepopup "Игра скоро запустится..." 10 &
else
    kdialog --icon "smapi" --title "SMAPI" --passivepopup "Game will starts soon..." 10 &
fi

# Detect config path
conf_path=""
if [[ $XDG_CONFIG_HOME == "" ]]; then
    conf_path="${HOME:?}/.config/StardewValley/"
else
    conf_path="${XDG_CONFIG_HOME:?}/StardewValley/"
fi

# Duplicates mods blacklist file to DataPath if it does not exist
if [[ ! -f "${conf_path:?}/blacklist.json" ]]; then
    cp "/opt/gog-stardew-valley/game/smapi-internal/blacklist.json" "${conf_path:?}/blacklist.json"
fi

/opt/gog-stardew-valley/game/StardewModdingAPI --mods-path "$SMAPI_MODS_PATH" "$@"
