#!/bin/sh
getopts "cih" option
case $option in
  c)
    GREP_OPTIONS+=" --color=auto"
  ;;
  i)
  GREP_OPTIONS+=" -i"
  ;;
  h)
    echo "usage: $0 [options] query file.pdf"
    echo
    echo "options:"
    echo "  -c                     enable colored output"
    echo "  -i                     disable case sensitivity"
esac

if [ "$option" != "h" ]
then
  if [ "$option" != "?" ]
  then
    pdftxt "$3" | grep "$2"
  else
    pdftxt "$2" | grep "$1"
  fi
fi

