#!/bin/bash
# Simple script to build AUR package locally for testing

cd "$(dirname "$0")"

# Copy files to aur directory
cp ../token-server.js .

# Build the package
makepkg -si
