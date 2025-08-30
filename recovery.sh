#!/bin/bash

p="$1"

mkconfig() {
	echo "Editor=nano" > $HOME/.config/app-opener/app-opener.conf
}

echo -e "\e[32mWell, let's see what can be restored here..."
echo -e "------------------------------------\e[0m"
if [[ -d $p"apps" ]]; then
	echo "Catalog 'apps' found..."
else
	echo "The catalog apps not exist, starnge..."
	echo "Creating..."
	mkdir -p $p"apps"
fi
if [[ -d $p"scripts" ]]; then
	echo "Catalog 'scripts' found..."
else
	echo "The cataog scripts not exist, strange..."
	echo "Creating..."
	mkdir -p $p"scripts"
fi
if [[ -d "$HOME/.config/app-opener" ]]; then
	echo "Config catalog found..."
else
	echo "Config catalog and config not exist..."
	echo "Creating..."
	mkdir -p "$HOME/.config/app-opener"
	mkconfig
fi
if [[ -f "$config" ]]; then
	echo "The config found..."
else
	echo "The config not exist..."
	echo "Creating..."
	mkconfig
fi
echo -e "\e[32m------------------------------------"
echo -e "Recovery end...\e[0m"
exit 0

