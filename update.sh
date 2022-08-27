#!/bin/bash
# Update package to latest version

# Grab latest version from API
v=$(curl -sSL 'https://discordapp.com/api/v7/updates/development?platform=linux' | jq -r .name)

# Update files
perl -pi -e "s/pkgver=\\d+\\.\\d+\\.\\d+/pkgver=$v/" PKGBUILD
updpkgsums
makepkg --printsrcinfo > .SRCINFO

# Push
git add PKGBUILD .SRCINFO
git commit -m "Update to $v"
git push
makepkg -si
#yay -S discord-development --noconfirm

# Clean up
#rm -r pkg src "discord-development-$v*"
