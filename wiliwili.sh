#!/bin/bash

function launch() {
	bwrap --die-with-parent \
	--ro-bind /opt /opt \
	--ro-bind /etc /etc \
	--symlink usr/lib /lib \
	--symlink usr/lib64 /lib64 \
	--symlink usr/bin /bin \
	--symlink usr/bin /sbin \
	--bind /usr /usr \
	--bind /run /run \
	--bind /var /var \
	--dev /dev \
	--dev-bind /dev/dri /dev/dri \
	--dev-bind /dev/shm /dev/shm \
	--dev-bind /dev/input /dev/input \
	--bind /proc /proc \
	--ro-bind /sys/dev/char /sys/dev/char \
	--ro-bind /sys/devices /sys/devices \
	--bind "$XDG_RUNTIME_DIR" "$XDG_RUNTIME_DIR" \
	--bind "$HOME" "$HOME" \
	--bind "$XDG_RUNTIME_DIR" "$XDG_RUNTIME_DIR" \
	/usr/bin/env -u DISPLAY wiliwili "$@"
}

function launchV2() {
	bwrap \
		--dev-bind / / \
		--dev /dev \
		--dev-bind /dev/dri /dev/dri \
		--dev-bind /dev/shm /dev/shm \
		--dev-bind /dev/input /dev/input \
		/usr/bin/env -u DISPLAY wiliwili "$@"
}

launchV2 $@
