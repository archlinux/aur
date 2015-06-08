#!/bin/sh

NAME='th06-demo'
SRC="/usr/share/$NAME"
DEST="$HOME/.local/share/$NAME"

export WINEPREFIX="$DEST/wine"
export WINEDLLOVERRIDES='mscoree,mshtml='
export WINEARCH='win32'
export LANG='ja_JP.UTF-8'

# At the first launch, link the read-only data.
if [ ! -d "$DEST" ] ; then
	mkdir -p "$DEST"
	mkdir -p "$WINEPREFIX"
	ln -s "$SRC/東方紅魔郷.exe" "$DEST/"
	ln -s "$SRC/custom.exe" "$DEST/"
	for i in CM IN MD ST TL; do
		ln -s "$SRC/紅魔郷$i.DAT" "$DEST/"
	done
fi

# Launch the MIDI server if installed and not running.
if [ '' != "`whereis timidity | grep '/usr/bin'`" ] ; then
	if [ "`ps -A | grep timidity`" == '' ] ; then
		timidity -iA &
		myins='true'
	fi
fi

cd "$DEST"

# Launch the game
wine 東方紅魔郷

# End the MIDI server.
if [ "$myins" == 'true' ] ; then
	killall timidity
fi

