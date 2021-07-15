#!/usr/bin/env bash

set -euxo pipefail

# Install utilities for building packages
pacman -Syu --noconfirm
pacman -S awk binutils diffutils file fakeroot grep namcap sudo --noconfirm

# Add a user for building package
useradd -m auruser

# Set empty password and give sudo so that makepkg can install dependencies
usermod -aG wheel auruser
echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
echo "auruser:*" | chpasswd

# Give all files in current directory to auruser
chown auruser ./*

# Actually build and test package as auruser
sudo -u auruser ./auruser_build_and_test.sh
