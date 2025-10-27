#!/bin/bash

set -e

if [ -z "$TERM" ]; then
    export TERM=xterm
fi

clear
echo -e "\033[34mfilebyte uninstaller\033[0m"
echo -e "\033[34m===================\033[0m"
echo -e "\033[34mby execRooted\033[0m"
echo ""

if [ "$EUID" -ne 0 ]; then
    echo -e "\033[0;31m[ERROR]\033[0m This uninstaller must be run as root."
    echo -e "\033[1;33m[INFO]\033[0m Please run: sudo $0"
    exit 1
fi

if [ -f "/usr/local/bin/filebyte" ]; then
    echo -e "\033[1;33m[INFO]\033[0m Removing filebyte from /usr/local/bin..."
    rm /usr/local/bin/filebyte
    echo -e "\033[36m[SUCCESS]\033[0m Uninstallation complete!"
else
    echo -e "\033[1;33m[INFO]\033[0m filebyte is not installed."
fi

