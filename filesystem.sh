#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# region header
# Copyright Torben Sickert (info["~at~"]torben.website) 16.12.2012

# License
# -------

# This library written by Torben Sickert stand under a creative commons naming
# 3.0 unported license. see http://creativecommons.org/licenses/by/3.0/deed.de
# endregion
# shellcheck disable=SC2016,SC2155
# region import
# shellcheck source=./globals.sh
# shellcheck source=./module.sh
source "$(dirname "${BASH_SOURCE[0]}")/module.sh"
bl.module.import bashlink.globals
bl.module.import bashlink.logging
bl.module.import bashlink.path
# endregion
# region variables
# shellcheck disable=SC2034
bl_filesystem__dependencies__=(pv)
# shellcheck disable=SC2034,SC1004
bl_filesystem__doctest_setup__='
    # Runs once before tests are started:
    # region import
    bl.module.import bashlink.array
    bl.module.import bashlink.doctest
    # endregion
    doc_test_capture_stderr=false
    blkid() {
        if [[ "${@: -1}" != "/dev/sda2" ]]; then
            return 0
        fi
        cat <<EOF
gpt
only discoverable by blkid
boot_partition
192d8b9e
EOF
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
        if [[ $1 == subvolume ]] && [[ $2 == list ]] && [[ "${!#}" == /broot ]]
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
        local paths=(
            /broot/__active
            /broot/__active/var
            /broot/__active/usr
            /broot/__active/home
            /broot/__snapshot/backup_last
            /broot/__snapshot/backup_last/var
            /broot/__snapshot/backup_last/usr
            /broot/__snapshot/backup_last/home
        )
        if [[ $1 == subvolume ]] && [[ $2 == show ]]; then
            if [[ $3 == /broot ]]; then
                cat <<EOF
Name:             <FS_TREE>
UUID:             123456ab-abc1-2345
EOF
                return 0
            fi
            # Check if subvolume present and return error if not.
            bl.array.contains "${paths[*]}" "$3"
            return $?
        fi
        if [[ $1 == subvolume ]] && [[ $2 == delete ]]; then
            # Check if subvolume present and return error if not.
            bl.array.contains "${paths[*]}" "$3"
            return $?
        fi
    }
    lsblk() {
        if [[ "${@: -1}" == "" ]]; then
            echo "lsblk: : not a block device"
            return 1
        fi
        if [[ "${@: -1}" != "/dev/sdb" ]]; then
            cat <<EOF
/dev/sda disk
/dev/sda1 part SYSTEM_LABEL 0x7
/dev/sda2 part
EOF
        fi
        if [[ "${@: -1}" != "/dev/sda" ]]; then
            cat <<EOF
/dev/sdb disk
/dev/sdb1 part boot_partition
/dev/sdb2 part system_partition
EOF
        fi
    }
    mv() {
        echo mv $@
    }
    pv() {
        cat - | tr -d "\n" # print stdin
        echo -n " | pv | "
    }
    rmdir() {
        echo rmdir $@
    }
'
# endregion
# region functions
## region btrfs
alias bl.filesystem.btrfs_is_root=bl_filesystem_btrfs_is_root
bl_filesystem_btrfs_is_root() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
        >>> bl.filesystem.btrfs_is_root /broot; echo $?
        0
        >>> bl.filesystem.btrfs_is_root /broot/foo; echo $?
        1
    '
    (btrfs subvolume show "$1" | command grep 'is btrfs root') &>/dev/null || \
        (btrfs subvolume show "$1" | command grep 'is toplevel') &>/dev/null || \
        (btrfs subvolume show "$1" | command grep 'Name:.*<FS_TREE>') &>/dev/null || \
        return 1
}
# NOTE: Depends on "bl.filesystem.is_root"
alias bl.filesystem.btrfs_find_root=bl_filesystem_btrfs_find_root
bl_filesystem_btrfs_find_root() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
        Returns absolute path to btrfs root.

        >>> bl.filesystem.btrfs_find_root /broot/__active
        /broot
        >>> bl.filesystem.btrfs_find_root /broot/__snapshot/backup_last
        /broot
        >>> bl.filesystem.btrfs_find_root /not/a/valid/mountpoint; echo $?
        1
    '
    local path="$1"
    while true; do
        bl.filesystem.btrfs_is_root "$path" && echo "$path" && return 0
        [[ "$path" == "/" ]] && return 1
        path="$(dirname "$path")"
    done
}
# NOTE: Depends on "bl.filesystem.is_root"
alias bl.filesystem.btrfs_subvolume_filter=bl_filesystem_btrfs_subvolume_filter
bl_filesystem_btrfs_subvolume_filter() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
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
    bl.filesystem.btrfs_is_root "$btrfs_root" || return 1
    btrfs subvolume list -p "$btrfs_root" | while read -r entry; do
        local value="$(bl.filesystem.btrfs_get_subvolume_list_field "$target_key" "$entry")"
        if [[ "$value" == "$target_value" ]]; then
            echo "$entry"
        fi
    done
}
alias bl.filesystem.btrfs_is_subvolume=bl_filesystem_btrfs_is_subvolume
bl_filesystem_btrfs_is_subvolume() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
        Checks if path is a subvolume. Note: The btrfs root is also a
        subvolume.

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
# NOTE: Depends on "bl.filesystem.btrfs_subvolume", "bl.filesystem.btrfs_subvolume_filter"
alias bl.filesystem.btrfs_get_child_volumes=bl_filesystem_btrfs_get_child_volumes
bl_filesystem_btrfs_get_child_volumes() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
        Returns absolute paths to subvolumes.

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
    bl.filesystem.btrfs_is_subvolume "${volume}" || return 1
    local btrfs_root="$(bl.filesystem.btrfs_find_root "$volume")"
    local volume_relative="$(bl.path.convert_to_relative "$btrfs_root" "$volume")"
    local entry="$(
        bl.filesystem.btrfs_subvolume_filter "$btrfs_root" path "$volume_relative"
    )"
    local volume_id="$(bl.filesystem.btrfs_get_subvolume_list_field id "$entry")"
    bl.filesystem.btrfs_subvolume_filter "$btrfs_root" parent "$volume_id" \
    | while read -r entry; do
        echo "${btrfs_root}/$(bl.filesystem.btrfs_get_subvolume_list_field path "$entry")"
    done
}
alias bl.filesystem.btrfs_get_subvolume_list_field=bl_filesystem_btrfs_get_subvolume_list_field
bl_filesystem_btrfs_get_subvolume_list_field() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
        >>> local entry="$(btrfs subvolume list /broot | head -n1)"
        >>> bl.filesystem.btrfs_get_subvolume_list_field path "$entry"
        >>> bl.filesystem.btrfs_get_subvolume_list_field ID "$entry"
        >>> bl.filesystem.btrfs_get_subvolume_list_field parent "$entry"
        __active
        256
        5
    '
    local target="$1"
    local entry
    read -r -a entry <<< "$2"
    local found=false
    local field
    for field in "${entry[@]}"; do
        if $found; then
            echo "$field"
            break
        fi
        # case insensitive match (bash >= 4)
        if [[ "${field,,}" == "${target,,}" ]]; then
            found=true
        fi
    done
}
alias bl.filesystem.btrfs_subvolume_set_read_only=bl_filesystem_btrfs_subvolume_set_read_only
bl_filesystem_btrfs_subvolume_set_read_only() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
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
# NOTE: Depends on "bl.filesystem.btrfs_subvolume_set_read_only"
alias bl.filesystem.btrfs_send=bl_filesystem_btrfs_send
bl_filesystem_btrfs_send() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
        Sends snapshots.

        >>> bl.filesystem.btrfs_send /broot/__active /backup/__active_backup
        btrfs send /broot/__active | pv | btrfs receive /backup
        btrfs send /broot/__active/var | pv | btrfs receive /backup/__active
        btrfs send /broot/__active/usr | pv | btrfs receive /backup/__active
        btrfs send /broot/__active/home | pv | btrfs receive /backup/__active
        mv /backup/__active /backup/__active_backup
    '
    local volume="$1"
    local volume_name="$(basename "$1")"
    local target_path="$2"
    local target_directory_path="$(dirname "$2")"
    # Note btrfs send can only operate on read-only snapshots
    bl.filesystem.btrfs_subvolume_set_read_only "$volume" true
    btrfs send "$volume" | \
        pv --progress --timer --rate --average-rate --bytes | \
        btrfs receive "$target_directory_path"
    # Note btrfs receive can only create the subdirs if not read-only
    bl.filesystem.btrfs_subvolume_set_read_only \
        "${target_directory_path}/$volume_name" false
    local child
    bl.filesystem.btrfs_get_child_volumes "$volume" | while read -r child; do
        btrfs send "$child" | \
            pv --progress --timer --rate --average-rate --bytes | \
            btrfs receive "${target_directory_path}/${volume_name}"
    done
    mv "${target_directory_path}/$volume_name" "$target_path"
    bl.filesystem.btrfs_subvolume_set_read_only "$volume" false
}
# NOTE: Depends on "bl.filesystem.btrfs_subvolume_set_read_only"
alias bl.filesystem.btrfs_send_update=bl_filesystem_btrfs_send_update
bl_filesystem_btrfs_send_update() {
    # shellcheck disable=SC1004,SC2016,SC2034
    local __documentation__='
        Update snapshot (needs backing snapshot).

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
    bl.filesystem.btrfs_subvolume_set_read_only "$volume" true
    bl.filesystem.btrfs_subvolume_set_read_only "$backing_snapshot" true
    btrfs send -p "$backing_snapshot" "$volume" | \
        pv --progress --timer --rate --average-rate --bytes | \
        btrfs receive "$target"
    # Note btrfs receive can only create the subdirs if not read-only
    bl.filesystem.btrfs_subvolume_set_read_only "${target}/${volume_name}" false
    local child child_relative
    bl.filesystem.btrfs_get_child_volumes "$volume" | while read -r child; do
        child_relative="$(bl.path.convert_to_relative "$volume" "$child")"
        rmdir "${target}/${volume_name}/${child_relative}"
        btrfs send -p "${backing_snapshot}/${child_relative}" "$child" | \
            pv --progress --timer --rate --average-rate --bytes | \
            btrfs receive "${target}/${volume_name}"
    done
    bl.filesystem.btrfs_subvolume_set_read_only "$volume" false
}
alias bl.filesystem.btrfs_snapshot=bl_filesystem_btrfs_snapshot
bl_filesystem_btrfs_snapshot() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
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
alias bl.filesystem.btrfs_subvolume_backup=bl_filesystem_btrfs_subvolume_backup
bl_filesystem_btrfs_subvolume_backup() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
        Create, delete or list system backups.

        ```bash
            bl.filesystem.btrfs_subvolume_backup list
        ```

        ```bash
            bl.filesystem.btrfs_subvolume_backup create
        ```

        ```bash
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
    local last_complete_argument="${COMP_WORDS[${COMP_CWORD}-1]}"
    local current_argument="${COMP_WORDS[-1]}"
    if [[ $COMP_CWORD == 1 ]]; then
        read -r -a COMPREPLY <<< "$(compgen -W 'create delete list' -- "$current_argument")"
    elif [[ $UID == 0 ]] && [[ $COMP_CWORD == 2 ]]
         [[ "$last_complete_argument" == delete ]]
    then
        read -r -a COMPREPLY <<< "$(compgen -W "$(
            bl.filesystem.btrfs_subvolume_backup list | \
            cut --delimiter ' ' --field 9 | tr '\n' ' '
        )" -- "$current_argument")"
    fi
    return 0
}
complete -F bl_filesystem_btrfs_subvolume_backup_autocomplete bl_filesystem_btrfs_subvolume_backup
alias bl.filesystem.btrfs_subvolume_delete=bl_filesystem_btrfs_subvolume_delete
bl_filesystem_btrfs_subvolume_delete() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
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
    bl.filesystem.btrfs_subvolume_set_read_only "$volume" false
    bl.filesystem.btrfs_get_child_volumes "$volume" \
        | while read -r child
    do
        btrfs subvolume delete "$child"
    done
    btrfs subvolume delete "$volume"
}
## endregion
alias bl.filesystem.close_crypt_blockdevice=bl_filesystem_close_crypt_blockdevice
bl_filesystem_close_crypt_blockdevice() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
        Mounts encrypted blockdevices as analyseable blockdevice.

        ```bash
            bl.filesystem.close_crypt_blockdevice test
        ```
    '
    sudo cryptsetup luksClose "$1"
    return $?
}
alias bl.filesystem.create_partition_via_offset=bl_filesystem_create_partition_via_offset
bl_filesystem_create_partition_via_offset() {
    local device="$1"
    local name_or_uuid="$2"
    local loop_device="$(losetup --find)"
    local sector_size="$(blockdev --getbsz "$device")"
    # NOTE: partx's NAME field corresponds to partition labels
    local partition_info=$(partx --raw --noheadings --output \
        START,NAME,UUID,TYPE "$device" 2>/dev/null| command grep "$name_or_uuid")
    local offset_sectors="$(echo "$partition_info"| cut --delimiter ' ' \
        --fields 1)"
    if [ -z "$offset_sectors" ]; then
        bl.logging.warn "Could not find partition with label/uuid \"$name_or_uuid\" on device \"$device\""
        return 1
    fi
    local offset_bytes="$(echo | awk -v x="$offset_sectors" -v y="$sector_size" '{print x * y}')"
    losetup --offset "$offset_bytes" "$loop_device" "$device"
    bl.logging.plain "$loop_device"
}
alias bl.filesystem.find_block_device=bl_filesystem_find_block_device
bl_filesystem_find_block_device() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
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
    [ "$partition_pattern" = '' ] && return 1
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
    read -r -a candidates <<< "$(find_block_device_simple)"
    [ ${#candidates[@]} -eq 0 ] && \
        read -r -a candidates <<< "$(find_block_device_deep)"
    unset -f find_block_device_simple
    unset -f find_block_device_deep
    [ ${#candidates[@]} -eq 0 ] && return 1
    [ ${#candidates[@]} -ne 1 ] && echo "${candidates[@]}" && return 1
    bl.logging.plain "${candidates[0]}"
}
## region file links
alias bl.filesystem.find_hardlinks=bl_filesystem_find_hardlinks
bl_filesystem_find_hardlinks() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
        Finds same files as given file (hardlinks).

        ```bash
            bl.filesystem.find_hardlinks /home/user/test.txt
        ```
    '
    sudo find / -samefile "$1" 2>/dev/null
    return $?
}
alias bl.filesystem.show_symbolic_links=bl_filesystem_show_symbolic_links
bl_filesystem_show_symbolic_links() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
        Shows symbolic links in current directory if no argument is provided or
        in given location and their subdirectories (recursive).

        ```bash
            bl.filesystem.show_symbolic_links
        ```

        ```bash
            bl.filesystem.show_symbolic_links /home
        ```
    '
    local element
    while IFS= read -r -d '' element; do
        echo "${element} -> "
        readlink "$element"
    done < <(find "$1" -type l -print0)
    return $?
}
## endregion
alias bl.filesystem.make_crypt_blockdevice=bl_filesystem_make_crypt_blockdevice
bl_filesystem_make_crypt_blockdevice() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
        Creates encrypted blockdevices.

        ```bash
            bl.filesystem.make_crypt_blockdevice /dev/sda
        ```
    '
    sudo cryptsetup -v --cipher aes-xts-plain64 --key-size 512 --hash sha512 \
        --iter-time 5000 --use-random luksFormat "$1"
}
alias bl.filesystem.make_uefi_boot_entry=bl_filesystem_make_uefi_boot_entry
bl_filesystem_make_uefi_boot_entry() {
    # shellcheck disable=SC1004,SC2016,SC2034
    local __documentation__='
        Creates an uefi boot entry.

        ```bash
            bl.filesystem.make_uefi_boot_entry archLinux
        ```

        ```bash
            bl.filesystem.make_uefi_boot_entry archLinuxFallback
        ```

        ```bash
            bl.filesystem.make_uefi_boot_entry \
                archLinuxLTSFallback \
                vmlinuz-linux-lts
        ```
    '
    local kernel_parameter_file_path="${bl_globals_configuration_path}linux/kernel/${1}CommandLine"
    local kernel='vmlinuz-linux'
    if [[ "$2" ]]; then
        kernel="$2"
    fi
    if [[ -f "$kernel_parameter_file_path" ]]; then
        local command="sudo efibootmgr --verbose --create --disk /dev/sda --part 1 -l \"\\${kernel}\" --label \"$1\" --unicode \"$(cat "$kernel_parameter_file_path")\""
        echo "Create boot entry \"$1\" with command \"${command}\"."
        eval "$command"
    else
        echo "Error: file \"${kernel_parameter_file_path}\" doesn't exists."
    fi
    return $?
}
alias bl.filesystem.open_crypt_blockdevice=bl_filesystem_open_crypt_blockdevice
bl_filesystem_open_crypt_blockdevice() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
        Mounts encrypted blockdevices as analyseable blockdevice.

        ```bash
            bl.filesystem.open_crypt_blockdevice /dev/sdb test
        ```
    '
    sudo cryptsetup luksOpen "$1" "$2"
    return $?
}
alias bl.filesystem.overlay_location=bl_filesystem_overlay_location
bl_filesystem_overlay_location() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
        Mounts an overlay over given location. This could be useful if we have a
        read only system caused by physical reasons.

        ```bash
            bl.filesystem.overlay_location /usr/bin/
        ```
    '
    mkdir --parents /tmp/overlayfsDifferences
    mount --types overlayfs --options \
        lowerdir="$1",upperdir='/tmp/overlayDifferences' overlayfs "$1"
    return $?
}
alias bl.filesystem.repair=bl_filesystem_repair
bl_filesystem_repair() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
        Finds filesystem errors on linux based filesystem and repairs them.

        ```bash
            bl.filesystem.repair /dev/mmcblk0p2
        ```
    '
    local target=/dev/mmcblk0
    if [[ "$1" ]]; then
        target="$1"
    fi
    sudo badblocks "$target"
    sudo fsck -a "$target"
    return $?
}
alias bl.filesystem.set_maximum_user_watches=bl_filesystem_set_maximum_user_watches
bl_filesystem_set_maximum_user_watches() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
        Sets the maximum number of concurrent allowed file observations via
        inotify.

        ```bash
            bl.filesystem.set_maximum_user_watches 500000
        ```
    '
    echo "$1" | sudo tee /proc/sys/fs/inotify/max_user_watches
    return $?
}
alias bl.filesystem.write_blockdevice_to_image=bl_filesystem_write_blockdevice_to_image
bl_filesystem_write_blockdevice_to_image() {
    # shellcheck disable=SC1004,SC2016,SC2034
    local __documentation__='
        Writes a given backup from given blockdevice.

        ```bash
            bl.filesystem.write_blockdevice_to_image \
                /dev/mmcblk0 \
                /data/private/backup/image.img
        ```
    '
    local source=/dev/mmcblk0
    if [[ "$1" ]]; then
        source="$1"
    fi
    local target="${bl_globals_data_path}private/backup/backup-sd-card.img"
    if [[ "$2" ]]; then
        target="$2"
    fi
    sudo dd bs=4M if="$source" of="$target"
    return $?
}
alias bl.filesystem.write_image_to_blockdevice=bl_filesystem_write_image_to_blockdevice
bl_filesystem_write_image_to_blockdevice() {
    # shellcheck disable=SC1004,SC2016,SC2034
    local __documentation__='
        Writes a given image to given blockdevice.

        ```bash
            bl.filesystem.write_image_to_blockdevice \
                /data/private/backup/image.img \
                /dev/mmcblk0
        ```
    '
    # shellcheck disable=SC2125
    local source="${bl_globals_data_path}temp/image/"*.img
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
# endregion
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion
