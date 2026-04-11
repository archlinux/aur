#!/bin/bash

TARGET_FILE="/opt/QQ/resources/app/package.json"
BACKUP_SUFFIX=".LLQQNT.bak"

PATCH_CONTENT="./app_launcher/LiteLoaderQQNT.js"

ENV_PROFILE="/etc/profile.d/liteloader-qqnt.sh"

apply_patch() {
    local backup_file="${TARGET_FILE}${BACKUP_SUFFIX}"

    if [ ! -f "$TARGET_FILE" ]; then
        echo "!!! ERROR: ${TARGET_FILE} not found."
        echo "!!! This LinuxQQ installation may be broken. Run pacman -Qkk <LinuxQQ Package> to check and reinstall if needed."
        echo "!!! OR, LinuxQQ has changed its file structure. We suggest you wait for an update to the patcher."
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
        echo "--- Backup file already exists. Skipping."
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
        echo "!!! If you have applied the patch before, please reinstall LinuxQQ to restore."
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
    echo "    We suggest you use pacman -Qkk <LinuxQQ> to check integrity and reinstall if needed."
}

delete_backup() {
    local backup_file="${TARGET_FILE}${BACKUP_SUFFIX}"
    if [ -f "$backup_file" ]; then
        echo "--- Deleting backup file..."
        if ! rm -vf "$backup_file"; then
            echo "!!! ERROR: Could not delete backup file."
            exit 1
        fi
    fi
}

setup_env() {
    echo "--- Setting up environment variable for the patcher at ${ENV_PROFILE}"
    local env_content="export LITELOADERQQNT_PROFILE=\"\$HOME/.config/LiteLoaderQQNT\""
    if [ -f "$ENV_PROFILE" ]; then
        if grep -Fxq "$env_content" "$ENV_PROFILE"; then
            echo "--- Environment variable already set. Skipping..."
        else
            echo "$env_content" | tee -a "$ENV_PROFILE" > /dev/null
            echo ">>> Environment variable set successfully!"
        fi
    else
        echo "$env_content" | tee "$ENV_PROFILE" > /dev/null
        chmod 644 "$ENV_PROFILE"
        echo ">>> Environment variable set successfully!"
    fi
}

show_help() {
    echo ">> LiteLoaderQQNT Patcher <<"
    echo "Usage: $0 {apply|upgrade|restore|help}"
    echo "  apply: Apply the patch"
    echo "  upgrade: Apply the patch when LinuxQQ updates (target file changes)."
    echo "           !!! WARNING: The upgrade command will delete the backup file and run the apply command unconditionally."
    echo "  restore: Restore the original target file (by restoring from backup)."
    echo "  delete_backup: Delete the backup file."
    echo "  setup_env: Set up data location for liteloader-qqnt (LITELOADERQQNT_PROFILE=\"$HOME/.config/LiteLoaderQQNT\")."
    echo "  set_alpmhook_notify: Set up the ALPM hook to notify the user when LinuxQQ is updated and the patch needs to be applied."
    echo "  set_alpmhook_patch: Set up the ALPM hook to automatically apply the patch when LinuxQQ is updated (target file changes)."
    echo "  help: Show this help."
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
    setup_env)
        setup_env
        ;;
    set_alpmhook_notify)
        echo "--- Setting up ALPM hook to notify user when LinuxQQ is updated and patch needs to be applied"
        ln -vsf /usr/lib/liteloader-qqnt-patcher/libalpm-hooks/liteloader-qqnt-patcher-notify.hook /usr/share/libalpm/hooks/liteloader-qqnt-patcher.hook
        echo ">>> ALPM hook set successfully!"
        ;;
    set_alpmhook_patch)
        echo "--- Setting up ALPM hook to automatically apply patch when LinuxQQ is updated (Target file changes)"
        ln -vsf /usr/lib/liteloader-qqnt-patcher/libalpm-hooks/liteloader-qqnt-patcher-patch.hook /usr/share/libalpm/hooks/liteloader-qqnt-patcher.hook
        echo ">>> ALPM hook set successfully!"
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
