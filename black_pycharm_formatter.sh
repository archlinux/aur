#!/usr/bin/env bash

file_path=$1
ext=${file_path##*.}
case $ext in
"py")
	black -l 90 -S $file_path
	;;
"ipynb")
	jupytext $file_path --pipe "black -l 90 -S {}"
	;;
"sh")
	shfmt -w $file_path
	;;
esac
