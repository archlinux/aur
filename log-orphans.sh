#!/bin/bash

# Colors
RED='\033[1;31m'
CYAN='\033[0;36m'
GRAY='\033[0;90m'
RESET='\033[0m'

pkgs="$(pacman -Qtdq)"

if [[ -n "$pkgs" ]]; then
    echo -e "${RED}You have orphans installed:${RESET}"
    while IFS= read -r pkg; do
        echo -e "  ${CYAN}${pkg}${RESET}"
    done <<< "$pkgs"
    echo -e "${GRAY}Keep: pacman -D --asexplicit <pkg>${RESET}"
    echo -e "${GRAY}Remove all: pacman -Qtdq | pacman -Rns -${RESET}"
fi
