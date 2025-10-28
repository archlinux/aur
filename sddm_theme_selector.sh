#!/bin/zsh
themes_dir=/usr/share/sddm/themes
astro_themes_dir=$themes_dir/sddm-astronaut-theme/Themes
astro_cfg=$themes_dir/sddm-astronaut-theme/metadata.desktop
sddm_cfg=/etc/sddm.conf
astro_title="Select The Astronaut Theme You Want To Enable For Login Screen"
declare -a astro_themes=($(ls $astro_themes_dir))
declare -a themes=($(ls $themes_dir))

selected="$(zenity --list --title="${astro_title/Astronaut /}" --column="Theme" ${themes[@]})"
case $selected in
    "")
        echo "canceled"
        exit 1
        ;;
    sddm-astronaut-theme)
        echo "astro: $selected"
        selectedA=$(zenity --list --title="$astro_title" --column="Theme" ${astro_themes[@]/.conf/})
        if [[ -f $astro_themes_dir/$selectedA.conf ]]; then
            echo "file exists: $selectedA.conf"
            sudo sed -i "/Current/s/.*/Current=$selected/" $sddm_cfg
            sudo sed -i "/ConfigFile/s/.*/ConfigFile=${selectedA}.conf/" $astro_cfg
        else
            echo "canceled"
            exit 1
        fi
        cat $astro_cfg
        ;;
    *)
        echo "theme: $selected"
        sudo sed -i "/Current/s/.*/Current=$selected/" $sddm_cfg
        ;;
esac

cat $sddm_cfg
sleep 2
