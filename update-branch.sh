#!/bin/sh

REMOTE_BRANCH=packages/ddclient
LOCAL_BRANCH=upstream
CURRENT_BRANCH=`git rev-parse --abbrev-ref HEAD`

git checkout "$REMOTE_BRANCH"
git pull
git branch -f "$LOCAL_BRANCH" "$REMOTE_BRANCH"
git checkout "$LOCAL_BRANCH"
git filter-branch -f --subdirectory-filter trunk \
	--tree-filter 'makepkg --printsrcinfo > .SRCINFO || rm .SRCINFO' \
	--commit-filter '
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
git checkout "$CURRENT_BRANCH"
