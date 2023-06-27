#!/bin/bash

# Check if the required arguments are provided
if [ $# -lt 1 ]; then
  echo "Usage: $0 <new_version>"
  exit 1
fi

# Assign the new value and filename to variables
new_value="$1"
filename="PKGBUILD"

# Check if the file exists
if [ ! -f "$filename" ]; then
  echo "File not found: $filename"
  exit 1
fi

# Define the pattern and replacement
pattern="pkgver=.*"
replacement="pkgver=$new_value"

# Check if the operating system is macOS
if [[ $(uname) == "Darwin" ]]; then
  sed -i "" -E "s/$pattern/$replacement/" "$filename"
else
  sed -i -E "s/$pattern/$replacement/" "$filename"
fi
