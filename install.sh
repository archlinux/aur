#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

# -----------------------
# 1. Backup previous config
# -----------------------

read -erp "${GREEN}Do you want to backup your dotfiles before remove? [y/N]: ${NC}" BACKUP
if [[ "$BACKUP" =~ ^[Yy]$ ]]; then
    sh "/usr/bin/vendetta-rice/vendetta-rice-backup.sh"
else
    echo -e "${YELLOW}Backup cancelled.${NC}"
fi

# -----------------------
# 2. Import new config
# -----------------------

DOTFILES_DIR="/usr/share/vendetta-rice/dotfiles"
DOTFILES_LIST="${DOTFILES_DIR}/dotfiles-list.txt"
while read -r ITEM || [[ -n "$ITEM" ]]; do
    ITEM=$(echo "$ITEM" | xargs)
    [[ -z "$ITEM" ]] && continue

    SRC="${DOTFILES_DIR}/$ITEM"
    DEST="$HOME/$ITEM"

    if [[ -e "$SRC" ]]; then
        rm -rf "$DEST"
    fi

    mkdir -p "$(dirname "$DEST")"
    cp -a "$SRC" "$DEST"
done < "$DOTFILES_LIST"

sh "$HOME/.config/waybar/get_network_interfaces.sh"
mkdir -p "$HOME/Pictures/screenshots"
chsh -s $(which zsh)

# -----------------------
# 3. Reboot
# -----------------------

read -erp "${GREEN}Need reboot to apply changes. Reboot now? [y/N]: ${NC}" REBOOT
if [[ "$REBOOT" =~ ^[Yy]$ ]]; then
    sudo reboot
else
    echo "Reboot cancelled."
fi
