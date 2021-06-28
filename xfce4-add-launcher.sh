#!/bin/bash

# Die on error
set -e

# Create launcher desktop entry
{
  dir='/home/yoda/.config/xfce4/panel/launcher-99/'
  if [ -d "$dir" ]; then
    echo "$dir does already exist!"
    exit 1
  fi
  mkdir -p "$dir"

echo '[Desktop Entry]
Version=1.0
Type=Application
Name=ToggleBluetooth
Comment=Toggle Bluetooth on/off
Exec=toggle-bluetooth
Icon=nm-device-wwan
Path=
Terminal=false
StartupNotify=false' > /home/yoda/.config/xfce4/panel/launcher-99/99.desktop
}

# Cancel if plugin-99 does already exist

file="$HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml"
if cat "$file" | grep 'plugin-99'; then
  echo "'plugin-99' does already exist in $file!"
  exit 1
fi

# Modify xfce4 configuration
# https://docs.xfce.org/xfce/xfconf/xfconf-query

# Create "plugin-99" entry
xfconf-query --channel xfce4-panel -p /plugins/plugin-99       --create --type string --set launcher
xfconf-query --channel xfce4-panel -p /plugins/plugin-99/items --create --type string --set 99.desktop --force-array

# Add "plugin-99" to the left of "panel-1"
{
  plugin_ids=()
  lines="$(xfconf-query --channel xfce4-panel -p /panels/panel-1/plugin-ids | grep --invert-match "array")"
  while read -r line; do
    if [ "$line" != '' ]; then
      plugin_ids+=("$line")
    fi
  done <<< "${lines}"

  array_args_1=()
  array_args_2=()
  for plugin_id in "${plugin_ids[@]}"; do
    array_args_1+=('--type' 'int')
    array_args_2+=('--set' "$plugin_id")
  done
  array_args_1+=('--type' 'int')
  array_args_2+=('--set' '99')

  xfconf-query --channel xfce4-panel -p /panels/panel-1/plugin-ids "${array_args_1[@]}" "${array_args_2[@]}"
}
