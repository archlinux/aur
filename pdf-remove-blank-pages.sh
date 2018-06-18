#! /bin/bash

for filename in "$@"; do
  # get non-blank ranges
  ranges="$(pdftotext "$filename" - | \
    "/usr/bin/non-blank-page-ranges.py")"

  if [ -z "$ranges" ]; then
    echo "no non-blank pages found in $filename" >&2
    continue
  fi

  # rename pdf
  if [ -e "${filename}.old.pdf" ]; then
    echo "file exists: ${filename}.old.pdf" >&2
    continue
  fi

  mv -n "$filename" "${filename}.old.pdf"

  if [ -e "$filename" -o ! -e "${filename}.old.pdf" ]; then
    echo "couldn't rename file $filename" >&2
    continue
  fi

  # create new pdf with non-blank pages only
  pdftk "${filename}.old.pdf" cat $ranges output "$filename"
done
