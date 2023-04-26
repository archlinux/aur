#!/usr/bin/env bash

file_path=$1
ext=${file_path##*.}
case $ext in
"py")
	/usr/bin/black -l 88 -S -C $file_path
	;;
"ipynb")
	/usr/bin/black -l 88 -S -C $file_path
	# jupytext $file_path --pipe "black -l 88 -S -C {}"
	;;
"sh")
	/usr/bin/shfmt -w $file_path
	;;
"yml")
	/usr/bin/prettier --print-width 88 --write $file_path
	;;
"yaml")
	/usr/bin/prettier --print-width 88 --write $file_path
	;;
"json")
	/usr/bin/prettier --print-width 88 --write $file_path
	;;
*)
	xte "keydown Control_L" "keydown Alt_L" "keydown Shift_L" "key O" "keyup Control_L" "keyup Alt_L" "keyup Shift_L"
	;;
esac
