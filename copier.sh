#!/bin/bash

function _fail() {
  echo "ERROR: Failed to find or copy \"$1\""
  exit 1
}

if [ ! -r filelist ]; then
  echo "ERROR: Can't read filelist"
  exit 1
fi

read -p "Enter the path to the X-COM data files: " _xcompath
if [ ! -d $_xcompath ]; then
  echo "ERROR: No such directory"
  exit 1
fi

IFS="
"
for file in $(cat filelist); do
  # Handle files with identical names but different content
  case "$file" in
    DP_PREFS|INTICON.PCK|INTICON.TAB)
      if ! find $_xcompath -path "*UFOGRAPH/$file" -exec cp "{}" ./"ufo-$file" \; &>/dev/null; then
        _fail $file
      fi
      if ! find $_xcompath -path "*GEOGRAPH/$file" -exec cp "{}" ./"geo-$file" \; &>/dev/null; then
        _fail $file
      fi
      ;;
    *)
      if ! find $_xcompath -name "$file" -exec cp "{}" . \; &>/dev/null; then
        _fail $file
      fi
      ;;
  esac
done

echo "All files successfully copied, now run makepkg"
