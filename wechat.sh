#!/usr/bin/sh
wechat_pid=`pidof wechat-uos`
if test  $wechat_pid ;then
    kill -9 $wechat_pid
fi
bwrap --dev-bind / / \
    --bind /usr/share/wechat-uos/etc/os-release /etc/os-release \
    --bind /usr/share/wechat-uos/etc/lsb-release /etc/lsb-release \
    --bind /usr/lib/wechat-uos/license/ /usr/lib/license/ \
    --bind /usr/share/wechat-uos/var/ /var/ \
    __ELECTRON__ /usr/lib/wechat-uos "$@"
