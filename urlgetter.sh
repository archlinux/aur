#!/bin/bash

# invocation:
# urlgetter.sh <source> <destination>
# where source is a remote path

SOURCE="$1"
DEST="$2"

if [ -z "$srcdir" -o -z "$pkgver" ]; then
  echo "*************************************"
  echo "Missing one ore more environment variables"
  echo "  srcdir pkgver"
  echo "*************************************"

  exit 1
fi

LOCALSOURCE="$srcdir/smlnj-$pkgver-$(basename $SOURCE)"

if [ ! -f "$LOCALSOURCE" ]; then
  echo "*************************************"
  echo "Can't find file:"
  echo "$LOCALSOURCE"
  echo "Please add it to the sources in the PKGBUILD"
  echo "*************************************"

  exit 2
fi

ln -sf "$LOCALSOURCE" "$DEST"
