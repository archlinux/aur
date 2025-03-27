#!/usr/bin/bash

export launchTarget="/opt/bytedance/lark/bytedance-lark"
if [ ${XDG_SESSION_TYPE} = "wayland" ]; then
    export launchTarget="${launchTarget} --ozone-platform-hint=auto --enable-features=UseOzonePlatform --enable-wayland-ime --gtk-version=4"
    export waylandOnly=${waylandOnly:-"true"}
fi

export _portableConfig="/usr/lib/larksuite-portable/portable-config"

portable $@
