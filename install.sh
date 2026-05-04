#!/bin/bash

# G-HELPER Bootstrap Script
echo -e "\e[1;35m==>\e[0m Deploying \e[1;36mG-HELPER\e[0m (The AUR Architect)..."

# Ensure dependencies for building are installed
sudo pacman -S --needed --noconfirm git base-devel jq curl

# Run the build and installation
makepkg -si --noconfirm --skipchecksums

echo -e "\e[1;32m==>\e[0m G-HELPER is now installed. Try: \e[1;33mg-helper <package>\e[0m"
