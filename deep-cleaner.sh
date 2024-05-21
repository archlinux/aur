#!/bin/bash

# Colori per il testo
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Funzione per la pulizia dei pacchetti AUR helper
function aur_helper_clean() {
    if [[ $language == "EN" ]]; then
        echo -e "${BLUE}This command removes unnecessary files and caches from the AUR helper.${NC}"
    else
        echo -e "${BLUE}Questo comando rimuove file e cache non necessari dall'AUR helper.${NC}"
    fi

    if command -v paru &> /dev/null; then
        echo -e "${CYAN}Using paru for cleaning...${NC}"
        paru -Sc
    elif command -v yay &> /dev/null; then
        echo -e "${CYAN}Using yay for cleaning...${NC}"
        yay -Sc
    elif command -v pikaur &> /dev/null; then
        echo -e "${CYAN}Using pikaur for cleaning...${NC}"
        pikaur -Sc
    else
        if [[ $language == "EN" ]]; then
            echo -e "${RED}No recognized AUR helper found.${NC}"
        else
            echo -e "${RED}Nessun AUR helper riconosciuto trovato.${NC}"
        fi
    fi
    echo -e "${GREEN}AUR helper cleaning complete.${NC}"
    read -p "Press any key to return to the main menu..." -n1 -s
}

# Funzione per la pulizia leggera
function light_clean() {
    clear
    if [[ $language == "EN" ]]; then
        echo -e "${GREEN}Light Clean selected${NC}"
        echo -e "${CYAN}This command removes unnecessary files and caches from the system.${NC}"
        echo -e "${CYAN}Proceed? (Y/N)${NC}"
    else
        echo -e "${GREEN}Pulizia Leggera selezionata${NC}"
        echo -e "${CYAN}Questo comando rimuove file e cache non necessari dal sistema.${NC}"
        echo -e "${CYAN}Procedere? (S/N)${NC}"
    fi
    read answer
    if [[ $answer == "Y" || $answer == "y" || $answer == "S" || $answer == "s" ]]; then
        sudo pacman -Sc
    fi
}

# Funzione per la pulizia profonda
function deep_clean() {
    clear
    if [[ $language == "EN" ]]; then
        echo -e "${GREEN}Deep Clean selected${NC}"
        echo -e "${CYAN}This command performs a deep clean, removing unnecessary files, caches, and dependencies from the system.${NC}"
        echo -e "${CYAN}Proceed? (Y/N)${NC}"
    else
        echo -e "${GREEN}Pulizia Profonda selezionata${NC}"
        echo -e "${CYAN}Questo comando esegue una pulizia profonda, rimuovendo file, cache e dipendenze non necessarie dal sistema.${NC}"
        echo -e "${CYAN}Procedere? (S/N)${NC}"
    fi
    read answer
    if [[ $answer == "Y" || $answer == "y" || $answer == "S" || $answer == "s" ]]; then
        sudo pacman -Scc
    fi
}

# Funzioni di menu
function main_menu() {
    clear
    if [[ $language == "EN" ]]; then
        echo -e "${GREEN}Cleaner Advanced${NC}"
        echo -e "${CYAN}1. Light Clean${NC}"
        echo -e "${CYAN}2. Deep Clean${NC}"
        echo -e "${CYAN}3. Clean AUR Helper${NC}"
        echo -e "${CYAN}4. Exit${NC}"
        echo -e "${CYAN}Choose an option: ${NC}"
    else
        echo -e "${GREEN}Cleaner Advanced${NC}"
        echo -e "${CYAN}1. Pulizia Leggera${NC}"
        echo -e "${CYAN}2. Pulizia Profonda${NC}"
        echo -e "${CYAN}3. Pulizia AUR Helper${NC}"
        echo -e "${CYAN}4. Exit${NC}"
        echo -e "${CYAN}Scegli un'opzione: ${NC}"
    fi

    read clean_choice

    case $clean_choice in
        1) light_clean ;;
        2) deep_clean ;;
        3) aur_helper_clean ;;
        4) exit ;;
        *) echo -e "${RED}Invalid choice!${NC}" ;;
    esac
}

# Avvio del menu principale
clear
echo -e "${GREEN}Cleaner Advanced è un software sviluppato da Klod Cripta${NC}"
echo -e "${CYAN}Scegli la tua lingua:${NC}"
echo -e "${CYAN}1. English${NC}"
echo -e "${CYAN}2. Italiano${NC}"
read language_choice

if [[ $language_choice == "1" ]]; then
    language="EN"
elif [[ $language_choice == "2" ]]; then
    language="IT"
else
    echo -e "${RED}Invalid choice, defaulting to English.${NC}"
    language="EN"
fi

while true; do
    main_menu
done
