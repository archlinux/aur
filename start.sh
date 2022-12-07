#!/bin/bash

CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"
QQ_APP_DIR="${CONFIG_DIR}/QQ"
DOWNLOAD_DIR="$(xdg-user-dir DOWNLOAD)"
if [ "$DOWNLOAD_DIR" == "$HOME" ]; then DOWNLOAD_DIR="$HOME/Downloads"; fi

cd /opt/QQ

bwrap --new-session --die-with-parent --cap-drop ALL --unshare-user-try --unshare-pid --unshare-cgroup-try \
    --dev-bind / / \
    --proc /proc \
    --tmpfs "$HOME" \
    --bind "$HOME/.pki" "$HOME/.pki" \
    --ro-bind "$HOME/.Xauthority" "$HOME/.Xauthority" \
    --bind "${DOWNLOAD_DIR}" "${DOWNLOAD_DIR}" \
    --bind "$QQ_APP_DIR" "$QQ_APP_DIR" \
    /opt/QQ/qq "$@"

# 移除无用崩溃报告和日志
# 如果需要向腾讯反馈 bug，请注释掉如下两行
rm -rf "$QQ_APP_DIR/crash_files"
rm -rf  "$QQ_APP_DIR/nt_qq_"**"/nt_data/log/"*
