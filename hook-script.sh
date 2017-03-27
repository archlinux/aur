#!/bin/bash

while read -r path; do
  name="${path/usr\/share\/icons\//}"
  name="${name/\/*/}"
  case "$1" in
     -i) /usr/bin/mime-archpkg -q -r -a "$name" ;;
     -u) /usr/bin/mime-archpkg -q -r -u "$name" ;;
     -r) /usr/bin/mime-archpkg -q -r -d "$name" ;;
   esac
done

