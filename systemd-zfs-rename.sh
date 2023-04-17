#!/usr/bin/env sh
set -eux

LOG_FILE="/systemd-zfs-rename.log"

exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>${LOG_FILE} 2>&1

get_cmdline_value() {
    local key="$1"
    local value
    value="$(cat /proc/cmdline | sed -e 's/ /\n/g' | grep "^${key}=" | cut -d= -f2)"
    echo -n "${value}"
}

# Example: ZPOOL_NAME=zpool
ZPOOL_NAME="$(get_cmdline_value rpool)"
if [ -z "${ZPOOL_NAME}" ]; then
    echo 'No "rpool=" found in kernel arguments, should have been equal to the zfs pool'
    exit 1
fi

FS_SUFFIX_NEXT_BOOT="_next_boot"
FS_SUFFIX_OLD_BOOT="_old_boot"

# Example: ZPOOL_BOOTFS=zpool/ROOT/Distro_next_boot
ZPOOL_BOOTFS="$(zpool get -H bootfs "${ZPOOL_NAME}" | awk '{printf("%s", $3)}')"

# Currently GRUB_BOOT_IMAGE is not used but should be the same as ZPOOL_BOOTFS,
# it is a not guarantee
# Example: _GRUB_BOOT_IMAGE=zpool/ROOT/Distro_next_boot
_GRUB_BOOT_IMAGE="$(get_cmdline_value BOOT_IMAGE)"
GRUB_BOOT_IMAGE="${ZPOOL_NAME}${_GRUB_BOOT_IMAGE%@*}"

# Example: ZFS_BOOT=zpool/ROOT/Distro
# Example: ZFS_BOOT_OLD=zpool/ROOT/Distro_old_boot
ZFS_BOOT="${ZPOOL_BOOTFS%${FS_SUFFIX_NEXT_BOOT}}"
ZFS_BOOT_OLD="${ZFS_BOOT}${FS_SUFFIX_OLD_BOOT}"

# Example: ZPOOL_BOOTFS=zpool/ROOT/Distro_next_boot and end with FS_SUFFIX_NEXT_BOOT=_next_boot
if [[ "${ZPOOL_BOOTFS}" =~ ${FS_SUFFIX_NEXT_BOOT}$ ]]; then
    # Example: If ZFS_BOOT=zpool/ROOT/Distro exists then it is rename to ZFS_BOOT_OLD=zpool/ROOT/Distro_old_boot
    if zfs list -Ho name "${ZFS_BOOT}" > /dev/null 2&>1; then
        zfs rename "${ZFS_BOOT}" "${ZFS_BOOT_OLD}"
    fi

    # Example: If ZPOOL_BOOTFS=zpool/ROOT/Distro_next_boot exists then it is rename to ZFS_BOOT=zpool/ROOT/Distro
    zfs rename "${ZPOOL_BOOTFS}" "${ZFS_BOOT}"

    # Example: The filesystem ZFS_BOOT=zpool/ROOT/Distro was cloned of ZFS_BOOT_OLD=zpool/ROOT/Distro_old_boot
    #          and should therefore be promoted
    if zfs list -Ho origin "${ZFS_BOOT}" | grep "^${ZFS_BOOT_OLD}@" > /dev/null 2&>1; then
        zfs promote "${ZFS_BOOT}"
    fi
fi
