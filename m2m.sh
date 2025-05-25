#!/bin/bash


yt-dlp $1 -o $YTDIR/ytvideo.webm
ffmpeg -i $YTDIR/ytvideo.web* $YTDIR/$2
rm $YTDIR/ytvideo.web*
