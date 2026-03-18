#!/bin/bash

export GUM_CHOOSE_SELECTED_FOREGROUND="212"
export GUM_CHOOSE_HEADER_FOREGROUND="57"

if [ ! -f /etc/arch-release ]; then
    echo "Erreur : Ce script est conçu pour Arch Linux ou ses distro dérivées" | gum format
    exit 1
fi

echo "--- BIENVENUE DANS LE DEPENDENCIES SETUP DE LA BEBZERIE ---" | gum format

MODE=$(gum choose "Sélection manuelle" "All-In (Tout installer)" "Quitter")

if [ "$MODE" == "Quitter" ] || [ -z "$MODE" ]; then exit 0; fi

LISTE=""

if [ "$MODE" == "All-In (Tout installer)" ]; then
    LISTE="nvidia-dkms nvidia-utils lib32-nvidia-utils steam discord networkmanager nm-connection-editor bluez bluez-utils git base-devel lutris heroic-games-launcher-bin wine-staging winetricks gamemode lib32-gamemode mangohud lib32-mangohud giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap vulkan-icd-loader lib32-vulkan-icd-loader"
else
    while true; do
    CAT=$(gum choose --header "Catégories (Espace pour cocher) :" "Gaming" "Système")
    if [ "$CAT" == "Annuler" ]; then exit 0; fi
        if [ "$CAT" == "--- Terminer et Installer ---" ] || [ -z "$CAT" ]; then break; fi
    if [[ $CAT == *"Gaming"* ]]; then
        GAMING_CHOICE=$(gum choose --no-limit --header "Jeux :" "steam" "lutris" "heroic-games-launcher-bin" "wine-staging")
        LISTE="$LISTE $GAMING_CHOICE"
    fi

    if [[ $CAT == *"Système"* ]]; then
        SYSTEM_CHOICE=$(gum choose --no-limit --header "Système :" "nvidia-dkms" "discord" "bluez" "lib32-nvidia-utils" "networkmanager" "nm-connection-editor" "bluez-utils" "git" "base-devel" "giflib" "lib32-giflib" "libpng" "lib32-libpng" "libldap" "lib32-libldap" "vulkan-icd-loader" "lib32-vulkan-icd-loader")
        LISTE="$LISTE $SYSTEM_CHOICE"
    fi
    echo "Sélection actuelle ajoutée. Tu peux choisir une autre catégorie ou terminer." | gum format
    done
fi

FINAL_LIST=$(echo "$LISTE" | tr '\n' ' ' | xargs -n1 | sort -u |xargs)

if [ -n "$FINAL_LIST" ]; then
    echo "## Préparation de l'installation de :" | gum format
    echo "$FINAL_LIST"

    if gum confirm "Lancer l'installation maintenant ?"; then
        sudo pacman -S --needed $FINAL_LIST
    else
        echo "Installation annulée par l'utilisateur."
    fi
else
    echo "Rien à installer (Aucune option cochée)" | gum format
fi
