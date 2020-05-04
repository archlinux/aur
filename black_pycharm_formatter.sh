#!/usr/bin/env bash

case $2 in
	"py")
		black -l 80 -S $1 2> /dev/null
		;;
	"ipynb")
		file_path="/tmp/black_pycharm_jupyter_cell_formatter.py"
		cmd="$3/ipynb-py-convert"
		$cmd $1 $file_path
		black -l 80 -S $file_path 2> /dev/null
		$cmd $file_path $1
		;;
esac
