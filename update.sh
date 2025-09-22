#!/bin/bash
set -e

echo "Updating makepkg stuff"
updpkgsums
makepkg --printsrcinfo > .SRCINFO

read -p "Do you want to continue and update the Git repository? (y/N) " yn
case $yn in
	[Yy]* ) break;; # Break loop if 'y' or 'Y'
	[Nn]* ) exit;; # Exit if 'n' or 'N'
	* ) echo "Please answer 'y' or 'n'.";; # Prompt again for invalid input
esac

echo "Commiting changes"
git add PKGBUILD .SRCINFO
git commit -m "Update to $(grep '^pkgver=' PKGBUILD | cut -d= -f2)"
git push
