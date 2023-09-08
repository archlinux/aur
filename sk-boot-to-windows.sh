#!/bin/bash
systemctl reboot --boot-loader-entry=auto-windows

# 获取上一个命令的退出状态码
exit_status=$?

# 检查退出状态码是否为0（正常）
if [ $exit_status -ne 0 ]; then
    # 如果不正常，执行下一层逻辑
    echo "命令执行不正常，状态码: $exit_status"
    
    # 使用 efibootmgr 列出当前的 EFI 启动项，并将输出保存到变量 boot_list 中
    boot_list=$(efibootmgr)

    # 使用 grep 命令查找包含 "Windows Boot Manager" 的启动项行，并提取其编号
    boot_entry=$(echo "$boot_list" | grep -i "Windows Boot Manager" | awk '{print $1}')

    # 去掉启动项编号中的前缀 "Boot" 和后面的星号 "*"，只保留编号部分
    boot_entry=${boot_entry#Boot}
    boot_entry=${boot_entry%\*}
    echo "找到的 'Windows Boot Manager' 启动项编号为: $boot_entry"

    # 检查是否找到了 "Windows Boot Manager" 启动项
    if [ -n "$boot_entry" ]; then
        # 找到了，使用 efibootmgr 将其设置为下一次启动项
        sudo efibootmgr -n "$boot_entry"
        echo "已将 'Windows Boot Manager' 设置为下一次启动项。"
        # 在这里添加重启系统的命令，例如 sudo reboot
        sudo reboot
    else
        # 没找到，报错并退出
        echo "找不到 'Windows Boot Manager' 启动项。无法设置下一次启动项。"
        exit 1
    fi
fi
