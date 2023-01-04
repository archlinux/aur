#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
if [[ "${TRACE-0}" == "1" ]]; then
    set -o xtrace
fi

if [ "$EUID" -eq 0 ]
  then echo "请用普通用户执行"
  exit
fi

cd "$(dirname "$0")"

PKG_DIR="/opt/cn.com.10jqka"
CONFIG_DIR="$HOME/.config/cn.com.10jqka"

main() {
    if [ -d "$CONFIG_DIR/users" ]; then
        echo "配置 $CONFIG_DIR 已经存在?"
        exit
    fi
    mkdir -p "$CONFIG_DIR/users"
    touch "$CONFIG_DIR/B8D8.dat"
    sudo ln -s "$CONFIG_DIR/B8D8.dat" "$PKG_DIR/files/B8D8.dat"
    sudo ln -s "$CONFIG_DIR/users" "$PKG_DIR/files/users"
    local all_files
    all_files=$(ls "$PKG_DIR/files/" | grep "\.xml")
    for file in $all_files; do
        echo "copy $file to $CONFIG_DIR/$file ..."
        cp "$PKG_DIR/files/$file" "$CONFIG_DIR/$file"
        sudo ln -s -f "$CONFIG_DIR/$file" "$PKG_DIR/files/$file"
    done
}

main "$@"
