#!/bin/zsh
themes_dir=/usr/share/sddm/themes
sddm_cfg=/etc/sddm.conf
title="Select The NAME Theme You Want To Enable For Login Screen"
declare -a custom_themes
declare -a themes=($(ls $themes_dir))

custumTheme_Select(){
    name=$1
    conf_dir=$2
    custom_cfg=$themes_dir/$name/metadata.desktop
    custom_themes_dir=$themes_dir/$name/$conf_dir
    custom_themes=($(ls $custom_themes_dir))

	selectedA=$(zenity --list --title="${title/NAME/${name}}" --column="Theme" ${custom_themes[@]/.conf/})
        if [[ -f $custom_themes_dir/$selectedA.conf ]]; then
            echo "file exists: $selectedA.conf"
            sudo sed -i "/Current/s/.*/Current=$name/" $sddm_cfg
            sudo sed -i "/ConfigFile/s/.*/ConfigFile=${conf_dir}\/${selectedA}.conf/" $custom_cfg
        else
            echo "canceled"
            exit 1
        fi
}

selected="$(zenity --list --title="${title/NAME /}" --column="Theme" ${themes[@]})"
case $selected in
    "")
        echo "canceled"
        exit 1
        ;;
    silent)
        custumTheme_Select $selected "configs"
        cat $custom_cfg
        ;;
    sddm-astronaut-theme)
        echo "astro: $selected"
        custumTheme_Select $selected "Theme"
        cat $custom_cfg
        ;;
    *)
        echo "theme: $selected"
        sudo sed -i "/Current/s/.*/Current=$selected/" $sddm_cfg
        ;;
esac

cat $sddm_cfg
sleep 2
