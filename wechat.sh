#!/usr/bin/sh
bwrap --dev-bind / / \
--bind /etc/lsb-release-ukui /etc/lsb-release \
electron /usr/lib/wechat "$@"

