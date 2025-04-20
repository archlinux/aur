#!/bin/bash

CONFIG_DIR="$HOME/.config/tea"
TRACK_FILE="$CONFIG_DIR/installed.txt"
BIN_PATH="/usr/local/bin/tea"

mkdir -p "$CONFIG_DIR"
touch "$TRACK_FILE"

YELLOW='\e[33m'
BOLD='\e[1m'
RESET='\e[0m'

check_removed_pkgs() {
    echo -e "\nChecking removed AUR packages..."
    DELETED_PKGS=$(curl -s 'https://aur.archlinux.org/packages/?O=0&SeB=nd&K=&SB=n&SO=d&PP=50&outdated=&SB=d&SO=a' | grep -oP '(?<=<a href="/packages/)[^"]+')
    while read -r pkg; do
        [[ -z "$pkg" ]] && continue
        response=$(curl -s "https://aur.archlinux.org/rpc/?v=5&type=info&arg=$pkg")
        if echo "$response" | grep -q '"resultcount":0' || echo "$DELETED_PKGS" | grep -q "^$pkg$"; then
            echo -e "${YELLOW}WARNING!${RESET} Package ${BOLD}$pkg${RESET} is no longer in the AUR!"
            echo -e "To remove, run: sudo tea -R $pkg"
        fi
    done < "$TRACK_FILE"
    echo ""
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
    echo "Installing tea to /usr/local/bin..."
    sudo cp "$0" "$BIN_PATH"
    sudo chmod +x "$BIN_PATH"
    echo "Done! Now you can run: tea -S <pkg> or sudo tea -R <pkg>"
    exit 0
}

update_aur_pkgs() {
    echo "Updating installed AUR packages..."
    for pkg in $(cat "$TRACK_FILE"); do
        echo "Updating $pkg..."
        cd "$pkg" || continue
        git pull --ff-only || git fetch --all && git reset --hard origin/master
        makepkg -si
        cd ..
    done
    echo "All AUR packages updated!"
}

if [[ "$(basename "$0")" == "tea.sh" && "$1" != "--install" ]]; then
    echo "Usage:"
    echo "  tea -S <package>     Install AUR package"
    echo "  sudo tea -R <package> Remove AUR package"
    echo "  ./tea.sh --install    Install tea globally"
    echo "  tea -Sy               Update AUR packages"
    exit 1
fi

check_removed_pkgs

case "$1" in
    -S)
        [[ -z "$2" ]] && echo "Usage: tea -S <package>" && exit 1
        install_pkg "$2"
        ;;
    -R)
        [[ -z "$2" ]] && echo "Usage: sudo tea -R <package>" && exit 1
        remove_pkg "$2"
        ;;
    --install)
        install_self
        ;;
    -Sy)
        update_aur_pkgs
        ;;
    *)
        exit 0
        ;;
esac
