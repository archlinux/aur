#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_DIR="/usr/share/vendetta-rice/dotfiles_${TIMESTAMP}.backup"

echo -e "${GREEN}3. Backup config dotfiles to ${BACKUP_DIR}...${NC}"
mkdir -p "$BACKUP_DIR"

BACKUP_LIST="/usr/share/vendetta-rice/dotfiles/dotfiles-list.txt"
while read -r ITEM || [[ -n "$ITEM" ]]; do
    ITEM=$(echo "$ITEM" | xargs)
    [[ -z "$ITEM" ]] && continue

    SRC="$HOME/$ITEM"
    DEST="$BACKUP_DIR/$ITEM"

    if [[ -e "$SRC" ]]; then
        mkdir -p "$(dirname "$DEST")"
        cp -a "$SRC" "$DEST"
    fi
done < "$BACKUP_LIST"

echo -e "${GREEN}Backup completed.${NC}"
