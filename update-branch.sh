#!/bin/sh

REMOTE_URL=https://github.com/archlinux/svntogit-community.git
REMOTE_BRANCH=packages/ddclient
LOCAL_BRANCH=upstream

git fetch "$REMOTE_URL" "$REMOTE_BRANCH"
git checkout -B "$LOCAL_BRANCH" FETCH_HEAD
FILTER_BRANCH_SQUELCH_WARNING=1 git filter-branch -f --subdirectory-filter trunk \
	--tree-filter 'git rm -rf keys; { makepkg --printsrcinfo && echo; } >.SRCINFO || rm .SRCINFO' \
	--commit-filter '
		if [ -e .SRCINFO ]
		then
			git commit-tree "$@"
		else
			skip_commit "$@"
		fi'
git checkout -
