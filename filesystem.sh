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
# shellcheck source=./module.sh
source "$(dirname "${BASH_SOURCE[0]}")/module.sh"
bl.module.import bashlink.logging
bl.module.import bashlink.path
# endregion
# region variables
bl_filesystem__doc_test_setup__='
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
## region btrfs
alias bl.filesystem.btrfs_subvolume_backup=bl_filesystem_btrfs_subvolume_backup
bl_filesystem_btrfs_subvolume_backup() {
    # shellcheck disable=SC2016,2034
    local __doc__='
    Create, delete or list system backups.

    ```
        bl.filesystem.btrfs_subvolume_backup list
        bl.filesystem.btrfs_subvolume_backup create
        bl.filesystem.btrfs_subvolume_backup delete rootBackup
    ```
    '
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
bl.filesystem.btrfs_subvolume_backup create|delete|list [backupName]
EOF
    fi
    return $?
}
alias bl.filesystem.btrfs_subvolume_backup_autocomplete=bl_filesystem_btrfs_subvolume_backup_autocomplete
bl_filesystem_btrfs_subvolume_backup_autocomplete() {
    # Autocompletion function.
    local lastCompleteArgument="${COMP_WORDS[${COMP_CWORD}-1]}"
    local currentArgument="${COMP_WORDS[-1]}"

    if [[ $COMP_CWORD == 1 ]]; then
        COMPREPLY=($(compgen -W 'create delete list' -- "$currentArgument"))
    elif [[ $UID == 0 ]] && [[ $COMP_CWORD == 2 ]]
         [[ "$lastCompleteArgument" == 'delete' ]]; then
        COMPREPLY=($(compgen -W "$(bl.filesystem.btrfs_subvolume_backup list | cut --delimiter ' ' \
            --field 9 | tr '\n' ' ')" -- "$currentArgument"))
    fi
    return 0
}
complete -F bl_filesystem_btrfs_subvolume_backup_autocomplete bl_filesystem_btrfs_subvolume_backup
alias bl.filesystem.btrfs_is_subvolume=bl_filesystem_btrfs_is_subvolume
bl_filesystem_btrfs_is_subvolume() {
    # shellcheck disable=SC2016,2034
    local __doc__='
    Checks if path is a subvolume. Note: The btrfs root is also a subvolume.
    >>> bl.filesystem.btrfs_is_subvolume /broot; echo $?
    0
    >>> bl.filesystem.btrfs_is_subvolume /broot/__active; echo $?
    0
    >>> bl.filesystem.btrfs_is_subvolume /broot/__active/usr; echo $?
    0
    >>> bl.filesystem.btrfs_is_subvolume /broot/__active/etc; echo $?
    1
    '
    btrfs subvolume show "$1" &>/dev/null
}
alias bl.filesystem.is_btrfs_root=bl_filesystem_is_btrfs_root
bl_filesystem_is_btrfs_root() {
    # shellcheck disable=SC2016,2034
    local __doc__='
    >>> bl.filesystem.is_btrfs_root /broot; echo $?
    0
    >>> bl.filesystem.is_btrfs_root /broot/foo; echo $?
    1
    '
    (btrfs subvolume show "$1" | grep "is btrfs root") &>/dev/null || \
        (btrfs subvolume show "$1" | grep "is toplevel") &>/dev/null || \
        (btrfs subvolume show "$1" | grep "Name:.*<FS_TREE>") &>/dev/null || \
        return 1
}
alias bl.filesystem.btrfs_find_root=bl_filesystem_btrfs_find_root
bl_filesystem_btrfs_find_root() {
    # shellcheck disable=SC2016,2034
    local __doc__='
    Returns absolute path to btrfs root.
    Example:
    >>> bl.filesystem.btrfs_find_root /broot/__active
    /broot
    >>> bl.filesystem.btrfs_find_root /broot/__snapshot/backup_last
    /broot
    >>> bl.filesystem.btrfs_find_root /not/a/valid/mountpoint; echo $?
    1
    '
    local path="$1"
    while true; do
        bl.filesystem.is_btrfs_root "$path" && echo "$path" && return 0
        [[ "$path" == "/" ]] && return 1
        path="$(dirname "$path")"
    done
}
alias bl.filesystem.btrfs_get_subvolume_list_field=bl_filesystem_btrfs_get_subvolume_list_field
bl_filesystem_btrfs_get_subvolume_list_field() {
    # shellcheck disable=SC2016,2034
    local __doc__='
    >>> local entry="$(btrfs subvolume list /broot | head -n1)"
    >>> bl.filesystem.btrfs_get_subvolume_list_field path "$entry"
    >>> bl.filesystem.btrfs_get_subvolume_list_field ID "$entry"
    >>> bl.filesystem.btrfs_get_subvolume_list_field parent "$entry"
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
alias bl.filesystem.btrfs_subvolume_filter=bl_filesystem_btrfs_subvolume_filter
bl_filesystem_btrfs_subvolume_filter() {
    # shellcheck disable=SC2016,2034
    local __doc__='
    Example:
    >>> bl.filesystem.btrfs_subvolume_filter /broot parent 256
    ID 259 parent 256 top level 256 path __active/var
    ID 258 parent 256 top level 256 path __active/usr
    ID 257 parent 256 top level 256 path __active/home
    >>> bl.filesystem.btrfs_subvolume_filter /broot id 256
    ID 256 parent 5 top level 5 path __active
    '
    local btrfs_root="$(realpath "$1")"
    local target_key="$2"
    local target_value="$3"
    local entry
    bl.filesystem.is_btrfs_root "$btrfs_root" || return 1
    btrfs subvolume list -p "$btrfs_root" | while read -r entry; do
        local value
        value="$(bl.filesystem.btrfs_get_subvolume_list_field "$target_key" "$entry")"
        if [[ "$value" == "$target_value" ]]; then
            echo "$entry"
        fi
    done
}
alias bl.filesystem.btrfs_get_child_volumes=bl_filesystem_btrfs_get_child_volumes
bl_filesystem_btrfs_get_child_volumes() {
    # shellcheck disable=SC2016,2034
    local __doc__='
    Returns absolute paths to subvolumes
    Example:
    >>> bl.filesystem.btrfs_get_child_volumes /broot/__active
    /broot/__active/var
    /broot/__active/usr
    /broot/__active/home
    >>> bl.filesystem.btrfs_get_child_volumes /broot/__snapshot/backup_last
    /broot/__snapshot/backup_last/var
    /broot/__snapshot/backup_last/usr
    /broot/__snapshot/backup_last/home
    '
    local volume="$1"
    local btrfs_root entry volume_id volume_relative
    bl.filesystem.btrfs_is_subvolume "${volume}" || return 1
    btrfs_root="$(bl.filesystem.btrfs_find_root "$volume")"
    volume_relative="$(bl.path.converto_to_relative "$btrfs_root" "$volume")"
    entry="$(
        bl.filesystem.btrfs_subvolume_filter "$btrfs_root" path "$volume_relative"
    )"
    volume_id="$(bl.filesystem.btrfs_get_subvolume_list_field id "$entry")"
    bl.filesystem.btrfs_subvolume_filter "$btrfs_root" parent "$volume_id" \
        | while read -r entry
    do
        child_path="$(bl.filesystem.btrfs_get_subvolume_list_field path "$entry")"
        echo "${btrfs_root}/${child_path}"
    done
}
alias bl.filesystem.btrfs_subvolume_delete=bl_filesystem_btrfs_subvolume_delete
bl_filesystem_btrfs_subvolume_delete() {
    # shellcheck disable=SC2016,2034
    local __doc__='
    Delete a subvolume. Also deletes child subvolumes.
    >>> bl.filesystem.btrfs_subvolume_delete /broot/__snapshot/backup_last
    >>> echo $?
    0
    >>> bl.filesystem.btrfs_subvolume_delete /broot/__snapshot/foo
    >>> echo $?
    1
    '
    local volume="$1"
    local child
    bl.filesystem.btrfs_subvolume_set_ro "$volume" false
    bl.filesystem.btrfs_get_child_volumes "$volume" \
        | while read -r child
    do
        btrfs subvolume delete "$child"
    done
    btrfs subvolume delete "$volume"
}
alias bl.filesystem.btrfs_subvolume_set_ro=bl_filesystem_btrfs_subvolume_set_ro
bl_filesystem_btrfs_subvolume_set_ro() {
    # shellcheck disable=SC2016,2034
    local __doc__='
    Make subvolume writable or readonly. Also applies to child subvolumes.
    '
    local volume="$1"
    local read_only="$2"
    [ -z "$2" ] && read_only=true
    # if setting to writable set top volume first
    $read_only || btrfs property set -ts "$volume" ro $read_only
    local child
    bl.filesystem.btrfs_get_child_volumes "$volume" | while read -r child; do
        btrfs property set -ts "$child" ro $read_only
    done
    # if setting to read_only set top volume last
    if $read_only; then
        btrfs property set -ts "$volume" ro $read_only
    fi
}
alias bl.filesystem.btrfs_snapshot=bl_filesystem_btrfs_snapshot
bl_filesystem_btrfs_snapshot() {
    # shellcheck disable=SC2016,2034
    local __doc__='
    Make snapshot of subvolume.

    >>> bl.filesystem.btrfs_snapshot /broot/__active /backup/__active_backup
    btrfs subvolume snapshot /broot/__active /backup/__active_backup
    rmdir /backup/__active_backup/var
    btrfs subvolume snapshot /broot/__active/var /backup/__active_backup/var
    rmdir /backup/__active_backup/usr
    btrfs subvolume snapshot /broot/__active/usr /backup/__active_backup/usr
    rmdir /backup/__active_backup/home
    btrfs subvolume snapshot /broot/__active/home /backup/__active_backup/home

    Third parameter can be used to exclude a subvolume (currently only one)
    >>> bl.filesystem.btrfs_snapshot /broot/__active /backup/__active_backup usr
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
    bl.filesystem.btrfs_get_child_volumes "$volume" | while read -r child; do
        child_relative="$(bl.path.convert_to_relative "$volume" "$child")"
        if [ "$child_relative" != "$exclude" ]; then
            rmdir "${target}/${child_relative}"
            btrfs subvolume snapshot "${child}" "${target}/${child_relative}"
        fi
    done
}
alias bl.filesystem.btrfs_send_update=bl_filesystem_btrfs_send_update
bl_filesystem_btrfs_send_update() {
    # shellcheck disable=SC2016,2034
    local __doc__='
    Update snapshot (needs backing snapshot).
    e.g
    >>> bl.filesystem.btrfs_send_update /broot/__active \
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
    bl.filesystem.btrfs_subvolume_set_ro "$volume" true
    bl.filesystem.btrfs_subvolume_set_ro "$backing_snapshot" true
    btrfs send -p "$backing_snapshot" "$volume" | \
        pv --progress --timer --rate --average-rate --bytes | \
        btrfs receive "$target"
    # Note btrfs receive can only create the subdirs if not read-only
    bl.filesystem.btrfs_subvolume_set_ro "${target}/${volume_name}" false
    local child child_relative
    bl.filesystem.btrfs_get_child_volumes "$volume" | while read -r child; do
        child_relative="$(bl.path.convert_to_relative "$volume" "$child")"
        rmdir "${target}/${volume_name}/${child_relative}"
        btrfs send -p "${backing_snapshot}/${child_relative}" "$child" | \
            pv --progress --timer --rate --average-rate --bytes | \
            btrfs receive "${target}/${volume_name}"
    done
    bl.filesystem.btrfs_subvolume_set_ro "$volume" false
}
alias bl.filesystem.btrfs_send=bl_filesystem_btrfs_send
bl_filesystem_btrfs_send() {
    # shellcheck disable=SC2016,2034
    local __doc__='
    Send snapshot
    >>> bl.filesystem.btrfs_send /broot/__active /backup/__active_backup
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
    bl.filesystem.btrfs_subvolume_set_ro "$volume" true
    btrfs send "$volume" | \
        pv --progress --timer --rate --average-rate --bytes | \
        btrfs receive "$target_dir"
    # Note btrfs receive can only create the subdirs if not read-only
    bl.filesystem.btrfs_subvolume_set_ro "${target_dir}/$volume_name" false
    local child
    bl.filesystem.btrfs_get_child_volumes "$volume" \
        | while read -r child
    do
        btrfs send "$child" | \
            pv --progress --timer --rate --average-rate --bytes | \
            btrfs receive "${target_dir}/${volume_name}"
    done
    mv "${target_dir}/$volume_name" "$target"
    bl.filesystem.btrfs_subvolume_set_ro "$volume" false
}
## endregion
## region file links
alias bl.filesystem.find_hardlinks=bl_filesystem_find_hardlinks
bl_filesystem_find_hardlinks() {
    # shellcheck disable=SC2016,2034
    local __doc__='
    Finds same files as given file (hardlinks).

    `bl.filesystem.find_hardlinks /home/user/test.txt`
    '
    sudo find / -samefile $1 2>/dev/null
    return $?
}
alias bl.filesystem.show_symbolic_links=bl_filesystem_show_symbolic_links
bl_filesystem_show_symbolic_links() {
    # shellcheck disable=SC2016,2034
    local __doc__='
    Shows symbolic links in current directory if no argument is provided or
    in given location and their subdirectories (recursive).

    ```
        bl.filesystem.show_symbolic_links
        bl.filesystem.show_symbolic_links /home
    ```
    '
    local fileSystemElement
    for fileSystemElement in $(find "$1" -type l); do
        echo "$fileSystemElement"' -> '
        readlink "$fileSystemElement"
    done
    return $?
}
## endregion
bl_filesystem__doctest_setup__='
lsblk() {
    if [[ "${@: -1}" == "" ]];then
        echo "lsblk: : not a block device"
        return 1
    fi
    if [[ "${@: -1}" != "/dev/sdb" ]];then
        echo "/dev/sda disk"
        echo "/dev/sda1 part SYSTEM_LABEL 0x7"
        echo "/dev/sda2 part"
    fi
    if [[ "${@: -1}" != "/dev/sda" ]];then
        echo "/dev/sdb disk"
        echo "/dev/sdb1 part boot_partition "
        echo "/dev/sdb2 part system_partition"
    fi
}
blkid() {
    [[ "${@: -1}" != "/dev/sda2" ]] && return 0
    echo "gpt"
    echo "only discoverable by blkid"
    echo "boot_partition"
    echo "192d8b9e"
}
'
alias bl.filesystem.find_block_device=bl_filesystem_find_block_device
bl_filesystem_find_block_device() {
    # shellcheck disable=SC2016,2034
    local __doc__='
    >>> bl.filesystem.find_block_device "boot_partition"
    /dev/sdb1
    >>> bl.filesystem.find_block_device "boot_partition" /dev/sda
    /dev/sda2
    >>> bl.filesystem.find_block_device "discoverable by blkid"
    /dev/sda2
    >>> bl.filesystem.find_block_device "_partition"
    /dev/sdb1 /dev/sdb2
    >>> bl.filesystem.find_block_device "not matching anything" || echo not found
    not found
    >>> bl.filesystem.find_block_device "" || echo not found
    not found
    '
    local partition_pattern="$1"
    local device="${2-}"

    [ "$partition_pattern" = "" ] && return 1
    find_block_device_simple() {
        local device_info
        lsblk --noheadings --list --paths --output \
        NAME,TYPE,LABEL,PARTLABEL,UUID,PARTUUID ${device:+"$device"} \
        | sort --unique | while read -r device_info; do
            local current_device
            current_device=$(echo "$device_info" | cut -d' ' -f1)
            if [[ "$device_info" = *"${partition_pattern}"* ]]; then
                echo "$current_device"
            fi
        done
    }
    find_block_device_deep() {
        local device_info
        lsblk --noheadings --list --paths --output NAME ${device:+"$device"} \
        | sort --unique | cut -d' ' -f1 | while read -r current_device; do
            blkid -p -o value "$current_device" \
            | while read -r device_info; do
                if [[ "$device_info" = *"${partition_pattern}"* ]]; then
                    echo "$current_device"
                fi
            done
        done
    }
    local candidates
    candidates=($(find_block_device_simple))
    [ ${#candidates[@]} -eq 0 ] && candidates=($(find_block_device_deep))
    unset -f find_block_device_simple
    unset -f find_block_device_deep
    [ ${#candidates[@]} -eq 0 ] && return 1
    [ ${#candidates[@]} -ne 1 ] && echo "${candidates[@]}" && return 1
    bl.logging.plain "${candidates[0]}"
}
alias bl.filesystem.create_partition_via_offset=bl_filesystem_create_partition_via_offset
bl_filesystem_create_partition_via_offset() {
    local device="$1"
    local nameOrUUID="$2"
    local loop_device
    loop_device="$(losetup --find)"
    local sector_size
    sector_size="$(blockdev --getbsz "$device")"

    # NOTE: partx's NAME field corresponds to partition labels
    local partitionInfo
    partitionInfo=$(partx --raw --noheadings --output \
        START,NAME,UUID,TYPE "$device" 2>/dev/null| grep "$nameOrUUID")
    local offsetSectors
    offsetSectors="$(echo "$partitionInfo"| cut --delimiter ' ' \
        --fields 1)"
    if [ -z "$offsetSectors" ]; then
        bl.logging.warn "Could not find partition with label/uuid \"$nameOrUUID\" on device \"$device\""
        return 1
    fi
    local offsetBytes
    offsetBytes="$(echo | awk -v x="$offsetSectors" -v y="$sector_size" '{print x * y}')"
    losetup --offset "$offsetBytes" "$loop_device" "$device"
    bl.logging.plain "$loop_device"
}
alias bl.filesystem.make_uefi_boot_entry=bl_filesystem_make_uefi_boot_entry
bl_filesystem_make_uefi_boot_entry() {
    # shellcheck disable=SC2016,2034
    local __doc__='
    Creates an uefi boot entry.

    ```
        bl.filesystem.make_uefi_boot_entry archLinux
        bl.filesystem.make_uefi_boot_entry archLinuxFallback
        bl.filesystem.make_uefi_boot_entry archLinuxLTSFallback vmlinuz-linux-lts
    ```
    '
    local kernelParameterFilePath="${ILU_CONFIG_PATH}linux/kernel/${1}CommandLine"
    local kernel='vmlinuz-linux'
    if [[ "$2" ]]; then
        kernel="$2"
    fi
    if [[ -f "$kernelParameterFilePath" ]]; then
        local command="sudo efibootmgr --verbose --create --disk /dev/sda --part 1 -l \"\\${kernel}\" --label \"$1\" --unicode \"$(cat "$kernelParameterFilePath")\""
        echo "Create boot entry \"$1\" with command \"${command}\"."
        eval $command
    else
        echo "Error: file \"${kernelParameterFilePath}\" doesn't exists."
    fi
    return $?
}
alias bl.filesystem.make_crypt_blockdevice=bl_filesystem_make_crypt_blockdevice
bl_filesystem_make_crypt_blockdevice() {
    # shellcheck disable=SC2016,2034
    local __doc__='
    Creates encrypted blockdevices.

    `bl.filesystem.make_crypt_blockdevice /dev/sda`
    '
    sudo cryptsetup -v --cipher aes-xts-plain64 --key-size 512 --hash sha512 \
        --iter-time 5000 --use-random luksFormat "$1"
}
alias bl.filesystem.open_crypt_blockdevice=bl_filesystem_open_crypt_blockdevice
bl_filesystem_open_crypt_blockdevice() {
    # shellcheck disable=SC2016,2034
    local __doc__='
    Mounts encrypted blockdevices as analyseable blockdevice.

    `bl.filesystem.open_crypt_blockdevice /dev/sdb test`
    '
    sudo cryptsetup luksOpen "$1" "$2"
    return $?
}
alias bl.filesystem.close_crypt_blockdevice=bl_filesystem_close_crypt_blockdevice
bl_filesystem_close_crypt_blockdevice() {
    # shellcheck disable=SC2016,2034
    local __doc__='
    Mounts encrypted blockdevices as analyseable blockdevice.

    `bl.filesystem.close_crypt_blockdevice test`
    '
    sudo cryptsetup luksClose "$1"
    return $?
}
alias bl.filesystem.repair=bl_filesystem_repair
bl_filesystem_repair() {
    # shellcheck disable=SC2016,2034
    local __doc__='
    Finds filesystem errors on linux based filesystem and repairs them.

    `bl.filesystem.repair /dev/mmcblk0p2`
    '
    local target=/dev/mmcblk0
    if [[ "$1" ]]; then
        target="$1"
    fi
    sudo badblocks "$target"
    sudo fsck -a "$target"
    return $?
}
alias bl.filesysten.set_maximum_user_watches=bl_filesystem_set_maximum_user_watches
bl_filesystem_set_maximum_user_watches() {
    # shellcheck disable=SC2016,2034
    local __doc__='
    Sets the maximum number of concurrent allowed file observations via
    inotify.

    `bl.filesystem.set_maximum_user_watches 500000`
    '
    echo "$1" | sudo tee /proc/sys/fs/inotify/max_user_watches
    return $?
}
alias bl.filesysten.overlay_location=bl_filesystem_overlay_location
bl_filesystem_overlay_location() {
    # shellcheck disable=SC2016,2034
    local __doc__='
    Mounts an overlay over given location. This could be useful if we have a
    read only system caused by physical reasons.

    `bl.filesystem.overlay_location /usr/bin/`
    '
    mkdir --parents /tmp/overlayfsDifferences
    mount --types overlayfs --options \
        lowerdir="$1",upperdir='/tmp/overlayDifferences' overlayfs "$1"
    return $?
}
alias bl.filesystem.write_image_to_blockdevice=bl_filesystem_write_image_to_blockdevice
bl_filesystem_write_image_to_blockdevice() {
    # shellcheck disable=SC2016,2034
    local __doc__='
    Writes a given image to given blockdevice.

    ```
        bl.filesystem.write_image_to_blockdevice \
            /data/private/backup/image.img \
            /dev/mmcblk0
    ```
    '
    local source="${ILU_DATA_PATH}temp/image/"*.img
    if [[ "$1" ]]; then
        source="$1"
    fi
    local target=/dev/mmcblk0
    if [[ "$2" ]]; then
        target="$2"
    fi
    sudo dd bs=4M if="$source" of="$target"
    return $?
}
alias bl.filesystem.write_blockdevice_to_image=bl_filesystem_write_blockdevice_to_image
bl_filesystem_write_blockdevice_to_image() {
    # shellcheck disable=SC2016,2034
    local __doc__='
    Writes a given backup from given blockdevice.

    ```
        bl.filesystem.write_blockdevice_to_image \
            /dev/mmcblk0 \
            /data/private/backup/image.img
    ```
    '
    local source=/dev/mmcblk0
    if [[ "$1" ]]; then
        source="$1"
    fi
    local target="${ILU_DATA_PATH}private/backup/backup-sd-card.img"
    if [[ "$2" ]]; then
        target="$2"
    fi
    sudo dd bs=4M if="$source" of="$target"
    return $?
}
# endregion
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion
