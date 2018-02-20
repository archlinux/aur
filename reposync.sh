#!/usr/bin/env bash
# Wraps aursync command to mount an amazon s3 bucket which contains a repository

cfg_name=dangersalad-reposync.config
cfg_file="${DANGERSALAD_REPOSYNC_CONFIG:-/etc/xdg/$cfg_name}"
cfg_file_system="$cfg_file"

set -uo pipefail
trap 's=$?; echo "$0: Error on line "$LINENO": $BASH_COMMAND"; exit $s' ERR

if [[ ! -f $cfg_file ]]
then
    cfg_file="${XDG_CONFIG_HOME:-$HOME/.config}/$cfg_name"
    if [[ ! -f $cfg_file ]]
    then
        echo "Missing config file $cfg_file_system and $cfg_file"
        exit 1
    fi
fi

source "$cfg_file"

exit_cmd=""
defer() { exit_cmd="$@; $exit_cmd"; }
trap 'bash -c "$exit_cmd"' EXIT

repo="$(mktemp -d)"
defer "rmdir '$repo'"

s3fs "${bucket}" "$repo" -o "nosuid,nodev,default_acl=public-read,url=$bucket_url,retries=10"
defer "fusermount -u '$repo'"
mkdir -p "$repo/${repo_path}"

echo "Performing system update"
sudo pacman -Syu

echo "Performing repository sync"
aursync --sign --repo "$repo_name" --root "$repo/$repo_path" "$@"
