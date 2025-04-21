#!/bin/bash

CONFIG_DIR="$HOME/.config/velo"
TRACK_FILE="$CONFIG_DIR/installed.txt"
BIN_PATH="/usr/local/bin/velo"

mkdir -p "$CONFIG_DIR"
touch "$TRACK_FILE"

YELLOW='\e[33m'
BOLD='\e[1m'
RESET='\e[0m'

LOCAL_VERSION="1.2.0"
REMOTE_VERSION_URL="https://raw.githubusercontent.com/sparksistaken/velo/refs/heads/main/version"

check_removed_pkgs() {
    echo -e "\nChecking removed AUR packages..."
    DELETED_PKGS=$(curl -s 'https://aur.archlinux.org/packages/?O=0&SeB=nd&K=&SB=n&SO=d&PP=50&outdated=&SB=d&SO=a' | grep -oP '(?<=<a href="/packages/)[^"]+')
    while read -r pkg; do
        [[ -z "$pkg" ]] && continue
        response=$(curl -s "https://aur.archlinux.org/rpc/?v=5&type=info&arg=$pkg")
        if echo "$response" | grep -q '"resultcount":0' || echo "$DELETED_PKGS" | grep -q "^$pkg$"; then
            echo -e "${YELLOW}WARNING!${RESET} Package ${BOLD}$pkg${RESET} is no longer in the AUR!"
            echo -e "To remove, run: sudo velo -R $pkg"
        fi
    done < "$TRACK_FILE"
    echo ""
}

check_for_updates() {
    REMOTE_VERSION=$(curl -s "$REMOTE_VERSION_URL")
    if [[ "$REMOTE_VERSION" != "$LOCAL_VERSION" ]]; then
        echo -e "${YELLOW}WARNING!${RESET} A new update is available for velo. To update, run: ${BOLD}velo --update${RESET}"
    fi
}

install_pkg() {
    pkg="$1"
    echo "Installing $pkg from AUR..."
    git clone https://aur.archlinux.org/"$pkg".git || exit 1
    cd "$pkg" || exit 1
    makepkg -si
    cd ..
    rm -rf "$pkg"
    echo "$pkg" >> "$TRACK_FILE"
}

remove_pkg() {
    pkg="$1"
    echo "Removing $pkg..."
    sudo pacman -Rns "$pkg"
    sed -i "/^$pkg$/d" "$TRACK_FILE"
}

install_self() {
    echo "Installing velo to /usr/local/bin..."
    sudo cp "$0" "$BIN_PATH"
    sudo chmod +x "$BIN_PATH"
    echo "Done! Now you can run: velo -S <pkg>, sudo velo -R <pkg>, or velo -Syu"
    exit 0
}

update_aur_pkgs() {
    echo "Updating installed AUR packages..."
    for pkg in $(cat "$TRACK_FILE"); do
        echo "Updating $pkg..."
        if [ ! -d "$pkg" ]; then
            git clone https://aur.archlinux.org/"$pkg".git || continue
        fi
        cd "$pkg" || continue
        git pull --ff-only || git fetch --all && git reset --hard origin/master
        makepkg -si
        cd ..
    done
    echo "All AUR packages updated!"
}

update_system_and_aur() {
    echo "Running full system update (official + AUR)..."
    sudo pacman -Syu
    update_aur_pkgs
}

update_script() {
    echo "Updating velo script..."
    git clone https://aur.archlinux.org/velo.git || exit 1
    cd velo || exit 1
    makepkg -si || { echo "Failed to update velo script, check for errors."; exit 1; }
    cd ..
    rm -rf velo
}

if [[ "$1" == "--update" ]]; then
    update_script
    exit 0
fi

check_for_updates

if [[ "$(basename "$0")" == "velo.sh" && "$1" != "--install" ]]; then
    echo "Usage:"
    echo "  velo -S <package>       Install AUR package"
    echo "  sudo velo -R <package>  Remove AUR package (with -Rns)"
    echo "  velo -Sy                Update all AUR packages"
    echo "  velo -Syu               Full system + AUR update"
    echo "  ./velo.sh --install     Install velo globally"
    exit 1
fi

check_removed_pkgs

case "$1" in
    -S)
        [[ -z "$2" ]] && echo "Usage: velo -S <package>" && exit 1
        install_pkg "$2"
        ;;
    -R)
        [[ -z "$2" ]] && echo "Usage: sudo velo -R <package>" && exit 1
        remove_pkg "$2"
        ;;
    -Sy)
        update_aur_pkgs
        ;;
    -Syu)
        update_system_and_aur
        ;;
    --install)
        install_self
        ;;
    *)
        exit 0
        ;;
esac

