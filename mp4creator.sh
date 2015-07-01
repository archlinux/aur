#!/bin/sh

if [ "$#" -gt 5 ]; then
  MP4Box -fps "$4" -add "$2" "$6"
else
  MP4Box -add "$2" "$3"
fi

