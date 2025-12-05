#!/bin/bash

TARGET_FILE="/opt/QQ/resources/app/package.json"
BACKUP_SUFFIX=".LLQQNT.bak"

PATCH_CONTENT="./app_launcher/LiteLoaderQQNT.js"

apply_patch() {
    local backup_file="${TARGET_FILE}${BACKUP_SUFFIX}"

    

    if [ ! -f "$TARGET_FILE" ]; then
        echo "!!! ERROR: ${TARGET_FILE} not found."
        echo "!!! This your LinuxQQ installation maybe broken, run pacman -Qkk <LinuxQQ> to check and reinstall if needed."
        echo "!!! OR, LinuxQQ have changed its file structure, we suggest you wait for the update for the patcher."
        exit 1
    fi

    # backup
    if [ ! -f "$backup_file" ]; then
        echo "--- Creating backup at ${backup_file}"
        if ! cp -p "$TARGET_FILE" "$backup_file"; then
            echo "!!! ERROR: Could not create backup file."
            exit 1
        fi
    else
        echo "--- Backup file already exists. Skipping..."
    fi

    # apply patch
    echo "--- Patching ${TARGET_FILE}..."
    local target_line=$(awk "/main/{print NR}" $TARGET_FILE)
    local target_content=$(awk -F '[:,]' '/"main"/ {gsub(/"| /, "", $2); print $2}' $TARGET_FILE)
    sed -i "${target_line}s!${target_content}!${PATCH_CONTENT}!g" $TARGET_FILE

    echo ">>> Patch applied successfully!"
}

restore_patch() {
    local backup_file="${TARGET_FILE}${BACKUP_SUFFIX}"

    echo ">>> Restoring..."

    # check backup file
    if [ ! -f "$backup_file" ]; then
        echo "!!! WARNING: No backup file found at ${backup_file}"
        echo "!!! If you haven't applied the patch before, this warning is expected and can be ignored."
        echo "!!! If you indeed applied the patch before, please reinstall the LinuxQQ to restore."
        exit 1
    fi

    # restore backup
    echo "--- Restoring from backup..."
    if ! cp -p "$backup_file" "$TARGET_FILE"; then
        echo "!!! ERROR: Could not restore backup."
        exit 1
    fi

    # delete backup
    delete_backup

    echo ">>> Patch restored successfully!"
    echo "    We suggest you use pacman -Qkk <LinuxQQ> to check the intergriy and reinstall if needed."
}

delete_backup() {
    local backup_file="${TARGET_FILE}${BACKUP_SUFFIX}"
    if [ -f "$backup_file" ]; then
        echo "--- Deleting backup file..."
        if ! rm "$backup_file"; then
            echo "!!! ERROR: Could not delete backup file."
            exit 1
        fi
    fi
}

show_help() {
    echo ">> LiteLoaderQQNT Patcher <<"
    echo "Usage: $0 {apply|upgrade|restore|help}"
    echo "  apply: Apply the patch"
    echo "  upgrade: Apply the patch when the LinuxQQ updates (Target file changes)."
    echo "           !!! WARNING: the upgrade command will delete the backup file and run apply command unconditionally"
    echo "  restore: Restore the origional target file (By restoring from backup)"
    echo "  delete_backup: Delete the backup file"
    echo "  help: Show this help"
}



# main
if [ "$EUID" -ne 0 ]; then
    echo "!!! ERROR: This operation requires root privileges."
    echo "!!! Please run this command again using sudo:"
    echo "  sudo $0 $@"
    exit 1
fi
case "$1" in
    apply)
        apply_patch
        ;;
    upgrade)
        delete_backup
        apply_patch
        ;;
    restore)
        restore_patch
        ;;
    delete_backup)
        delete_backup
        ;;
    help)
        show_help
        ;;
    *)
        echo "!!! ERROR: Invalid argument."
        show_help
        exit 1
        ;;
esac
