#!/bin/bash

function _fail() {
  echo "ERROR: Failed to find or copy \"$1\""
  exit 1
}

if [ ! -r filelist ]; then
  echo "ERROR: Can't read filelist"
  exit 1
fi

read -p "Enter the path to the TFTD data files: " _tftdpath
if [ ! -d "$_tftdpath" ]; then
  echo "ERROR: No such directory"
  exit 1
fi

IFS="
"
for file in $(cat filelist); do
  # Handle files with identical names but different content
  case "$file" in
    LOFTEMPS.DAT|SCANG.DAT)
      if ! find "$_tftdpath" -path "*TERRAIN/$file" -exec cp "{}" ./"ter-$file" \; &>/dev/null; then
        _fail $file
      fi
      if ! find "$_tftdpath" -path "*GEODATA/$file" -exec cp "{}" ./"geo-$file" \; &>/dev/null; then
        _fail $file
      fi
      ;;
    *)
      if ! find "$_tftdpath" -name "$file" -exec cp "{}" . \; &>/dev/null; then
        _fail $file
      fi
      ;;
  esac
done

echo "All files successfully copied, now run makepkg"
