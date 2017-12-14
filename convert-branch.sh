#!/bin/sh

git filter-branch -f --subdirectory-filter trunk
git filter-branch -f --tree-filter 'makepkg --printsrcinfo > .SRCINFO || rm .SRCINFO' --commit-filter '
	if [ -e .SRCINFO ]
	then
		git commit-tree "$@"
	else
		shift
		while [ -n "$1" ]
		do
			shift
			map "$1"
			shift
		done
	fi'
