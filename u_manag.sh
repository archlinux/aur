#!/bin/bash

# u_manag - Basic User Management tool for Unix
# Uses Zenity for a simple GUI interface and pkexec for root escalation.

# Check for root privileges; if not root, relaunch using pkexec
if [[ $EUID -ne 0 ]]; then
   # Get the absolute path of the script
   SCRIPT_PATH=$(readlink -f "$0")
   # pkexec will prompt the user for their password graphically
   # We need to pass DISPLAY and XAUTHORITY for GUI apps to find the screen
   pkexec env DISPLAY="$DISPLAY" XAUTHORITY="$XAUTHORITY" "$SCRIPT_PATH" "$@"
   exit $?
fi

main_menu() {
    while true; do
        CHOICE=$(zenity --list --title="u_manag - User Management" \
            --column="Action" --column="Description" \
            "Add User" "Create a new UNIX user" \
            "Delete User" "Remove an existing user" \
            "Rename User" "Change a user's login name" \
            "Close" "Exit the application" \
            --height=350 --width=400)

        case "$CHOICE" in
            "Add User") add_user ;;
            "Delete User") delete_user ;;
            "Rename User") rename_user ;;
            "Close"|"") exit 0 ;;
            *) exit 0 ;;
        esac
    done
}

add_user() {
    USER_DATA=$(zenity --forms --title="Add User" \
        --text="Enter details for the new user" \
        --add-entry="Username" \
        --add-password="Password")

    if [[ -n "$USER_DATA" ]]; then
        USERNAME=$(echo "$USER_DATA" | cut -d'|' -f1)
        PASSWORD=$(echo "$USER_DATA" | cut -d'|' -f2)

        if id "$USERNAME" &>/dev/null; then
            zenity --error --text="User '$USERNAME' already exists."
        else
            useradd -m "$USERNAME"
            echo "$USERNAME:$PASSWORD" | chpasswd
            zenity --info --text="User '$USERNAME' created successfully."
        fi
    fi
}

delete_user() {
    USERNAME=$(zenity --entry --title="Delete User" --text="Enter the username to delete:")

    if [[ -n "$USERNAME" ]]; then
        if id "$USERNAME" &>/dev/null; then
            zenity --question --text="Are you sure you want to delete user '$USERNAME' and their home directory?"
            if [[ $? -eq 0 ]]; then
                userdel -r "$USERNAME"
                zenity --info --text="User '$USERNAME' deleted."
            fi
        else
            zenity --error --text="User '$USERNAME' does not exist."
        fi
    fi
}

rename_user() {
    RENAME_DATA=$(zenity --forms --title="Rename User" \
        --text="Enter user rename details" \
        --add-entry="Old Username" \
        --add-entry="New Username")

    if [[ -n "$RENAME_DATA" ]]; then
        OLD_NAME=$(echo "$RENAME_DATA" | cut -d'|' -f1)
        NEW_NAME=$(echo "$RENAME_DATA" | cut -d'|' -f2)

        if id "$OLD_NAME" &>/dev/null; then
            if id "$NEW_NAME" &>/dev/null; then
                zenity --error --text="New username '$NEW_NAME' already exists."
            else
                usermod -l "$NEW_NAME" "$OLD_NAME"
                zenity --info --text="User '$OLD_NAME' renamed to '$NEW_NAME'."
            fi
        else
            zenity --error --text="User '$OLD_NAME' does not exist."
        fi
    fi
}

# Start the application
main_menu
