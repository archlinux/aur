#!/bin/sh

set -xve

ln -sfr /usr/lib/larksuite-portable/larksuite.sh /usr/bin/lark
ln -sfr /usr/lib/larksuite-portable/larksuite.sh /usr/bin/bytedance-lark-stable
ln -sfr /dev/null /usr/share/applications/lark.desktop
sed -i 's#command="/opt/bytedance/lark/lark"#command="/usr/bin/lark"#' /usr/share/menu/lark.menu
