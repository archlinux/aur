#!/bin/sh

export WINEPREFIX="$HOME/.pdfencrypt/wine"
export WINEDLLOVERRIDES="mshtml="
if [ ! -d "$HOME/.pdfencrypt" ]; then
   mkdir -p "$HOME/.pdfencrypt/wine"
   wineboot -u
   #copy the registry file if needed
fi
WINEDEBUG=-all wine /usr/share/pdfencrypt/PDFEncrypt.exe "$@"
