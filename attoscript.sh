#!/bin/bash

# To add a custom ascii art,
# import an ascii art as .txt
# in the script's directoy,
# then refer its name below:
ascii=ascii.txt

# Entire table of ANSI codes: https://gist.github.com/JBlond/2fea43a3049b38287e5e9cefc87b2124
# The 2ndarg is used for color: 97 is white, 0 resets color, etc.
# The 1starg is used for bold and other formats: 1 is bold, 0 resets its format, etc.
# Check the table linked above!

# 2NDARGS
tcolor="97" # TITLE ANSI    def[97]
bcolor="0"  # BODY ANSI     def[0]
acolor="97" # ASCII ANSI    def[97]

# 1STARGS
tbold="1"   # TITLE ANSI    def[1]
bbold="0"   # BODY ANSI     def[0]
abold="0"   # ASCII ANSI    def[0]

### SCRIPT: ###

# Ascii height:
h=$(cat /usr/share/attofetch/$ascii | wc -l)

# Fetch strings:
string=(
    "\033[${tcolor}m ${USER}\033[${tbold};${tcolor}m@\033[0;${tcolor}m${HOSTNAME}\033[0m"
    "\033[${tbold};${tcolor}m Distribution:\033[0m\033[${bbold};${bcolor}m $(source /etc/os-release && echo "$NAME")\033[0m"
    "\033[${tbold};${tcolor}m Kernel:\033[0m\033[${bbold};${bcolor}m$(uname -s) $(uname -r)\033[0m"
    "\033[${tbold};${tcolor}m Packages:\033[0m\033[${bbold};${bcolor}m $(pacman -Q | wc -l)\033[0m"
    "\033[${tbold};${tcolor}m DE/WM:\033[0m\033[${bbold};${bcolor}m $XDG_CURRENT_DESKTOP\033[0m"
    "\033[${tbold};${tcolor}m Terminal:\033[0m\033[${bbold};${bcolor}m $TERM, $SHELL\033[0m"
    "\033[${tbold};${tcolor}m RAM:\033[0m\033[${bbold};${bcolor}m $(free -h | awk '/^Mem:/ {print $3 "/" $2}')\033[0m"
    "\033[${tbold};${tcolor}m Disk:\033[0m\033[${bbold};${bcolor}m $(df -h / | awk 'NR==2 {print $3 "/" $2 " (" $5 " used)"}')\033[0m"
    "\033[${tbold};${tcolor}m Uptime:\033[0m\033[${bbold};${bcolor}m $(uptime -p | sed 's/up //')\033[0m"
    )

x=0 # var
# Printing ascii plus fetch per line:
if [ $h -lt 9 ]; then
    echo -e "[ERROR]: Your selected ascii art must be at least nine lines high.\n[:::::]: I recommend leaving blank lines around the ascii art;\nrather than disabling this condition so it doesn't look funky."
else
    until [ $x -gt $h ]
    do
        (( x++ ))
        fetch=${string[((x-1) % ${#string[@]})]}
        echo -n -e "\033[${abold};${acolor}m$(sed -n "${x}p" "/usr/share/attofetch/$ascii")\033[0m";
        if [ $x -le 9 ]; then
            echo -n -e "    $fetch\n"
        else
            echo ""
        fi
    done
fi
