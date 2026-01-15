#!/bin/bash

CONFIG_FILE="/etc/mkinitcpio.conf"
HOOK_NAME="acpi_override"

# 检查是否以 root 运行
if [ "$EUID" -ne 0 ]; then
  echo "请使用 sudo 运行此脚本: sudo fa401km-fix-enable"
  exit 1
fi

echo "正在检查 mkinitcpio 配置..."

# 检查 HOOK 是否已经存在
if grep -q "$HOOK_NAME" "$CONFIG_FILE"; then
    echo "配置中已存在 $HOOK_NAME，跳过修改。"
else
    echo "正在将 $HOOK_NAME 添加到 HOOKS 列表..."
    # 备份配置文件
    cp "$CONFIG_FILE" "${CONFIG_FILE}.bak.$(date +%s)"
    echo "已备份配置文件到 ${CONFIG_FILE}.bak.$(date +%s)"

    # 使用 sed 在 modconf 之后或者 hook 列表开头添加 (这就比较通用了)
    # 这里我们采用一种简单的策略：把它加在 'base' 之前，或者如果找不到 base，就加在开头
    # 但根据 ACPI override 的特性，它只需存在即可，位置通常不敏感，但建议靠前。
    # 下面的 sed 命令会将 acpi_override 添加到 HOOKS=(... 括号内的第一个位置
    sed -i "s/^HOOKS=(\(.*\))/HOOKS=($HOOK_NAME \1)/" "$CONFIG_FILE"
    echo "配置修改完成。"
fi

echo "正在重建 initramfs (mkinitcpio -P)..."
mkinitcpio -P

echo "------------------------------------------------"
echo "修复完成！请重启电脑以生效。"
echo "启动时间应该会从 1分钟缩短到 15秒左右。"
echo "------------------------------------------------"