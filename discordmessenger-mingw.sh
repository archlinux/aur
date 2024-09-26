#!/bin/sh
export WINEPREFIX="$HOME/.discordmessenger-mingw/wine"
export WINEDLLOVERRIDES="mscoree,mshtml="
if [ ! -d "$HOME/.discordmessenger-mingw" ]; then
   mkdir -p "$HOME/.discordmessenger-mingw/wine"
   wineboot -u
   #copy the registry file if needed
fi
WINEDEBUG=-all wine /usr/share/discordmessenger-mingw/DiscordMessenger.exe "$@"
