#!/bin/bash

user_home=$(getent passwd $(logname) | cut -d: -f6)

config_file="$user_home/.config/ddh/config.ini"
mkdir -p $(dirname $config_file)

sudo chown -R $(logname):$(logname) $user_home/.config/ddh

connected_displays=($(xrandr | awk '/ connected / {print $1}'))

declare -A max_refresh_rates
declare -A closest_refresh_rates
declare -A resolutions

for display in ${connected_displays[@]}; do
    max_resolution=$(xrandr | grep -P "^$display" -A1 | tail -n1 | awk '{print $1}')
    refresh_rates=($(xrandr -q | grep -P "^$display" -A1 | tail -n 1 | awk '{$1=""; print $0}' | sed 's/^ *//' | tr -dc '0-9. '))

    max_refresh_rates[$display]=$(echo ${refresh_rates[@]} | tr ' ' '\n' | sort -n | tail -n 1)
    
    closest_refresh_rates[$display]=$(echo ${refresh_rates[@]} | tr ' ' '\n' | sort -n | awk -v target=60 'function abs(x){return ((x < 0) ? -x : x)} BEGIN{min=1e9}{
        if (abs($1-target)<min) {
            min=abs($1-target)
            val=$1
        }
    }END{print val}')

    abs() {
        if [ $1 -lt 0 ]; then
            echo "$((-1 * $1))"
        else
            echo "$1"
        fi
    }

    resolutions[$display]=$max_resolution
done

ac_dir=$(ls /sys/class/power_supply/ | grep -P "AC")
ac=$(cat /sys/class/power_supply/$ac_dir/online)

if [ ! -f $config_file ]; then
    echo "Creating config file at $config_file."    
    
    echo "[display]" >> $config_file
    echo "DISPLAYS=${connected_displays[@]}" >> $config_file
    echo -n "DISPLAYS_POSITIONS=" >> $config_file
    for display in ${connected_displays[@]}; do
        if [[ $display != ${connected_displays[0]} ]]; then
            echo -n "right-of " >> $config_file
        else
            echo -n "primary " >> $config_file
        fi
    done
    echo >> $config_file

    echo "PRIMARY_DISPLAY=${connected_displays[0]}" >> $config_file

    echo -n "MAX_REFRESH_RATES=" >> $config_file
    for display in ${connected_displays[@]}; do
        echo -n "${max_refresh_rates[$display]} " >> $config_file
    done
    echo >> $config_file

    echo -n "REFRESH_RATES=" >> $config_file
    for display in ${connected_displays[@]}; do
        echo -n "${closest_refresh_rates[$display]} " >> $config_file
    done
    echo >> $config_file

    echo -n "RESOLUTIONS=" >> $config_file
    for display in ${connected_displays[@]}; do
        echo -n "${resolutions[$display]} " >> $config_file
    done
    echo >> $config_file
    echo >> $config_file
    
    echo "[power]" >> $config_file
    echo "AC=$ac" >> $config_file
    echo "AC_BRIGHTNESS=100" >> $config_file
    echo "BATTERY_BRIGHTNESS=30" >> $config_file

    echo "Config file created."
fi


script_name="ddh.sh"
script_path="/usr/local/bin"

sudo cp ./$script_name $script_path
sudo chmod +x $script_path/$script_name

echo "Script installed at $script_path/$script_name."

service_name="ddh"

sudo echo "[Unit]
Description=DynamicDisplayHandler
After=multi-user.target

[Service]
User=$(logname)
Environment="DISPLAY=:0"
ExecStart=$script_path/$script_name -c $config_file
Restart=always

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/$service_name.service

sudo systemctl daemon-reload
sudo systemctl enable $service_name
sudo systemctl start $service_name

echo "Service installed as $service_name."

echo "Setup complete."
