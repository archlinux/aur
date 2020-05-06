#!/usr/bin/env bash

case $2 in
	"py")
		black -l 80 -S $1
		;;
	"ipynb")
		cmd="$3/jupytext"
		$cmd $1 --pipe "black -l 80 -S {}"
		;;
	"sh")
		shfmt -w $1
		;;
esac
