#!/usr/bin/env sh

cd /opt/freeablo

if [ -f "Diablo.exe" ] && [ -f "DIABDAT.MPQ" ]; then
	./freeablo
else
	printf "Diablo.exe and/or DIABDAT.MPQ are not present.\nPlease put a copy of Diablo.exe and DIABDAT.MPQ in /opt/freeablo."
fi
# I don't think this program was ever designed to be installed in anything but your home dir
