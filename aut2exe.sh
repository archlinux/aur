#!/bin/sh
if test -z "$1"
then
  echo "aut2exe infile.au3 [/out outfile.exe] [/icon file.ico] [/comp 0-4] [/pack] [/nopack] [/ansi] [/unicode] [/console] [/gui]"
else
  if test -z "$2"
  then
    wine /usr/bin/Aut2exe.exe /in $* /nopack
	else
		wine /usr/bin/Aut2exe.exe /in $*
	fi
fi

