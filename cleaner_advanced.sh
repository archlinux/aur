#!/bin/bash

# Funzioni di pulizia
function pacman_cache_clean() {
    if [[ $language == "EN" ]]; then
        echo "This command removes all packages downloaded by Pacman that are not currently installed on the system."
    else
        echo "Questo comando rimuove tutti i pacchetti scaricati da Pacman che non sono attualmente installati nel sistema."
    fi
    echo "Proceed? (Y/N)"
    read answer
    if [[ $answer == "Y" || $answer == "y" ]]; then
        sudo pacman -Sc
    fi
}

# Aggiungi altre funzioni di pulizia qui con la stessa logica

# Funzioni di menu
function main_menu() {
    clear
    echo "Cleaner Advanced is a software developed by Klod Cripta"
    echo "Choose your language:"
    echo "1. English"
    echo "2. Italiano"
    read language_choice

    if [[ $language_choice == "1" ]]; then
        language="EN"
    elif [[ $language_choice == "2" ]]; then
        language="IT"
    else
        echo "Invalid choice, defaulting to English."
        language="EN"
    fi

    clear
    echo "Cleaner Advanced"
    echo "1. Light Clean (Pulizia Leggera)"
    echo "2. Deep Clean (Pulizia Profonda)"
    echo "3. Exit"
    echo "Choose an option: "
    read clean_choice

    case $clean_choice in
        1) light_clean ;;
        2) deep_clean ;;
        3) exit ;;
        *) echo "Invalid choice!" ;;
    esac
}

function light_clean() {
    clear
    if [[ $language == "EN" ]]; then
        echo "Light Clean selected"
    else
        echo "Pulizia Leggera selezionata"
    fi
    pacman_cache_clean
    # Aggiungi altre operazioni di pulizia qui con la stessa logica
}

function deep_clean() {
    clear
    if [[ $language == "EN" ]]; then
        echo "Deep Clean selected"
    else
        echo "Pulizia Profonda selezionata"
    fi
    pacman_cache_clean
    # Aggiungi altre operazioni di pulizia qui con la stessa logica
}

# Avvia il menu principale
while true; do
    main_menu
done
