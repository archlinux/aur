#!/bin/bash

path=$(dirname $(realpath "$0"))
param="$1"

case $param in
	setup)
		read -p "Install zsh-komander theme? (y/n) " cfm
		if [ $cfm == "y" ]; then
			:
		else
			exit 0
		fi
		echo "Autoinstall zsh-komander theme..."
		chsh -s /bin/zsh
		sudo cp "${path}/zsh-komander.zsh" "$HOME/.zshrc"
		echo "End installing..."
		;;
	help)
		echo -e "\n\e[32mHelp menu zsh-komander...\n-------------------------\e[0m\n- Alt+Z\t\t- Show user name.\n- Alt+X\t\t- Show computer name.\n- Alt+C\t\t- Show pwd.\n"
		echo -e "\e[32mHelp to komander-tool...\n-------------------------\e[0m\n- setup\t\t- Autosetup script zsh-komander.\n- help\t\t- Show this is menu.\n- version\t- Show to zsh-komander version.\n"	
		;;
	version)
		echo "zsh-komander 1.3"
		;;
	*)
		echo "Not found command: $param..."
		;;
esac
