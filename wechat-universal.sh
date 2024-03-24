#!/bin/bash

MOUNTS=(
	/etc/os-release=/usr/share/wechat-universal/etc/os-release
	/etc/lsb-release=/usr/share/wechat-universal/etc/lsb-release
	/usr/lib/license=/usr/share/wechat-universal/usr/lib/license
	/var=/usr/share/wechat-universal/var
)

coproc mounter {
	read -r session_pid || return $?
	exec 0<&-

	# mount as "root" via nsenter
	for mount in "${MOUNTS[@]}"; do # quit on error without writing to stdout
		nsenter -U -m --target $session_pid mount "${mount#*=}" "${mount%=*}" -o rbind || return $?
	done
	# signal that mounts are setup
	echo $?
}

exec {out}>>/dev/fd/${mounter[1]} {in}</dev/fd/${mounter[0]}

exec unshare --mount --user --map-user=$(id -u) --map-group=$(id -g) --map-users=auto --map-groups=auto --keep-caps --setgroups allow /bin/bash --noprofile --norc -c "echo \$\$ >&${out} && exec ${out}>&- || exit \$? ; read -u ${in} && exec ${in}<&- && \"\$@\" ; exit $?" unshare /opt/wechat-universal/wechat
exit $?
