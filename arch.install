#!/bin/bash

set -e

(( ! $UID ))

arch=${1-x86_64}
img=${2-arch.img}

(( $(</sys/module/loop/parameters/max_part) )) || {
	modprobe -r loop || true
	modprobe loop max_part=9 max_loop=9
}

[[ -e ${img} ]] || dd if=/dev/zero count=0 bs=4K seek=8M of="${img}"
sda=$(losetup -f --show "${img}")

sfdisk -u M ${sda} <<\EOF
,8192
,64
,8192
,
EOF

mkswap ${sda}p1
mke2fs -q ${sda}p2
jfs_mkfs -q ${sda}p3
jfs_mkfs -q ${sda}p4

install -d "${img}.mnt"
mount ${sda}p3 "${img}.mnt"
pushd "${img}.mnt"

install -d boot home dev proc sys tmp
mount ${sda}p2 boot
mount ${sda}p4 home
mount -o bind /dev dev
mount -t proc proc proc
mount -t sysfs sys sys
mount -t tmpfs tmp tmp

install -d var/lib/pacman
setarch "${arch}" pacman --config /usr/share/buildstuff/pacman.conf --root . \
	--noconfirm -Sy base base-devel openssh sudo syslinux

find /usr/share/buildstuff/guest/ -type f |
while read i; do install -Dm644 "${i}" "${i##*/guest/}"; done

install -Dm644 /etc/pacman.d/mirrorlist etc/pacman.d/mirrorlist
install -d home/user/.ssh; cat ~/.ssh/id_*.pub > home/user/.ssh/authorized_keys
sed -i etc/pacman.d/mirrorlist -e '1i Server = http://10.0.2.2/proxy.cgi/$repo/os/$arch/'

setarch "${arch}" chroot . bash -c '
	mkinitcpio -S autodetect -k /boot/vmlinuz-linux -g /boot/initramfs-linux.img
	syslinux-install_update -i -a -m
	systemctl enable multi-user.target
	systemctl enable {dhcpcd,sshd}.service

	useradd -p 00as1wm0AZG56 -d /home/user user
	chown -R user:users /home/user
	passwd -l root

	sed "s/--quiet --lsign-key/--batch --yes --quiet --lsign-key/" -i /usr/bin/pacman-key
	pacman-key --init
	pacman-key --populate archlinux
	sed "s/--batch --yes//" -i /usr/bin/pacman-key
'

umount dev
umount proc
umount sys
umount tmp
umount home
umount boot
popd
umount "${img}.mnt"
rmdir "${img}.mnt"

losetup -d ${sda}
