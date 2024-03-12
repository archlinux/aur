#!/bin/bash

declare -A config

config_file="$HOME/.config/ddh/config.ini"
ac_dir=$(ls /sys/class/power_supply/ | grep -P "AC")

function read_config() {
    section=""
    while IFS= read -r line; do
        if [[ $line =~ ^\[.*\]$ ]]; then
            section="${line#[}"
            section="${section%]}"
            continue
        fi

        if [[ $section == "display" ]] || [[ $section == "power" ]]; then
            if [[ $line =~ .*=.* ]]; then
                key="${line%%=*}"
                value="${line#*=}"
                config[$key]="$value"
            fi
        fi
    done < "$config_file"
}

while (( "$#" )); do
  case "$1" in
    -c|--config)
      if [ -n "$2" ] && [ ${2:0:1} != "-" ]; then
        config_file=$2
        shift 2
      else
        printf "Error: Argument for %s is missing\n" "$1" >&2
        exit 1
      fi
      ;;
    -*|--*=) 
      printf "Error: Unsupported flag %s\n" "$1" >&2
      exit 1
      ;;
    *) 
      PARAMS="$PARAMS $1"
      shift
      ;;
  esac
done

eval set -- "$PARAMS"

if [ ! -f "$config_file" ]; then
    printf "Config file not found: %s\n" "$config_file"
    config_file="$HOME/.config/ddh/config.ini"
fi

printf "Using config file: %s\n" "$config_file"

while true; do
    read_config

    resolutions=(${config[RESOLUTIONS]})
    refresh_rates=(${config[REFRESH_RATES]})
    max_refresh_rates=(${config[MAX_REFRESH_RATES]})
    displays=(${config[DISPLAYS]})
    current_power=$(< /sys/class/power_supply/$ac_dir/online)

    current_displays=($(xrandr -q | awk '/ connected / {print $1}'))

    if [[ ${current_displays[*]} != $displays ]]; then
        for index in "${!current_displays[@]}"; do
            display=${current_displays[$index]}
            pos=$(printf "%s" "${config[DISPLAYS_POSITIONS]}" | tr -d '[:space:]')
            if [[ $index != 0 ]]; then
                if [[ $pos == "right-of" ]]; then
                    xrandr --output "$display" --mode "${resolutions[index]}" --rate "${max_refresh_rates[index]}" --right-of "${displays[index-1]}"
                else
                    xrandr --output "$display" --mode "${resolutions[index]}" --rate "${max_refresh_rates[index]}" --left-of "${displays[index-1]}"
                fi
            else
                xrandr --output "$display" --mode "${resolutions[index]}" --rate "${max_refresh_rates[index]}" --primary
            fi
        done

        sed -i "s/DISPLAYS=.*$/DISPLAYS=${current_displays[*]}/" "$config_file"
    fi

    if [[ $current_power != ${config[AC]} ]]; then
        index=0

        if [[ $current_power == "1" ]]; then
            for display in "${current_displays[@]}"; do
                xrandr --output "$display" --mode "${resolutions[index]}" --rate "${max_refresh_rates[index]}"
                ((index++))
            done
            xbacklight -set "${config[AC_BRIGHTNESS]}"
        else
            for display in "${current_displays[@]}"; do
                xrandr --output "$display" --mode "${resolutions[index]}" --rate "${refresh_rates[index]}"
                ((index++))
            done
            xbacklight -set "${config[BATTERY_BRIGHTNESS]}"
        fi
        sed -i "s/AC=.*$/AC=$current_power/" "$config_file"
    fi

    sleep 2
done
