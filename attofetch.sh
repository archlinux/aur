### ATENTION ###
#
# If you want to edit the tool, please do it in the appropiate configuration file.
# The configuration file is at /etc/attofetch.cfg
# However you can still modify the source code if you want.
#
# CONFIGURATION #V
#
source /etc/attofetch.cfg
#
# ASCII HEIGHT AND WIDTH #V
#
h=$(cat /usr/share/attofetch/$ascii | wc -l)
w=$(cat /usr/share/attofetch/$ascii | wc -L)
#
# TEXT FORMAT #V
#
title="\033[${st_title};${nd_title}m"
body="\033[${st_body};${nd_body}m"
asciif="\033[${st_ascii};${nd_ascii}m"
reset="\033[0m"
#
# STRINGS #V
text=("" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
    "${body}${USER}${title}@${body}${HOSTNAME}${reset}"
    "${title}Distribution: ${body}$(source /etc/os-release && echo "$NAME")${reset}"
    "${title}Kernel: ${body}$(uname -s) $(uname -r)${reset}"
    "${title}Packages: ${body}$(pacman -Q | wc -l)${reset}"
    "${title}DE/WM: ${body}$XDG_CURRENT_DESKTOP${reset}"
    "${title}Terminal: ${body}$TERM. $SHELL${reset}"
    "${title}RAM: ${body}$(free -h | awk '/^Mem:/ {print $3 "/" $2 }')${reset}"
    "${title}Disk: ${body}$(df -h | awk 'NR==2 {print $3 "/" $2 "(" $5 " used)"}')${reset}"
    "${title}Uptime: ${body}$(uptime -p | sed 's/up //')${reset}"
    )

# SCRIPT
x=0
y=""

for ((i = 0; i < y_padding; i++)); do
  y="$y\n"
done

until [ $x -eq $((h + y_padding)) ]
do
    printf "%-$((w + x_padding + 7))s %-50s\n" "$(echo -e "${asciif}$(sed -n "$((x + 1))p" "/usr/share/attofetch/$ascii")")" "$(echo -e "${text[$((x + 20 - y_padding))]}")"
    (( x++ ))
done
