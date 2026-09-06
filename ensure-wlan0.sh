#!/bin/sh
# 幂等创建 dummy wlan0: 插件二进制按接口名读取设备身份
# (/sys/class/net/wlan0/address, 仅认 wlan0/eth0/br-lan/eth1 这类名字,
# 不认识 eno1/ens*/wlp*), 普通 PC 没有 wlan0 时必须补一个 dummy。
# MAC 优先克隆物理网卡; 取不到则用 machine-id 派生固定 MAC。
if ! ip link show wlan0 >/dev/null 2>&1; then
    REAL_MAC=""
    for iface in eno1 eno2 eno3 enp0s31f6 enp2s0 ens32 ens33 ens34 ens35 ens36 wlp0s20f3; do
        if [ -f "/sys/class/net/${iface}/address" ]; then
            REAL_MAC=$(cat "/sys/class/net/${iface}/address" 2>/dev/null)
            [ -n "$REAL_MAC" ] && break
        fi
    done
    if [ -z "$REAL_MAC" ]; then
        if [ -r /etc/machine-id ]; then
            REAL_MAC="02:$(md5sum /etc/machine-id | cut -c1-10 | sed 's/\(..\)/&:/g;s/:$//')"
        fi
        [ -z "$REAL_MAC" ] && REAL_MAC="02:11:22:33:44:55"
    fi

    ip link add wlan0 type dummy || exit 1
    ip link set wlan0 address "$REAL_MAC" || exit 1
    ip link set wlan0 up || exit 1
fi

# 设备 IP: getDeviceList 需要设备从 wlan0 取自身 IP, 把自己列为"可加速主机";
# dummy 无 IP 会导致 devices 恒为空, App 侧无法选择游戏加速。
# 行为由 /etc/leigod/device.conf 的 DEVICE_IP 控制(auto/具体IP/none),
# 且仅对 dummy 类型的 wlan0 生效 —— 真实物理网卡永不触碰。
DEVICE_IP="auto"
if [ -r /etc/leigod/device.conf ]; then
    _v=$(sed -n 's/^[[:space:]]*DEVICE_IP[[:space:]]*=[[:space:]]*//p' /etc/leigod/device.conf | head -n1 | tr -d '[:space:]')
    [ -n "$_v" ] && DEVICE_IP="$_v"
fi
if [ "$DEVICE_IP" != "none" ] && ip -d link show wlan0 2>/dev/null | grep -qw dummy; then
    if [ "$DEVICE_IP" = "auto" ]; then
        DEVICE_IP=$(ip -4 route get 1.1.1.1 2>/dev/null | awk '{for(i=1;i<NF;i++) if($i=="src") print $(i+1)}' | head -n1)
    fi
    if [ -n "$DEVICE_IP" ] && ! ip -4 addr show dev wlan0 2>/dev/null | grep -qw "$DEVICE_IP"; then
        ip addr add "$DEVICE_IP/32" dev wlan0 || exit 1
    fi
fi
exit 0
