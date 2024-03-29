#!/bin/bash

# Function to display initialization prompt
display_init_prompt() {
    clear
    echo "================================="
    echo "| Welcome to Optimize My Arch!  |"
    echo "================================="
    echo "Let's set up your Arch Linux environment."
    echo ""

    # Desktop Environment Options
    echo "Choose your preferred desktop environment:"
    echo "1. KDE Plasma [Default]"
    echo "2. GNOME"
    echo "3. Xfce"
    echo "4. Cinnamon"
    echo "5. MATE"
    echo "6. LXQt"
    echo "7. i3 (tiling window manager)"
    read -p "Enter the number of your preferred desktop environment [1]: " desktop_environment_choice

    case $desktop_environment_choice in
        1) desktop_environment="KDE Plasma" ;;
        2) desktop_environment="GNOME" ;;
        3) desktop_environment="Xfce" ;;
        4) desktop_environment="Cinnamon" ;;
        5) desktop_environment="MATE" ;;
        6) desktop_environment="LXQt" ;;
        7) desktop_environment="i3" ;;
        *) desktop_environment="KDE Plasma" ;;
    esac

    # Disk Type Options
    echo ""
    echo "Choose your disk type:"
    echo "1. SATA (sda) [Default]"
    echo "2. HDD (sdb, etc.)"
    echo "3. SSD (sdb, etc.)"
    echo "4. NVMe"
    read -p "Enter the number of your disk type [1]: " disk_type_choice

    case $disk_type_choice in
        1) disk_type="SATA" ;;
        2) disk_type="HDD" ;;
        3) disk_type="SSD" ;;
        4) disk_type="NVMe" ;;
        *) disk_type="SATA" ;;
    esac

    # AUR Helper Options
    echo ""
    echo "Choose your AUR helper:"
    echo "1. paru [Default]"
    echo "2. yay"
    echo "3. pacman"
    read -p "Enter the number of your preferred AUR helper [1]: " aur_helper_choice

    case $aur_helper_choice in
        1) aur_helper="paru" ;;
        2) aur_helper="yay" ;;
        3) aur_helper="pacman" ;;
        *) aur_helper="paru" ;;
    esac

    # Purpose of using Arch Linux Options
    echo ""
    echo "Choose the primary purpose of using Arch Linux:"
    echo "1. Casual/Browsing [Default]"
    echo "2. Coding/Development"
    echo "3. Gaming"
    echo "4. Multimedia/Content Creation"
    echo "5. Server/Networking"
    read -p "Enter the number of your primary purpose [1]: " purpose_choice

    case $purpose_choice in
        1) purpose="Casual/Browsing" ;;
        2) purpose="Coding/Development" ;;
        3) purpose="Gaming" ;;
        4) purpose="Multimedia/Content Creation" ;;
        5) purpose="Server/Networking" ;;
        *) purpose="Casual/Browsing" ;;
    esac

    read -p "Would you like to optimize for this purpose? (y/N): " optimize_choice
    case $optimize_choice in
        [yY]) optimize_purpose="y" ;;
        *) optimize_purpose="n" ;;
    esac
}
