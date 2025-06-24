#!/bin/bash

path=$(dirname $(realpath $0))
theme="$path/zsh-komander.zsh"

if [[ -f /etc/os-release ]]; then
	source /etc/os-release
	distr=$ID
else
	echo "Distro not found..."
	exit 1
fi

echo "Installing shell"


case $distr in
	arch|manjaro)
		if pacman -Q zsh &> /dev/null; then
			:
		else
			sudo echo "Install zsh..."
			sudo pacman -S --noconfirm zsh &> /dev/null 2>&1
		fi
		;;
	ubuntu|debian)
		if dpkg -s zsh &> /dev/null; then
			:
		else
			sudo echo "Install zsh..."
			sudo apt-get install -y zsh > /dev/null 2>&1
		fi
		;;
	fedora)
		if dnf list installed zsh &> /dev/null; then
			:
		else
			sudo echo "Install zsh..."
			sudo dnf install -y zsh > /dev/null 2>&1
		fi
		;;
	*)
		echo "Not found your distro..."
		;;
esac

chsh -s /bin/zsh

if [[ -f $theme ]]; then
	cp $theme $HOME/.zshrc
	echo "Installed, reboot your terminal..."
	exit 0
else
	echo "theme file not found..."
	exit 1
fi

