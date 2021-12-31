#!/bin/bash
bwrap --dev-bind / / \
    --bind /opt/apps/com.tencent.weixin/license/etc/os-release /etc/os-release \
    --bind /opt/apps/com.tencent.weixin/license/etc/lsb-release /etc/lsb-release \
    --bind /opt/apps/com.tencent.weixin/license/usr/lib/license/ /usr/lib/license/ \
    --bind /opt/apps/com.tencent.weixin/license/var/uos/ /var/uos/ \
    --bind /opt/apps/com.tencent.weixin/license/var/lib/uos-license/ /var/lib/uos-license \
    /opt/apps/com.tencent.weixin/files/weixin/weixin $@
