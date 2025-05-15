#!/bin/bash

### ATENTION ###
# You shouldn't edit this file on regular use, configure it at /etc/attosfetch.conf.
# However you can modify everything you want.

### CONFIGURATION ###
source /etc/attosfetch.conf

### ASCII HEIGHT AND WIDTH ###
h=$(cat /usr/share/attosfetch/$ascii | wc -l)
w=$(cat /usr/share/attosfetch/$ascii | wc -L)

### TEXT FORMAT ###
title="\033[${st_title};${nd_title}m"
body="\033[${st_body};${nd_body}m"
asciif="\033[${st_ascii};${nd_ascii}m"
reset="\033[0m"

### STRINGS ###
text=("" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
    "${reset}${body}${USER}${title}@${body}${HOSTNAME}${reset}"
    "${reset}${title}Distribution:${body} $(source /etc/os-release && echo "$NAME")${reset}"
    "${reset}${title}Kernel:${body} $(uname -s) $(uname -r)${reset}"
    "${reset}${title}Packages:${body} $(pacman -Q | wc -l)${reset}"
    "${reset}${title}DE/WM:${body} $XDG_CURRENT_DESKTOP${reset}"
    "${reset}${title}Terminal:${body} $TERM. $SHELL${reset}"
    "${reset}${title}RAM:${body} $(free -h | awk '/^Mem:/ {print $3 "/" $2 }')${reset}"
    "${reset}${title}Disk:${body} $(df -h / | awk 'NR==2 {print $3 "/" $2 "(" $5 " used)"}')${reset}"
    "${reset}${title}Uptime:${body} $(uptime -p | sed 's/up //')${reset}"
    )

### SCRIPT ###
x=0
s=""

for ((i = 0; i < x_padding; i++)); do
	s+=" "
done

until [ $x -eq $h ]
do
    echo -e "${asciif}$(sed -n "$((x + 1))p" "/usr/share/attosfetch/$ascii")${reset}\n${s}${text[$((x + 20 - y_padding))]}" | paste - - | column
    (( x++ ))
done
