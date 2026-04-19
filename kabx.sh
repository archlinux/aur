#!/bin/bash
export WINEPREFIX="$HOME/.local/share/wineprefixes/dayton-kabx"

# 1. Falls der Präfix neu ist, initialisiere ihn sauber
if [ ! -d "$WINEPREFIX" ]; then
    echo "Erstelle neue Wine-Umgebung... bitte warten..."
    wineboot -u
fi

# 2. Hardware-Links setzen
mkdir -p "$WINEPREFIX/dosdevices"
rm -f "$WINEPREFIX/dosdevices/com1"
ln -s /dev/dayton_kabx "$WINEPREFIX/dosdevices/com1"

# Registry-Eintrag für COM1 (Wichtig: Backslashes müssen für Bash escaped werden)
wine reg add "HKEY_LOCAL_MACHINE\\Software\\Wine\\Ports" /v "COM1" /t REG_SZ /d "/dev/dayton_kabx" /f > /dev/null 2>&1

FINAL_EXE="$WINEPREFIX/drive_c/Program Files/KPX DSP Control/KPX DSP Control.exe"

# 3. Installer oder App starten
if [ ! -f "$FINAL_EXE" ]; then
    echo "Installer wird gestartet..."
    cd /opt/dayton-kabx/
    wine installer.exe
else
    sleep 1
    wine "$FINAL_EXE" "$@"
fi
