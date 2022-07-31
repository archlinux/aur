#!/usr/bin/bash

mkdir -p ~/.config/paru/
if [ ! -e /etc/paru.conf ]; then
	cp conf/paru.conf /etc/paru.conf
fi
cp -n conf/pacman.conf /etc/fepacman.conf
if type "paru" > /dev/null; then
	paru -S --removemake --skipreview --needed paruz
else
	echo "WARN: INSTALL PARU BEFORE USING FE"
fi
rm -rf /usr/bin/fe
go build
mv fe /usr/bin/fe
rm -rf fe
