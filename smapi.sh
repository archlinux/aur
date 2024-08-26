#!/bin/bash
user_lang=$(locale | grep LANG | cut -d= -f2 | cut -d_ -f1)


if [ $user_lang == "ru" ]; then
    SMAPI_MODS_PATH=$(kdialog --title "Выберите дерикторию которая содержит Моды для Stardew Valley" --getexistingdirectory $HOME)
    status=$?
else
    SMAPI_MODS_PATH=$(kdialog --title "Choose directory that contains Mods for Stardew Valley" --getexistingdirectory $HOME)
    status=$?
fi
clear
[ $status == 1 ] && exit 1


if [ $user_lang == "ru" ]; then
    kdialog --icon "smapi" --title "SMAPI" --passivepopup "Игра скоро запустится..." 10 &
else
    kdialog --icon "smapi" --title "SMAPI" --passivepopup "Game will starts soon..." 10 &
fi

/opt/gog-stardew-valley/StardewModdingAPI --mods-path "$SMAPI_MODS_PATH" "$@"
