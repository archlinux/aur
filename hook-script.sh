#!/bin/bash

while read -r path; do
  name="$(/usr/bin/basename "$path")"
  case "$1" in
     -i) /usr/bin/mime-archpkg -q -a "$name" ;;
     -u) /usr/bin/mime-archpkg -q -u "$name" ;;
     -r) /usr/bin/mime-archpkg -q -r "$name" ;;
   esac
done

