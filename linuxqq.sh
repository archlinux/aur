#!/bin/bash

if [ -d ~/.config/QQ/versions ]; then
	find ~/.config/QQ/versions -name sharp-lib -type d -exec rm -r {} \; 2>/dev/null
	find ~/.config/QQ/versions -name libssh2.so.1 -type f -exec rm {} \; 2>/dev/null
fi

rm -rf ~/.config/QQ/crash_files/*

#XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

/opt/QQ/qq "$@" --disable-setuid-sandbox --gtk-version=3 --ozone-platform-hint=auto --enable-zero-copy --enable-features=VaapiVideoDecodeLinuxGL,VaapiVideoDecoder,WebRTCPipeWireCapturer --wayland-text-input-version=3 --enable-wayland-ime --no-suid-sandbox