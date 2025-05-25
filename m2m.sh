#!/bin/bash

mkdir -p $HOME/Music/ytdownloads
YTDIR="$HOME/Music/ytdownloads"

yt-dlp $1 -o $YTDIR/ytvideo.webm
ffmpeg -i $YTDIR/ytvideo.web* $YTDIR/$2
rm $YTDIR/ytvideo.web*

echo "Done downloading!!" | figlet | lolcat
