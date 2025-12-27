#!/bin/bash

func_main() {
    echo -n "Package name: "
    read package

    if [ -z "$package" ]; then
        echo "Error: Package name cannot be empty."
        exit 1
    fi

    if [ -d "$package" ]; then
        echo "Warning: Directory $package already exists. Removing it."
        sudo rm -rf "$package" || { echo "Error: Failed to remove existing directory $package."; exit 1; }
    fi

    mkdir -p "$package" || { echo "Error: Failed to create directory $package."; exit 1; }
    git clone "https://aur.archlinux.org/$package.git" "$package/" || { echo "Error: Failed to clone the repository."; rm -rf "$package"; exit 1; }
    cd "$package" || { echo "Error: Failed to change directory to $package."; rm -rf "$package"; exit 1; }
    makepkg -si || { echo "Error: Failed to build or install the package."; cd ..; rm -rf "$package"; exit 1; }
    cd ..
    rm -rf "$package" || { echo "Error: Failed to remove $package directory."; exit 1; }
    exit 0
}


func_main