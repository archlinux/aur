#!/bin/sh

run_hook() {
  echo "GrowRootFS: starting"

  # if a file indicates we should do nothing, then just exit
  for f in /var/lib/cloud/instance/root-grown /etc/growroot-disabled \
      /etc/growroot-grown; do
    [ -f "${rootmnt}$f" ] && echo "GrowRootFS: disabled by file" && return 0
  done

  # figure out what disk '$root' is on
  { [ ! -L "${root}" ] && rootdev=${root} || rootdev=$(readlink -f "${root}") ; } || { echo "failed to get target of link for ${root}" && return 0 ; }

  case "${rootdev}" in
    *[0-9]) : ;;
    # the root is a disk, not a partition (does not end in a digit)
    # no need to do anything in this case, kernel already knows the full size.
    *) echo "GrowRootFS: ${rootdev} is a disk, not a partition, no action" && return 0 ;;
  esac

  # remove all consective numbers from the end of rootdev to get 'rootdisk'
  rootdisk=${rootdev}
  while [ "${rootdisk%[0-9]}" != "${rootdisk}" ]; do
    rootdisk=${rootdisk%[0-9]};
  done
  partnum=${rootdev#${rootdisk}}

  # if the basename of the root device (ie 'xvda1' or 'sda1') exists
  # in /sys/block/ then it is a block device, not a partition
  # (xen xvda1 is an example of such a funny named block device)
  [ -e "/sys/block/${rootdev##*/}" ] && echo "GrowRootFS: ${rootdev} is a block device" && return 0

  # if growpart fails, exit.
  # we capture stderr because on success of dry-run, it writes
  # to stderr what it would do.
  out=$(growpart --dry-run "${rootdisk}" "${partnum}" 2>&1) || { echo "GrowRootFS: ${out}" && return 1; }

  # if growpart would change something, --dry-run will write something like
  #  CHANGE: partition=1 start=2048 old: size=1024000 end=1026048 new: size=2089192,end=2091240
  # anything else, exit
  case "${out}" in
    CHANGE:*) :;;
    *) echo "GrowRootFS: ${out}" && return 0;;
  esac

  ## Wait for any of the initial udev events to finish
  ## This is to avoid any other processes using the block device that the
  ## root partition is on, which would cause the sfdisk 'BLKRRPART' to fail.
  udevadm settle --timeout ${rootdelay:-30} || { echo "GrowRootFS: WARNING: udevadm settle prior to growpart failed" && return 1 ; }

  if out=$(growpart "${rootdisk}" "${partnum}" 2>&1); then
    case "$out" in
      CHANGED:*) echo "GrowRootFS: $out";;
      NOCHANGE:*)
        echo "GrowRootFS: WARNING: expected to grow partition, but did not";;
      *) echo "GrowRootFS: unexpected output: ${out}"
    esac
  else
    echo "GrowRootFS: WARNING: resize failed: $out"
  fi

  ## Wait for the partition re-read events to complete
  ## so that the root partition is available when we try and mount it.
  udevadm settle --timeout ${rootdelay:-30}

  # Need to figure out the rootfs type somehow
  # For now we only support ext2/3/4
  fsck -f ${rootdev}
  resize2fs -p ${rootdev}

  ## write to /etc/grownroot-grown. most likely this wont work (readonly)
  { date --utc > "${rootmnt}/etc/growroot-grown" ; } >/dev/null 2>&1 || :

  echo "GrowRootFS: done"
  sleep 1

}
