#!/usr/bin/env bash

file_path=$1
ext=${file_path##*.}
case $ext in
"py")
	black -l 88 -S -C $file_path
	;;
"ipynb")
	black -l 88 -S -C $file_path
	# jupytext $file_path --pipe "black -l 88 -S -C {}"
	;;
"sh")
	shfmt -w $file_path
	;;
"json")
	prettier --print-width 88 --write $file_path
	;;
esac
