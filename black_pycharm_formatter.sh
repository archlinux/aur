#!/usr/bin/env bash

case $2 in
	"py")
<<<<<<< HEAD
		black -l 80 -S $1
		;;
	"ipynb")
		cmd="$3/jupytext"
		$cmd $1 --pipe "black -l 80 -S {}"
=======
		black -l 80 -S $1 2> /dev/null
		;;
	"ipynb")
		file_path="/tmp/black_pycharm_jupyter_cell_formatter.py"
		cmd="$3/ipynb-py-convert"
		$cmd $1 $file_path
		black -l 80 -S $file_path 2> /dev/null
		$cmd $file_path $1
>>>>>>> adcc7a980474de58bdd693ced8d94df1ee3f37d7
		;;
esac
