#!/bin/bash
user_lang=$(locale | grep LANG | cut -d= -f2 | cut -d_ -f1)


# Detect config path
conf_path=""
if [[ $XDG_CONFIG_HOME == "" ]]; then
    conf_path="${HOME:?}/.config/StardewValley/"
else
    conf_path="${XDG_CONFIG_HOME:?}/StardewValley/"
fi


if [[ ! -d $conf_path ]]; then
    mkdir $conf_path
fi

# Previous mods path
if [[ ! -f "${conf_path:?}/smapi-launcher-previous-path-to-mods.txt" ]]; then
    touch "${conf_path:?}/smapi-launcher-previous-path-to-mods.txt"
    previous_mods_path=$HOME
    echo "$previous_mods_path" > "${conf_path:?}/smapi-launcher-previous-path-to-mods.txt"
else
    previous_mods_path=$(cat "${conf_path:?}/smapi-launcher-previous-path-to-mods.txt")
    if [[ ! -n $previous_mods_path ]]; then
        previous_mods_path=$HOME
    fi
fi


# Ask user about where to look for mods
if [[ $user_lang == "ru" ]]; then
    SMAPI_MODS_PATH=$(kdialog --title "Выберите дерикторию которая содержит Моды для Stardew Valley" --getexistingdirectory $previous_mods_path)
    status=$?
elif [[ $user_lang == "de" ]]; then
    SMAPI_MODS_PATH=$(kdialog --title "Wähle ein Verzeichnis, das Mods für Stardew Valley enthält" --getexistingdirectory $previous_mods_path)
    status=$?
elif [[ $user_lang == "pl" ]]; then
    SMAPI_MODS_PATH=$(kdialog --title "Wybierz katalog zawierający Mody dla Stardew Valley" --getexistingdirectory $previous_mods_path)
    status=$?
else
    SMAPI_MODS_PATH=$(kdialog --title "Choose directory that contains Mods for Stardew Valley" --getexistingdirectory $previous_mods_path)
    status=$?
fi
clear
[[ $status == 1 ]] && exit 1


# If mods path is changed then update in config
if [[ $previous_mods_path != $SMAPI_MODS_PATH ]]; then
    echo "$SMAPI_MODS_PATH" > "${conf_path:?}/smapi-launcher-previous-path-to-mods.txt"
fi


# Sned notification that everything is ok and game will starts soon
if [[ $user_lang == "ru" ]]; then
    kdialog --icon "smapi" --title "SMAPI" --passivepopup "Игра скоро запустится..." 10 &
elif [[ $user_lang == "de" ]]; then
    kdialog --icon "smapi" --title "SMAPI" --passivepopup "Das Spiel wird bald beginnen..." 10 &
elif [[ $user_lang == "pl" ]]; then
    kdialog --icon "smapi" --title "SMAPI" --passivepopup "Gra zostanie uruchomiona wkrótce..." 10 &
else
    kdialog --icon "smapi" --title "SMAPI" --passivepopup "Game will starts soon..." 10 &
fi


# Duplicates mods blacklist file to DataPath if it does not exist
if [[ ! -f "${conf_path:?}/blacklist.json" ]]; then
    cp "/opt/stardew-valley/smapi-internal/blacklist.json" "${conf_path:?}/blacklist.json"
fi

/opt/stardew-valley/StardewModdingAPI --mods-path "$SMAPI_MODS_PATH" "$@"
