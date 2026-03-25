#!/usr/bin/env bash
# Push to AUR with only flat files (no subdirectories).
# AUR rejects subdirectories, so we create a filtered commit
# containing only blobs (files) parented on AUR's current master.
#
# Usage: ./push-aur.sh

set -euo pipefail

aur_url=$(git remote get-url aur 2>/dev/null || true)
if [[ "$aur_url" != *"aur.archlinux.org"* ]]; then
	echo >&2 "ERROR: 'aur' remote must point to AUR (got: ${aur_url:-<not set>})"
	exit 1
fi

# Positive filter: only include blobs (files), exclude all trees (directories)
aur_tree=$(git ls-tree HEAD | grep '^100' | git mktree)
aur_parent=$(git rev-parse aur/master)

# Get short subject from HEAD commit
msg=$(git log -1 --format='%s')

aur_commit=$(git commit-tree "${aur_tree}" -p "${aur_parent}" -m "${msg}")
git -c push.followTags=false push aur "${aur_commit}:refs/heads/master"

echo "Pushed to AUR: ${msg}"
