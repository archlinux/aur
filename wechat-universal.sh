#!/bin/sh

MOUNT_CMDS=(
	mount --bind $HOME /root '&&'
	# license fixups in various places
	mount --rbind {/usr/share/wechat-universal,}/var '&&'
	mount --bind {/usr/share/wechat-universal,}/usr/lib/license '&&'
	mount --bind {/usr/share/wechat-universal,}/etc/os-release '&&'
	mount --bind {/usr/share/wechat-universal,}/etc/lsb-release
)

echo "${MOUNT_CMDS[*]}"

export QT_QPA_PLATFORM=xcb

exec unshare -r --mount sh -c "${MOUNT_CMDS[*]} && exec /opt/wechat-universal/wechat" "$@"
