#!/bin/bash
export WINEPREFIX="$HOME/.local/share/wineprefixes/dayton-kabx"
mkdir -p "$WINEPREFIX/dosdevices"

# 1. Alten Link löschen und neuen Link auf den SYMLINK setzen
rm -f "$WINEPREFIX/dosdevices/com1"
ln -s /dev/dayton_kabx "$WINEPREFIX/dosdevices/com1"

# 2. Wine die Hardware in die Registry schreiben (beendet den Zufall)
wine reg add "HKEY_LOCAL_MACHINE\Software\Wine\Ports" /v "COM1" /t REG_SZ /d "/dev/dayton_kabx" /f > /dev/null 2>&1

FINAL_EXE="$WINEPREFIX/drive_c/Program Files/KPX DSP Control/KPX DSP Control.exe"

if [ ! -f "$FINAL_EXE" ]; then
    wine /opt/dayton-kabx/installer.exe
else
    # Eine Sekunde warten, damit die Hardware-Initialisierung fertig ist
    sleep 1
    wine "$FINAL_EXE" "$@"
fi
