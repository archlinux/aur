#!/bin/bash

if [ ! -r filelist ]; then
  echo "ERROR: Can't read filelist"
  exit 1
fi

read -p "Enter the path to the AVP Gold data files: " _avppath
if [ ! -d $_avppath ]; then
  echo "ERROR: No such directory"
  exit 1
fi

IFS="
"
for file in $(cat filelist); do
  if ! find $_avppath -name "$file" -exec cp "{}" . \; &>/dev/null; then
    echo "ERROR: Failed to find or copy \"$file\""
    exit 1
  fi
done

echo "All files successfully copied, now run makepkg"
