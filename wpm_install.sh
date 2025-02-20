#!/bin/bash

INSTALL_DIR="/usr/local/bin"
SHELL_SCRIPT="/etc/profile.d/wpm.sh"
C_SOURCE="wpm.c"
EXECUTABLE="wpm"

function compile_program {
    echo "Compiling $C_SOURCE..."
    gcc -o $EXECUTABLE $C_SOURCE
    if [ $? -ne 0 ]; then
        echo "Compilation failed."
        exit 1
    fi
    echo "Compilation successful."
}

function install_executable {
    echo "Installing $EXECUTABLE to $INSTALL_DIR..."
    sudo mv $EXECUTABLE $INSTALL_DIR/
    if [ $? -ne 0 ]; then
        echo "Failed to move executable."
        exit 1
    fi
    echo "Installation successful."
}

function install_shell_script {
    echo "Installing shell script to $SHELL_SCRIPT..."
    sudo cp wpm.sh $SHELL_SCRIPT
    if [ $? -ne 0 ]; then
        echo "Failed to install shell script."
        exit 1
    fi
    sudo chmod +x $SHELL_SCRIPT
    echo "Shell script installed."
}

function update_shell_config {
    local shell_profile="$HOME/.bashrc"
    if [ -n "$ZSH_VERSION" ]; then
        shell_profile="$HOME/.zshrc"
    fi

    echo "Updating shell configuration in $shell_profile..."
    echo "source $SHELL_SCRIPT" >> $shell_profile
    echo "Shell configuration updated."
}

compile_program
install_executable
install_shell_script
update_shell_config

source $HOME/.bashrc 2>/dev/null || source $HOME/.zshrc 2>/dev/null

echo "Installation complete. Please restart your terminal."
