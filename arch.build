#!/bin/bash

set -e

arch=$1
shift
repo=$@

case $arch in
	x86_64) cpu=qemu64 ;;
	i686) cpu=qemu32 ;;
	*) exit 1 ;;
esac

img=/var/lib/buildstuff/$arch.img
vport=$((32768+$RANDOM))
vhost="
	-o ConnectTimeout=5
	-o StrictHostKeyChecking=no
	-o UserKnownHostsFile=/dev/null
	-o Port=$vport user@localhost
"

start_vm() {
	local kvm
	pacman -Qoq qemu-system-x86_64 | grep -q kvm || kvm='-machine accel=kvm:tcg'
	qemu-system-x86_64 \
		-smp 2 -m 768 -cpu $cpu $kvm \
		-device virtio-net,netdev=vlan \
		-netdev user,id=vlan,hostfwd=::$vport-:22 \
		-drive file=$1,cache=none,aio=native \
		-display none &
	while sleep 3; do ssh $vhost true && break; done
}

stop_vm() {
	ssh $vhost 'sudo poweroff' ||
	pkill -f $vport ||
	true
	wait
}

trap_err() {
	trap - ERR
	trap - INT
	cat <<EOF

Please investigate the error that occured via \`ssh -p $vport user@localhost\`;
when you are ready, you may press enter to stop the virtual machine.
EOF
	read x
	stop_vm
	sudo sh cleanup.$vport ||
	echo "Run: \`cd `pwd`; sudo sh cleanup.$vport\`"
}
trap trap_err ERR
trap trap_err INT
set -E


[[ -e $img ]] || {
	sudo arch.install $arch $img
	sudo chown "$USER" $img
}

(( $(stat -c%Y $img) < $(date +%s) - 86400 )) && {
	start_vm $img
	ssh $vhost 'sudo pacman --noconfirm -Syu'
	ssh $vhost 'sudo pacman --noconfirm -Su'
	stop_vm
}

dd if=/dev/zero count=0 bs=4K seek=1M of=/tmp/$vport
loopn=$(sudo losetup -f --show /tmp/$vport)
loopr=$(sudo losetup -f --show $img)
echo "dmsetup remove $vport && losetup -d $loopn $loopr && rm /tmp/$vport cleanup.$vport" > cleanup.$vport
sudo dmsetup create $vport --table "0 $(sudo blockdev --getsize $loopr) snapshot $loopr $loopn N 1"
sudo chown "$USER" /dev/mapper/$vport

start_vm /dev/mapper/$vport
for r in $repo; do
	echo "sudo sed '/\[core\]/i [$r]\nInclude = /etc/pacman.d/mirrorlist\n' -i /etc/pacman.conf"
done | ssh $vhost
ssh $vhost 'sudo pacman --noconfirm -Syu'
ssh $vhost 'sudo pacman --noconfirm -Su'
sftp $vhost <<<'mkdir build'
sftp $vhost <<<'put * build'
sftp $vhost <<<"put $HOME/.makepkg.conf"
ssh $vhost 'cd build; makepkg --log --noconfirm --syncdeps'
sftp $vhost <<<'get build/*.pkg.tar.xz'
sftp $vhost <<<'get build/*.log'
stop_vm
sudo sh cleanup.$vport
