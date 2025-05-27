#!/bin/bash

if [ "$#" -eq 0 ]; then
	echo "Usage: skib <package>"
fi

check_package() {
    local pkg="$1"
    local result=$(curl -s "https://aur.archlinux.org/rpc/?v=5&type=info&arg[]=$pkg")
    if [[ "$result" == *'"resultcount":0'* ]]; then
        return 1
    else
        return 0
    fi
}

if [ "$1" = "-R" ]; then
	shift
	for pkg in "$@"; do
		echo "Removing package $pkg..."
		sudo pacman -Rs "$pkg" || echo "Package Not Found(or it failed)."
	done
	exit 0
fi

for pkg in "$@"; do
	echo "Checking package $pkg..."
	if check_package "$pkg"; then
	echo "Installing $pkg"; 
	git clone https://aur.archlinux.org/$pkg.git
	cd $pkg
	makepkg -si
	cd ..
	rm -fr $pkg
	else
		echo "Package $pkg not found in the AUR, Trying Pacman"
		sudo pacman -S "$pkg" || echo "$pkg Was not found in the AUR or in pacman(or it failed)."
	fi
done
