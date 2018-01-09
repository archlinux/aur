#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# region header
# Copyright Torben Sickert (info["~at~"]torben.website) 16.12.2012

# License
# -------

# This library written by Torben Sickert stand under a creative commons naming
# 3.0 unported license. see http://creativecommons.org/licenses/by/3.0/deed.de
# endregion
# region import
source "$(dirname "${BASH_SOURCE[0]}")/module.sh"
bl.import bashlink.path
# endregion
# region doctest setup
filesystem__doc_test_setup__='
# Runs once before tests are started:

bl.module.import bashlink.doctest
doc_test_capture_stderr=false
mv() {
    echo mv $@
}
rmdir() {
    echo rmdir $@
}
pv() {
    cat - | tr -d "\n" # print stdin
    echo -n " | pv | "
}
btrfs() {
    if [[ $1 == subvolume ]] && [[ $2 == snapshot ]]; then
        shift
        shift
        echo btrfs subvolume snapshot $@
    fi
    if [[ $1 == send ]]; then
        shift
        echo btrfs send $@
    fi
    if [[ $1 == receive ]]; then
        cat - # print stdin
        shift
        echo btrfs receive $@
    fi
    if [[ $1 == subvolume ]] && [[ $2 == list ]] && \
        [[ "${!#}" == /broot ]]
    then
        echo '\'' ID 256 parent 5 top level 5 path __active
            ID 259 parent 256 top level 256 path __active/var
            ID 258 parent 256 top level 256 path __active/usr
            ID 257 parent 256 top level 256 path __active/home
            ID 1661 parent 5 top level 5 path __snapshot/backup_last
            ID 1662 parent 1661 top level 1661 path __snapshot/backup_last/var
            ID 1663 parent 1661 top level 1661 path __snapshot/backup_last/usr
            ID 1664 parent 1661 top level 1661 path __snapshot/backup_last/home'\''
    fi
    if [[ $1 == subvolume ]] && [[ $2 == show ]]; then
        if [[ $3 == /broot ]]; then
            echo "Name:             <FS_TREE>"
            echo "UUID:             123456ab-abc1-2345"
            return 0
        fi
        # check if subvolume
        [[ $3 == /broot/__active ]] && return 0
        [[ $3 == /broot/__active/var ]] && return 0
        [[ $3 == /broot/__active/usr ]] && return 0
        [[ $3 == /broot/__active/home ]] && return 0
        [[ $3 == /broot/__snapshot/backup_last ]] && return 0
        [[ $3 == /broot/__snapshot/backup_last/var ]] && return 0
        [[ $3 == /broot/__snapshot/backup_last/usr ]] && return 0
        [[ $3 == /broot/__snapshot/backup_last/home ]] && return 0
        # return error if not a subvolume
        return 1
    fi
    if [[ $1 == subvolume ]] && [[ $2 == delete ]]; then
        # check if subvolume
        [[ $3 == /broot/__active ]] && return 0
        [[ $3 == /broot/__active/var ]] && return 0
        [[ $3 == /broot/__active/usr ]] && return 0
        [[ $3 == /broot/__active/home ]] && return 0
        [[ $3 == /broot/__snapshot/backup_last ]] && return 0
        [[ $3 == /broot/__snapshot/backup_last/var ]] && return 0
        [[ $3 == /broot/__snapshot/backup_last/usr ]] && return 0
        [[ $3 == /broot/__snapshot/backup_last/home ]] && return 0
        # return error if not a subvolume
        return 1
    fi
}
'
# endregion
# region functions
filesystem_btrfs_subvolume_backup() {
    # Create, delete or list system backups.
    #
    # Examples:
    #
    # >>> filesystem.btrfs_subvolume_backup list
    # >>> filesystem.btrfs_subvolume_backup create
    # >>> filesystem.btrfs_subvolume_backup delete rootBackup
    sudo umount /mnt &>/dev/null
    if [[ "$1" == create ]]; then
        sudo mount PARTLABEL=system /mnt
        local timestamp="$(date +"%d:%m:%y:%T")"
        sudo btrfs subvolume snapshot /mnt/root \
            "/mnt/rootBackup${timestamp}"
        # NOTE: Autocompletion should be done by sudo. Not bash as user.
        sudo bash -c "cp --recursive /boot/* \"/mnt/rootBackup${timestamp}/boot/\""
        sudo umount /mnt
    elif [[ "$1" == delete ]] && [[ "$2" ]]; then
        sudo mount PARTLABEL=system /mnt
        sudo btrfs subvolume delete "/mnt/$(basename "$2")"
        sudo umount /mnt
    elif [[ "$1" == list ]]; then
        sudo btrfs subvolume list /
    else
        cat << EOF
filesystem.btrfs_subvolume_backup create|delete|list [backupName]
EOF
    fi
    return $?
}
alias filesystem.btrfs_subvolume_backup=filesystem_btrfs_subvolume_backup
filesystem_btrfs_subvolume_backup_autocomplete() {
    # Autocompletion function.
    local lastCompleteArgument="${COMP_WORDS[${COMP_CWORD}-1]}"
    local currentArgument="${COMP_WORDS[-1]}"

    if [[ $COMP_CWORD == 1 ]]; then
        COMPREPLY=($(compgen -W 'create delete list' -- "$currentArgument"))
    elif [[ $UID == 0 ]] && [[ $COMP_CWORD == 2 ]]
         [[ "$lastCompleteArgument" == 'delete' ]]; then
        COMPREPLY=($(compgen -W "$(filesystem.btrfs_subvolume_backup list | cut --delimiter ' ' \
            --field 9 | tr '\n' ' ')" -- "$currentArgument"))
    fi
    return 0
}
alias filesystem.btrfs_subvolume_backup_autocomplete=filesystem_btrfs_subvolume_backup_autocomplete
complete -F filesystem_btrfs_subvolume_backup_autocomplete filesystem_btrfs_subvolume_backup
filesystem_btrfs_is_subvolume() {
    local __doc__='
    Checks if path is a subvolume. Note: The btrfs root is also a subvolume.
    >>> filesystem_btrfs_is_subvolume /broot; echo $?
    0
    >>> filesystem_btrfs_is_subvolume /broot/__active; echo $?
    0
    >>> filesystem_btrfs_is_subvolume /broot/__active/usr; echo $?
    0
    >>> filesystem_btrfs_is_subvolume /broot/__active/etc; echo $?
    1
    '
    btrfs subvolume show "$1" &>/dev/null
}
filesystem_is_btrfs_root() {
    local __doc__='
    >>> filesystem_is_btrfs_root /broot; echo $?
    0
    >>> filesystem_is_btrfs_root /broot/foo; echo $?
    1
    '
    (btrfs subvolume show "$1" | grep "is btrfs root") &>/dev/null || \
        (btrfs subvolume show "$1" | grep "is toplevel") &>/dev/null || \
        (btrfs subvolume show "$1" | grep "Name:.*<FS_TREE>") &>/dev/null || \
        return 1
}
filesystem_btrfs_find_root() {
    local __doc__='
    Returns absolute path to btrfs root.
    Example:
    >>> filesystem_btrfs_find_root /broot/__active
    /broot
    >>> filesystem_btrfs_find_root /broot/__snapshot/backup_last
    /broot
    >>> filesystem_btrfs_find_root /not/a/valid/mountpoint; echo $?
    1
    '
    local path="$1"
    while true; do
        filesystem_is_btrfs_root "$path" && echo "$path" && return 0
        [[ "$path" == "/" ]] && return 1
        path="$(dirname "$path")"
    done
}

filesystem_btrfs_get_subvolume_list_field() {
    local __doc__='
    >>> local entry="$(btrfs subvolume list /broot | head -n1)"
    >>> filesystem_btrfs_get_subvolume_list_field path "$entry"
    >>> filesystem_btrfs_get_subvolume_list_field ID "$entry"
    >>> filesystem_btrfs_get_subvolume_list_field parent "$entry"
    __active
    256
    5
    '
    local target="$1"
    local entry=($2)
    local found=false
    local field
    for field in "${entry[@]}"; do
        $found && echo "$field" && break
        # case insensitive match (bash >= 4)
        [[ "${field,,}" == "${target,,}" ]] && found=true
    done
}
filesystem_btrfs_subvolume_filter() {
    local __doc__='
    Example:
    >>> filesystem_btrfs_subvolume_filter /broot parent 256
    ID 259 parent 256 top level 256 path __active/var
    ID 258 parent 256 top level 256 path __active/usr
    ID 257 parent 256 top level 256 path __active/home
    >>> filesystem_btrfs_subvolume_filter /broot id 256
    ID 256 parent 5 top level 5 path __active
    '
    local btrfs_root="$(realpath "$1")"
    local target_key="$2"
    local target_value="$3"
    local entry
    filesystem_is_btrfs_root "$btrfs_root" || return 1
    btrfs subvolume list -p "$btrfs_root" | while read -r entry; do
        local value
        value="$(filesystem_btrfs_get_subvolume_list_field "$target_key" "$entry")"
        if [[ "$value" == "$target_value" ]]; then
            echo "$entry"
        fi
    done
}
filesystem_btrfs_get_child_volumes() {
    # shellcheck disable=SC2016
    local __doc__='
    Returns absolute paths to subvolumes
    Example:
    >>> filesystem_btrfs_get_child_volumes /broot/__active
    /broot/__active/var
    /broot/__active/usr
    /broot/__active/home
    >>> filesystem_btrfs_get_child_volumes /broot/__snapshot/backup_last
    /broot/__snapshot/backup_last/var
    /broot/__snapshot/backup_last/usr
    /broot/__snapshot/backup_last/home
    '
    local volume="$1"
    local btrfs_root entry volume_id volume_relative
    filesystem_btrfs_is_subvolume "${volume}" || return 1
    btrfs_root="$(filesystem_btrfs_find_root "$volume")"
    volume_relative="$(bl.path.converto_to_relative "$btrfs_root" "$volume")"
    entry="$(
        filesystem_btrfs_subvolume_filter "$btrfs_root" path "$volume_relative"
    )"
    volume_id="$(filesystem_btrfs_get_subvolume_list_field id "$entry")"
    filesystem_btrfs_subvolume_filter "$btrfs_root" parent "$volume_id" \
        | while read -r entry
    do
        child_path="$(filesystem_btrfs_get_subvolume_list_field path "$entry")"
        echo "${btrfs_root}/${child_path}"
    done
}
filesystem_btrfs_subvolume_delete() {
    local __doc__='
    # Delete a subvolume. Also deletes child subvolumes.
    >>> filesystem_btrfs_subvolume_delete /broot/__snapshot/backup_last
    >>> echo $?
    0
    >>> filesystem_btrfs_subvolume_delete /broot/__snapshot/foo
    >>> echo $?
    1
    '
    local volume="$1"
    local child
    filesystem_btrfs_subvolume_set_ro "$volume" false
    filesystem_btrfs_get_child_volumes "$volume" \
        | while read -r child
    do
        btrfs subvolume delete "$child"
    done
    btrfs subvolume delete "$volume"
}
filesystem_btrfs_subvolume_set_ro() {
    local __doc__='
    # Make subvolume writable or readonly. Also applies to child subvolumes.
    '
    local volume="$1"
    local read_only="$2"
    [ -z "$2" ] && read_only=true
    # if setting to writable set top volume first
    $read_only || btrfs property set -ts "$volume" ro $read_only
    local child
    filesystem_btrfs_get_child_volumes "$volume" | while read -r child; do
        btrfs property set -ts "$child" ro $read_only
    done
    # if setting to read_only set top volume last
    if $read_only; then
        btrfs property set -ts "$volume" ro $read_only
    fi
}
filesystem_btrfs_snapshot() {
    local __doc__='
    # Make snapshot of subvolume.

    >>> filesystem_btrfs_snapshot /broot/__active /backup/__active_backup
    btrfs subvolume snapshot /broot/__active /backup/__active_backup
    rmdir /backup/__active_backup/var
    btrfs subvolume snapshot /broot/__active/var /backup/__active_backup/var
    rmdir /backup/__active_backup/usr
    btrfs subvolume snapshot /broot/__active/usr /backup/__active_backup/usr
    rmdir /backup/__active_backup/home
    btrfs subvolume snapshot /broot/__active/home /backup/__active_backup/home

    Third parameter can be used to exclude a subvolume (currently only one)
    >>> filesystem_btrfs_snapshot /broot/__active /backup/__active_backup usr
    btrfs subvolume snapshot /broot/__active /backup/__active_backup
    rmdir /backup/__active_backup/var
    btrfs subvolume snapshot /broot/__active/var /backup/__active_backup/var
    rmdir /backup/__active_backup/home
    btrfs subvolume snapshot /broot/__active/home /backup/__active_backup/home
    '
    local volume="$1"
    local target="$2"
    local exclude="$3"
    btrfs subvolume snapshot "${volume}" "${target}"
    local child child_relative
    filesystem_btrfs_get_child_volumes "$volume" | while read -r child; do
        child_relative="$(bl.path.convert_to_relative "$volume" "$child")"
        if [ "$child_relative" != "$exclude" ]; then
            rmdir "${target}/${child_relative}"
            btrfs subvolume snapshot "${child}" "${target}/${child_relative}"
        fi
    done
}
filesystem_btrfs_send_update() {
    # shellcheck disable=SC2034,SC1004
    local __doc__='
    # Update snapshot (needs backing snapshot).
    e.g
    >>> filesystem_btrfs_send_update /broot/__active \
    >>>     /broot/backing \
    >>>     /backup
    btrfs send -p /broot/backing /broot/__active | pv | btrfs receive /backup
    rmdir /backup/__active/var
    btrfs send -p /broot/backing/var /broot/__active/var | pv | btrfs receive /backup/__active
    rmdir /backup/__active/usr
    btrfs send -p /broot/backing/usr /broot/__active/usr | pv | btrfs receive /backup/__active
    rmdir /backup/__active/home
    btrfs send -p /broot/backing/home /broot/__active/home | pv | btrfs receive /backup/__active
    '
    local volume="$1"
    local volume_name="$(basename "$1")"
    local backing_snapshot="$2"
    local target="$3"
    # Note btrfs send can only operate on read-only snapshots
    filesystem_btrfs_subvolume_set_ro "$volume" true
    filesystem_btrfs_subvolume_set_ro "$backing_snapshot" true
    btrfs send -p "$backing_snapshot" "$volume" | \
        pv --progress --timer --rate --average-rate --bytes | \
        btrfs receive "$target"
    # Note btrfs receive can only create the subdirs if not read-only
    filesystem_btrfs_subvolume_set_ro "${target}/${volume_name}" false
    local child child_relative
    filesystem_btrfs_get_child_volumes "$volume" | while read -r child; do
        child_relative="$(bl.path.convert_to_relative "$volume" "$child")"
        rmdir "${target}/${volume_name}/${child_relative}"
        btrfs send -p "${backing_snapshot}/${child_relative}" "$child" | \
            pv --progress --timer --rate --average-rate --bytes | \
            btrfs receive "${target}/${volume_name}"
    done
    filesystem_btrfs_subvolume_set_ro "$volume" false
}
filesystem_btrfs_send() {
    local __doc__='
    # Send snapshot
    >>> filesystem_btrfs_send /broot/__active /backup/__active_backup
    btrfs send /broot/__active | pv | btrfs receive /backup
    btrfs send /broot/__active/var | pv | btrfs receive /backup/__active
    btrfs send /broot/__active/usr | pv | btrfs receive /backup/__active
    btrfs send /broot/__active/home | pv | btrfs receive /backup/__active
    mv /backup/__active /backup/__active_backup
    '
    local volume="$1"
    local volume_name="$(basename "$1")"
    local target="$2"
    local target_dir="$(dirname "$2")"
    local target_name="$(basename "$2")"
    # Note btrfs send can only operate on read-only snapshots
    filesystem_btrfs_subvolume_set_ro "$volume" true
    btrfs send "$volume" | \
        pv --progress --timer --rate --average-rate --bytes | \
        btrfs receive "$target_dir"
    # Note btrfs receive can only create the subdirs if not read-only
    filesystem_btrfs_subvolume_set_ro "${target_dir}/$volume_name" false
    local child
    filesystem_btrfs_get_child_volumes "$volume" \
        | while read -r child
    do
        btrfs send "$child" | \
            pv --progress --timer --rate --average-rate --bytes | \
            btrfs receive "${target_dir}/${volume_name}"
    done
    mv "${target_dir}/$volume_name" "$target"
    filesystem_btrfs_subvolume_set_ro "$volume" false
}
# endregion
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion
