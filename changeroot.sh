#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# region header
# Copyright Torben Sickert (info["~at~"]torben.website) 16.12.2012

# License
# -------

# This library written by Torben Sickert stand under a creative commons naming
# 3.0 unported license. see http://creativecommons.org/licenses/by/3.0/deed.de
# endregion
# region importss
source "$(dirname "${BASH_SOURCE[0]}")/module.sh"
bl.module.import bashlink.logging
# endregion
# region variables
bl_changeroot_kernel_api_locations=(/proc /sys /sys/firmware/efi/efivars /dev \
    /dev/pts /dev/shm /run)
# TODO implement dependency check in import mechanism
bl_changeroot__dependencies__=(mountpoint mount umount mkdir)
bl_changeroot__optional_dependencies__=(fakeroot fakechroot)
# endregion
# region functions
bl_changeroot() {
    local __doc__='
    This function performs a linux change root if needed and provides all
    kernel api filesystems in target root by using a change root interface
    with minimal needed rights.

    #### Example:

    `changeroot /new_root /usr/bin/env bash some arguments`
    '
    if [[ "$1" == '/' ]]; then
        shift
        return $?
    else
        bl_changeroot_with_kernel_api "$@"
        return $?
    fi
    return $?
}
alias bl.changeroot=bl_changeroot
bl_changeroot_with_fake_fallback() {
    local __doc__='
    Perform the available change root program wich needs at least rights.

    #### Example:

    `bl_changeroot_with_fake_fallback /new_root /usr/bin/env bash some arguments`
    '
    if [[ "$UID" == '0' ]]; then
        chroot "$@"
        return $?
    fi
    fakeroot fakechroot chroot "$@"
    return $?
}
alias bl.changeroot.with_fake_fallback=bl_changeroot_with_fake_fallback
bl_changeroot_with_kernel_api() {
    local __doc__='
    Performs a change root by mounting needed host locations in change root
    environment.

    #### Example:

    `bl_changeroot_with_kernel_api /new_root /usr/bin/env bash some arguments`
    '
    local new_root_location="$1"
    if [[ ! "$new_root_location" =~ .*/$ ]]; then
        new_root_location+='/'
    fi
    local mountpoint_path
    for mountpoint_path in ${bl_changeroot_kernel_api_locations[*]}; do
        mountpoint_path="${mountpoint_path:1}"
        # TODO fix
        #./build-initramfs.sh -d -p ../../initramfs -s -t /mnt/old
        #mkdir: cannot create directory ‘/mnt/old/sys/firmware/efi’: No such file or directory
        #Traceback (most recent call first):
        #[0] /srv/openslx-ng/systemd-init/builder/dnbd3-rootfs/scripts/rebash/changeroot.sh:67: bl_changeroot_with_kernel_api
        #[1] /srv/openslx-ng/systemd-init/builder/dnbd3-rootfs/scripts/rebash/changeroot.sh:28: bl_changeroot
        #[2] ./build-initramfs.sh:532: main
        #[3] ./build-initramfs.sh:625: main
        if [ ! -e "${new_root_location}${mountpoint_path}" ]; then
            mkdir --parents "${new_root_location}${mountpoint_path}"
            # TODO remember created dirs.
        fi
        if ! mountpoint -q "${new_root_location}${mountpoint_path}"; then
            if [ "$mountpoint_path" == 'proc' ]; then
                mount "/${mountpoint_path}" \
                    "${new_root_location}${mountpoint_path}" --types \
                    "$mountpoint_path" --options nosuid,noexec,nodev
            elif [ "$mountpoint_path" == 'sys' ]; then
                mount "/${mountpoint_path}" \
                    "${new_root_location}${mountpoint_path}" --types sysfs \
                    --options nosuid,noexec,nodev
            elif [ "$mountpoint_path" == 'dev' ]; then
                mount udev "${new_root_location}${mountpoint_path}" --types \
                    devtmpfs --options mode=0755,nosuid
            elif [ "$mountpoint_path" == 'dev/pts' ]; then
                mount devpts "${new_root_location}${mountpoint_path}" \
                    --types devpts --options mode=0620,gid=5,nosuid,noexec
            elif [ "$mountpoint_path" == 'dev/shm' ]; then
                mount shm "${new_root_location}${mountpoint_path}" --types \
                    tmpfs --options mode=1777,nosuid,nodev
            elif [ "$mountpoint_path" == 'run' ]; then
                mount "/${mountpoint_path}" \
                    "${new_root_location}${mountpoint_path}" --types tmpfs \
                    --options nosuid,nodev,mode=0755
            elif [ "$mountpoint_path" == 'tmp' ]; then
                mount run "${new_root_location}${mountpoint_path}" --types \
                    tmpfs --options mode=1777,strictatime,nodev,nosuid
            elif [ -f "/${mountpoint_path}" ]; then
                mount "/${mountpoint_path}" \
                    "${new_root_location}${mountpoint_path}" --bind
            else
                bl.logging.warn \
                    "Mountpoint \"/${mountpoint_path}\" couldn't be handled."
            fi
        fi
    done
    bl_changeroot_with_fake_fallback "$@"
    local return_code=$?
    # Reverse mountpoint list to unmount them in reverse order.
    local reverse_kernel_api_locations
    for mountpoint_path in ${reverse_kernel_api_locations[*]}; do
        reverse_kernel_api_locations="$mountpoint_path ${reverse_kernel_api_locations[*]}"
    done
    for mountpoint_path in ${reverse_kernel_api_locations[*]}; do
        mountpoint_path="${mountpoint_path:1}" && \
        if mountpoint -q "${new_root_location}${mountpoint_path}" || \
            [ -f "/${mountpoint_path}" ]
        then
            # If unmounting doesn't work try to unmount in lazy mode (when
            # mountpoints are not needed anymore).
            if ! umount "${new_root_location}${mountpoint_path}"; then
                bl.logging.warn "Unmounting \"${new_root_location}${mountpoint_path}\" fails so unmount it in force mode."
                if ! umount -f "${new_root_location}${mountpoint_path}"; then
                    bl.logging.warn "Unmounting \"${new_root_location}${mountpoint_path}\" in force mode fails so unmount it if mountpoint isn't busy anymore."
                    umount -l "${new_root_location}${mountpoint_path}"
                fi
            fi
            # NOTE: "return_code" remains with an error code if there was
            # given one in all iterations.
            [[ $? != 0 ]] && return_code=$?
        else
            bl.logging.warn \
                "Location \"${new_root_location}${mountpoint_path}\" should be a mountpoint but isn't."
        fi
    done
    return $return_code
}
alias bl.changeroot.with_kernel_api=bl_changeroot_with_kernel_api
# endregion
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion
