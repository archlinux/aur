#!/bin/zsh
themes_dir=/usr/share/sddm/themes
astro_themes_dir=$themes_dir/sddm-astronaut-theme/Themes
astro_cfg=$themes_dir/sddm-astronaut-theme/metadata.desktop
sddm_cfg=/etc/sddm.conf
astro_title="Select The Astronaut Theme You Want To Enable For Login Screen"
declare -a astro_themes=($(ls $astro_themes_dir))
declare -a themes=($(ls $themes_dir))

#echo "$themes[@]"
#echo "$astro_themes[@]"

selected="$(zenity --list --title="${astro_title/Astronaut /}" --column="Theme" ${themes[@]})"
case $selected in
    "")
        echo "canseled"
        ;;
    sddm-astronaut-theme)
        echo "astro: $selected"
        sudo sed -i "/Current/s/.*/Current=$selected/" $sddm_cfg
        selected=$(zenity --list --title="$astro_title" --column="Theme" ${astro_themes[@]/.conf/})
        sudo sed -i "/ConfigFile/s/.*/ConfigFile=${selected}.conf/" $astro_cfg
        ;;
    *)
        echo "theme: $selected"
        sudo sed -i "/Current/s/.*/Current=$selected/" $sddm_cfg
        ;;

#zenity --list --title="$astro_title" --column="Theme" ${astro_themes[@]/.conf/}
esac

cat $sddm_cfg
sleep 2
