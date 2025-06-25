#!/bin/bash

path=$(dirname $(realpath "$0"))

read -p "Install zsh-komander theme? (y/n) " cfm
if [ $cfm == "y" ]; then
	:
else
	exit 0
fi
echo "Autoinstall zsh-komander theme..."
chsh -s /bin/zsh
sudo mv "${path}/zsh-komander.zsh" "$HOME/.zshrc"
echo "End installing..."
