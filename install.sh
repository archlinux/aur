#!/usr/bin/bash

mkdir -p ~/.config/paru/
if [ ! -e /etc/paru.conf ]; then
	cp conf/paru.conf /etc/paru.conf
fi
cp -n conf/pacman.conf /etc/fepacman.conf
if [ command -v paru ] &>/dev/null; then
	paru -S --removemake --skipreview --needed paruz
fi
rm -rf /usr/bin/fe
go build
mv fe /usr/bin/fe
rm -rf fe
