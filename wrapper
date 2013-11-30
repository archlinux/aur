#!/bin/bash

libdir=/usr/lib/ascii-fluid-dynamics-git

bin_suff=''
files=()
for arg; do
	 if [ -f "$arg" ]; then
		  files+=("$arg")
	 elif [ -f "$libdir/$arg" ]; then
		  files+=("$libdir/$arg")
	 elif [ "$arg" = --color ]; then
		  bin_suff=_color
	 else
		  echo "Unknown arg: $arg"
	 fi
done

for file in "${files[@]}"; do
	 "$libdir/endoh1${bin_suff}" < "$file"
done
