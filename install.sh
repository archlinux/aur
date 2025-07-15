#!/bin/bash
set -e

echo "Welcome to the yak installer"
echo "Step 1: Update system package lists"
sudo pacman -Syu --noconfirm

echo "Step 2: Install build tools (git + base-devel)"
sudo pacman -S --needed --noconfirm git base-devel

echo "Step 3: Clone the yak repository"
git clone https://github.com/rainbownx/yak.git
cd yak

echo "Step 4: Build and install yak with makepkg"
makepkg -si --noconfirm
sudo mv yak /usr/bin

echo "Installation finished!"
echo "You can now use yak by typing: yak"
