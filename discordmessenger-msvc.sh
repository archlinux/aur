#!/bin/sh
export WINEPREFIX="$HOME/.discordmessenger-msvc/wine"
export WINEDLLOVERRIDES="mscoree,mshtml="
if [ ! -d "$HOME/.discordmessenger-msvc" ]; then
   mkdir -p "$HOME/.discordmessenger-msvc/wine"
   wineboot -u
   #copy the registry file if needed
fi
WINEDEBUG=-all wine /usr/share/discordmessenger-msvc/DiscordMessenger.exe "$@"
