#!/bin/sh

NAME='th10'
SRC="/usr/share/$NAME"
DEST="$HOME/.local/share/$NAME"
INST="$DEST/wine/drive_c/Program Files/上海アリス幻樂団/東方風神録体験版/"

export WINEPREFIX="$DEST/wine"
export WINEDLLOVERRIDES='mscoree,mshtml='
export WINEARCH='win32'
export LANG='ja_JP.UTF-8'

# At the first launch, link the read-only data.
if [ ! -d "$DEST" ] || [ -e "$DEST/setup.exe" ]; then
	mkdir -p "$DEST"
	mkdir -p "$WINEPREFIX"
	ln -sf "$SRC/th10tr002a_setup.exe" "$DEST/setup.exe"
	cd $DEST
	wine setup.exe
	if [ ! -d "$INST" ]; then
		echo Installation failed or cancelled
		exit 1
	fi

	rm "$DEST/setup.exe"

	ls "$INST" | xargs -Iorig ln -s "$INST"/orig "$DEST/"
	ln -s "$SRC/custom.exe" "$DEST/"
fi

# Launch the game
cd "$DEST"

if [ -e "./th10.exe" ]; then
	wine th10.exe
else
	wine th10tr.exe
fi

