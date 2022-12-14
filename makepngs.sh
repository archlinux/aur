#!/usr/bin/env bash

# Some Colors from the Molokai colorscheme you can pick
BACKGROUND="#1B1D1E"
#BLACK="#232526"
#WHITE="#F8F8F0"
#RED="#FF0000"
#ORANGE="#FD971F"
MAGENTA="#F92672"
#CYAN="#66D9EF"
#GREEN="A6E22E"

# Set Desired Filll & Outline Colors
FILL_COLOR="${MAGENTA}"
OUTLINE_COLOR="${BACKGROUND}"

TEMP_VAR="42IPROBABLYDONTEXISTINTHESVGFILE9001"
sed -i -e "s/#ffffff/${TEMP_VAR}/g"   \
        -e "s/#bebebe/${TEMP_VAR}/g"   \
        -e "s/#dedede/${TEMP_VAR}/g"   \
        adwaita.svg
sed -i -e "s/#000000/${FILL_COLOR}/g" \
        -e "s/#484848/${FILL_COLOR}/g" \
        -e "s/#313131/${FILL_COLOR}/g" \
        adwaita.svg
sed -i "s/${TEMP_VAR}/${OUTLINE_COLOR}/g" adwaita.svg
./renderpngs.py -r -s -o -m 32 -a -c -n 1 adwaita.svg
