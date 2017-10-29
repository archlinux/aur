#!/bin/bash
TMPDIR=$(mktemp -d)
GDRIVE_ID=${1:9}
echo "Downloading GDrive ID $GDRIVE_ID"
echo "TMPDIR: $TMPDIR"
wget -c "https://drive.google.com/uc?export=download&id=$GDRIVE_ID" -O "$TMPDIR/avcheck.html" --save-cookie "$TMPDIR/cookie.txt"
CONFIRM=$(grep -e "confirm=[^'\"&]\+" -o "$TMPDIR/avcheck.html")
wget "https://drive.google.com/uc?export=download&id=$GDRIVE_ID&$CONFIRM" -O $2 --load-cookie "$TMPDIR/cookie.txt" --continue
rm -rf $TMPDIR
