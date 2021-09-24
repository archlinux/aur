#!/bin/bash

# Creates two disk images using the currently installed kernel:
# - pre-boot authentication (PBA) environment running the "linuxpba" binary
# - rescue image containing "sedutil-cli" and the PBA image

[ "$(id -u)" -ne 0 ] && { echo 'Root privileges required, exiting'; exit 1; }

# Image size. Min MBR Table Size is 128M as per specification
IMGSIZE=64M
# Partition label
PARTLABEL=SEDUTIL
# Kernel image
KERNEL=$(find /usr/lib/modules -type f -name vmlinuz -print -quit)
# Required packages
DEPENDS=(gptfdisk syslinux)

check() {
  for pkg in "${DEPENDS[@]}"; do
    [ $(pacman -Qsq "^${pkg}$") ] || { echo "Missing package, install: ${DEPENDS[@]}"; exit 1; }
  done
}

cleanup() {
  buildtype="$1"
  loopdev="$2"

  umount -q mnt-"$buildtype"
  losetup -d "$loopdev"
  rmdir mnt-"$buildtype"
}

package() {
  local buildtype="$1"
  local img=${buildtype}.img

  # generate initramfs
  mkinitcpio -c /usr/share/sedutil/mkinitcpio-"${buildtype}".conf -g initramfs-"${buildtype}".img >/dev/null
  # create a GPT image with an EFI system partition
  truncate -s $IMGSIZE "$img"
  sgdisk -n 0:0:0 -t 0:ef00 "$img" >/dev/null
  # format and mount the image
  local loopdev=$(losetup -f --show -P "$img") || { exit 1; }
  mkfs.vfat -n $PARTLABEL "${loopdev}p1" >/dev/null
  mkdir mnt-"${buildtype}"
  mount "${loopdev}"p1 mnt-"${buildtype}" || { cleanup "$buildtype" "$loopdev"; exit 1; }
  # copy bootloader
  install -D /usr/lib/syslinux/efi64/syslinux.efi           mnt-"${buildtype}"/efi/boot/bootx64.efi
  install -D /usr/lib/syslinux/efi64/ldlinux.e64         -t mnt-"${buildtype}"/efi/boot/
  install -D /usr/share/sedutil/syslinux-"${buildtype}".cfg mnt-"${buildtype}"/syslinux.cfg
  # copy Linux image and initramfs
  [ -f $KERNEL ] || { echo 'could not find kernel'; cleanup "$buildtype" "$loopdev"; exit 1; }
  install -D "$KERNEL"                       mnt-"${buildtype}"/vmlinuz-linux
  install -D initramfs-"${buildtype}".img -t mnt-"${buildtype}"/
  [ "$buildtype" = "pba" ] && export SEDUTIL_PBA_IMG=$(realpath "$img")
  # clean up
  cleanup "$buildtype" "$loopdev"
}

echo '==> Checking requirements'
check
pkgdir=$(mktemp -d)
mkdir -p "$pkgdir"; chmod 755 "$pkgdir"; cd "$pkgdir"
echo '==> Creating pre-boot authentication image'
package pba
echo '==> Creating rescue image'
package rescue

cat << EOF
==> Result
PBA image   : $pkgdir/pba.img
Rescue image: $pkgdir/rescue.img
EOF
