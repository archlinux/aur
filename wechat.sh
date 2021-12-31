#!/usr/bin/sh
bwrap --dev-bind / / \
    --bind /usr/share/wechat/etc/os-release /etc/os-release \
    --bind /usr/share/wechat/etc/lsb-release /etc/lsb-release \
    --bind /usr/lib/wechat/license/ /usr/lib/license/ \
    --bind /usr/share/wechat/var/ /var/ \
    electron /usr/lib/wechat "$@"
