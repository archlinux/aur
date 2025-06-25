#!/bin/sh
export SNEKSTUDIO_CONFIG_PATH=${XDG_CONFIG_HOME:-$HOME/.config}/SnekStudio
export SNEKSTUDIO_CACHE_PATH=${XDG_CACHE_HOME:-$HOME/.cache}/SnekStudio
export SNEKSTUDIO_MODS_PATHS=${XDG_CONFIG_HOME:-$HOME/.config}/SnekStudio/mods
cd /usr/share/snekstudio
/usr/share/snekstudio/snekstudio
