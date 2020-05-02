#!/bin/bash
export WINEPREFIX="$HOME/.gameforge/wine"
export WINEARG
export WINEESYNC=1

if [ ! -d "$HOME"/.gameforge ] ; then
  mkdir -p "$HOME"/.gameforge/wine || exit 1
  wget -P "$HOME"/.gameforge/wine https://install.gameforge.com/download\?download_id\=abcd1c7a-ee9a-43ed-b2a7-a67f5f1cfbaf\&game_id\=df8661d6-a76e-417f-82dc-9fada569615e\&locale\=fr 2>&1 | tee /dev/stderr | sed -u "s/^ *[0-9]*K[ .]*\([0-9]*%\) *\([0-9,]*[A-Z]\) *\([0-9a-z]*\).*/\1\n#Téléchargement ... \3 restant à \2\/s/" | zenity --title="Gamegorge Installer" --text="Connexion..." --progress --auto-close --auto-kill 2> /dev/null
  mv $HOME/.gameforge/wine/download\?download_id=abcd1c7a-ee9a-43ed-b2a7-a67f5f1cfbaf\&game_id=df8661d6-a76e-417f-82dc-9fada569615e\&locale=fr $HOME/.gameforge/wine/GameForgeInstaller.exe
fi

if [ ! -f "$HOME"/.gameforge/wine/drive_c/windows/system32/vcruntime140.dll ]; then
  if [ -n "`whereis zenity|grep bin`" ]; then
    zenity --info  --title 'Game Forge' --text 'Installing wine dependencies.\n\nThe process may take a few minutes'
  fi
  winetricks -q vcrun2019
  winetricks settings win10
fi
cd $HOME/.gameforge/wine/drive_c/Program\ Files\ \(x86\)/

if [ ! -f GameforgeClient/gfclient.exe ]; then
  wine $HOME/.gameforge/wine/GameForgeInstaller.exe
fi
wine GameforgeClient/gfclient.exe "$@"
