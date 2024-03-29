#!/bin/bash

# Function to load configuration from file
load_config() {
    source "$config_file"
}

# Check if configuration file exists
if [ ! -f "$config_file" ]; then
    perform_init
    exit 0
fi

# Load configuration
load_config

# Function to install dependencies based on user input
install_dependencies() {
    case $1 in
        "paru")
            if ! command -v paru &> /dev/null; then
                git clone https://aur.archlinux.org/paru.git
                cd paru || exit
                makepkg -si --noconfirm
                cd .. || exit
                rm -rf paru
            fi
            ;;
        "yay")
            if ! command -v yay &> /dev/null; then
                sudo pacman -S --needed --noconfirm yay
            fi
            ;;
        *)
            echo "Invalid AUR helper selected. Using pacman as default."
            ;;
    esac
}
