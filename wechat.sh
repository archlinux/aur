#!/usr/bin/sh
bwrap --dev-bind / / \
    --bind /usr/share/wechat-uos/etc/os-release /etc/os-release \
    --bind /usr/share/wechat-uos/etc/lsb-release /etc/lsb-release \
    --bind /usr/lib/wechat-uos/license/ /usr/lib/license/ \
    --bind /usr/share/wechat-uos/var/ /var/ \
    electron /usr/lib/wechat-uos "$@"
