#!/usr/bin/env bash
# Wraps aursync command to mount an amazon s3 bucket which contains a repository

cfg_name=reposync.conf
cfg_file="${REPOSYNC_CONFIG:-/etc/xdg/$cfg_name}"
cfg_file_system="$cfg_file"
local_repo="$HOME/.cache/reposync"

do_rsync="rsync -av --append"

set -uo pipefail
trap 's=$?; echo "$0: Error on line "$LINENO": $BASH_COMMAND"; exit $s' ERR

mkdir -p "$local_repo"

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

s3fs "${bucket}" "$repo" -o "nosuid,nodev,default_acl=public-read,url=$bucket_url,nomultipart"
defer "fusermount -u '$repo'"
remote_repo="$repo/${repo_path}"
mkdir -p "${remote_repo}"

echo "Syncing remote repo to local"
echo "$remote_repo/ -> $local_repo/"
$do_rsync "$remote_repo/" "$local_repo/"

echo "Ensuring database"
db_local_name="${repo_name}.db.tar.gz"
db_remote_name="${repo_name}.db"
files_local_name="${repo_name}.files.tar.gz"
files_remote_name="${repo_name}.files"

(
    cd "$local_repo"
    # remove all existing db files
    rm -f "$db_remote_name"*
    rm -f "$files_remote_name"*
    for pkg in *.pkg.tar.xz
    do
        if [[ ! -f "${pkg}.sig" ]]
        then
            echo "Signing $pkg"
            gpg --output "${pkg}.sig" --detach-sign "$pkg"
        fi
        echo "Adding $pkg"
        repo-add "$db_local_name" "$pkg"
    done
    # generate new signatures
    rm -f "${db_local_name}.sig"
    gpg --output "${db_local_name}.sig" --detach-sign "$db_local_name"
    rm -f "${files_local_name}.sig"
    gpg --output "${files_local_name}.sig" --detach-sign "$files_local_name"
)

echo "Performing system update"
sudo pacman -Syu

echo "Performing repository sync"
aursync --sign --repo "$repo_name" --root "$local_repo" -u $@

(
    
    cd "$local_repo"
    # copy newly generated database files to their remote location
    mv "$db_local_name" "$db_remote_name"
    mv "$files_local_name" "$files_remote_name"
    mv "${db_local_name}.sig" "$db_remote_name"
    mv "${files_local_name}.sig" "$files_remote_name"
    # remove all the extras
    rm -f "${db_local_name}"*
    rm -f "${files_local_name}"*
)

echo "Syncing local repo to remote"
echo "$local_repo/ -> $remote_repo/"
$do_rsync "$local_repo/" "$remote_repo/"
$do_rsync -c "$local_repo"/dangersalad.db.* "$remote_repo/"
$do_rsync -c "$local_repo"/dangersalad.files.* "$remote_repo/"
