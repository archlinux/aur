#!/usr/bin/env sh

export WINEARCH=win32
export WINEPREFIX=$HOME/.cache/heroes-evolved
export WINEDLLOVERRIDES='wininet=b,n'
export WINEDEBUG=-all

if [[ ! -d $WINEPREFIX ]]; then
	winetricks -q d3dx9
	# this is for the full client, using the games permissions
	#ln -sf /opt/heroes-evolved/s3_web "$WINEPREFIX/drive_c/users/$USER/Application Data/"
	#ln -sf /opt/heroes-evolved/ "$WINEPREFIX/drive_c/users/$USER/Application Data/Heroes Evolved"
	cp -r /opt/heroes-evolved/ "$WINEPREFIX/drive_c/users/$USER/Application Data/Heroes Evolved"
fi

wine "$WINEPREFIX/drive_c/users/$USER/Application Data/Heroes Evolved/Heroes Evolved.exe" &> /dev/null &
