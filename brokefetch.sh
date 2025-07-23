#!/bin/bash

BLUE="\e[34m"
BOLD="\e[1m"
RESET="\e[0m"
PKG_COUNT=$(pacman -Q | wc -l)

# CONFIG
CONFIG_FILE="$HOME/.config/brokefetch/config"

# Jeśli nie ma configu – utwórz domyślny
if [[ ! -f "$CONFIG_FILE" ]]; then
    mkdir -p "$(dirname "$CONFIG_FILE")"
    echo -e "RAM_GB=4\nUPTIME_OVERRIDE=0" > "$CONFIG_FILE"
fi

# Wczytaj wartości z configu
source "$CONFIG_FILE"

# Uptime
if [[ "$UPTIME_OVERRIDE" == "1" ]]; then
    UPTIME=$(uptime -p | sed 's/up //')
else
    UPTIME="14h (sleep not included)"
fi

# RAM
MEMORY_MB=$(( RAM_GB * 1024 ))

echo -e "${BLUE}                -\`                   ${RESET}$(whoami)@brokelaptop"
echo -e "${BLUE}               .o+\`                  ${RESET} ---------------------"
echo -e "${BLUE}              \`ooo/                  ${BOLD}OS:${RESET} Arch Linux (Unpaid Edition)"
echo -e "${BLUE}             \`+oooo:                 ${BOLD}Host:${RESET} Bedroom Floor"
echo -e "${BLUE}            \`+oooooo:                ${BOLD}Kernel:${RESET} 0.00/hr"
echo -e "${BLUE}            -+oooooo+:               ${BOLD}Uptime:${RESET} $UPTIME"
echo -e "${BLUE}          \`/:-:++oooo+:              ${BOLD}Packages:${RESET} $PKG_COUNT (none legal)"
echo -e "${BLUE}         \`/++++/+++++++:             ${BOLD}Shell:${RESET} brokeBash 0.01"
echo -e "${BLUE}        \`/++++++++++++++:            ${BOLD}Resolution:${RESET} CRT 640x480"
echo -e "${BLUE}       \`/+++ooooooooooooo/\`          ${BOLD}DE:${RESET} Crying"
echo -e "${BLUE}      ./ooosssso++osssssso+\`         ${BOLD}WM:${RESET} HopiumWM"
echo -e "${BLUE}     .oossssso-\`\`\`\`/ossssss+\`        ${BOLD}Terminal:${RESET} Terminal of Regret"
echo -e "${BLUE}    -osssssso.      :ssssssso.       ${BOLD}CPU:${RESET} Imaginary (thinking hard...)"
echo -e "${BLUE}   :osssssss/        osssso+++.\     ${BOLD}GPU:${RESET} Integrated Depression"
echo -e "${BLUE}  /ossssssss/        +ssssooo/-      ${BOLD}Memory:${RESET} ${MEMORY_MB}MB (user-defined)"
echo -e "${BLUE} \`/ossssso+/:-        -:/+osssso+-"
echo -e "${BLUE}\`+sso+:-\`                 \`.-/+oso:"
echo -e "${BLUE}\`++:.                           \`-/+/"
echo -e "${BLUE}\`.\`                                \`"

echo -e "${BOLD}BROKEFETCH 🥀 1.5 ${RESET}"

