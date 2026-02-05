#!/bin/bash

bluetooth-voice-box-auto-connect() {
    sleep 10

    local MAC=$(bluetoothctl devices | cut -d ' ' -f 2)

    for dev in $MAC; do
        echo $dev
        if bluetoothctl info "$dev" | grep -qiE "Class: 0x00(24|2c)04(04|14|1c)"; then # 常见的音箱/耳机类 ID
            if ! bluetoothctl info "$dev" | grep -q "Connected: yes"; then
                echo "尝试连接设备: $dev"
                bluetoothctl connect "$dev"
                return
            fi
        fi
    done
    echo "未发现待连接的已知音箱。"
}

bluetooth-voice-box-auto-connect
