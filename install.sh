#!/bin/bash

# Colors because why not
GREEN="\033[1;32m"
RED="\033[1;31m"
RESET="\033[0m"

# Somebody used nonexistent stuff... so here it is made existent.
print_msg() {
    echo -e "${GREEN}[INSTALL]${RESET} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${RESET} $1"
}
sudo pacman -S python-rich


BASH_RC="$HOME/.bashrc"
CONFIG_LINE="alias todo='python3 $HOME/TODOAPP/TODOLIST.py'"

# Edit .bashrc safely
if [ -f "$BASH_RC" ]; then
    # Check if the line already exists (Idempotency check)
    if grep -Fxq "$CONFIG_LINE" "$BASH_RC"; then
        print_msg "Configuration already exists in $BASH_RC. Skipping."
    else
        print_msg "Backing up $BASH_RC to $BASH_RC.bak..."
        cp "$BASH_RC" "$BASH_RC.bak"

        print_msg "Adding configuration to $BASH_RC..."
        # Add a newline just in case the file doesn't end with one
        echo "" >> "$BASH_RC"
        echo "# Added by install.sh script" >> "$BASH_RC"
        echo "$CONFIG_LINE" >> "$BASH_RC"
    fi
else
    print_error "$BASH_RC does not exist. (Are you using zsh?)"
fi

print_msg "Installation complete!"
print_msg "Please restart your terminal or run: source $BASH_RC"
