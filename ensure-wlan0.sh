#!/bin/sh
# 幂等创建 dummy wlan0: 插件二进制按接口名读取设备身份
# (/sys/class/net/wlan0/address, 仅认 wlan0/eth0/br-lan/eth1 这类名字,
# 不认识 eno1/ens*/wlp*), 普通 PC 没有 wlan0 时必须补一个 dummy。
#
# 这个 MAC 同时是云侧识别本机的 SN, 绑定关系按 SN+账号维系, 因此它必须在整机
# 生命周期内保持不变: 默认取 machine-id 派生, 与物理网卡的数量/命名/MAC 随机化
# 均无关; 只有读不到 machine-id 时才退回克隆物理网卡。需要在换机后沿用同一身份
# (例如迁移已绑定的设备)时, 在 /etc/leigod/device.conf 里写
# DEVICE_MAC=xx:xx:xx:xx:xx:xx 手工固定。
derive_mac() {
    _want=""
    if [ -r /etc/leigod/device.conf ]; then
        _want=$(sed -n 's/^[[:space:]]*DEVICE_MAC[[:space:]]*=[[:space:]]*//p' /etc/leigod/device.conf | head -n1 | tr -d '[:space:]')
    fi
    case "$_want" in
        ""|auto) ;;
        *) printf '%s\n' "$_want"; return 0 ;;
    esac

    if [ -s /etc/machine-id ]; then
        _id=$(tr -d '[:space:]' < /etc/machine-id)
        if [ -n "$_id" ]; then
            printf '02:%s\n' "$(printf '%s' "$_id" | md5sum | cut -c1-10 | sed 's/\(..\)/&:/g;s/:$//')"
            return 0
        fi
    fi

    for iface in eno1 eno2 eno3 enp0s31f6 enp2s0 ens32 ens33 ens34 ens35 ens36 wlp0s20f3; do
        if [ -s "/sys/class/net/${iface}/address" ]; then
            printf '%s\n' "$(cat "/sys/class/net/${iface}/address")"
            return 0
        fi
    done

    printf '02:11:22:33:44:55\n'
}

WANT_MAC=$(derive_mac)
[ -n "$WANT_MAC" ] || exit 1

if ! ip link show wlan0 >/dev/null 2>&1; then
    ip link add wlan0 type dummy || exit 1
fi

# 以下整段只对 dummy 类型的 wlan0 生效: 宿主机自带真实 wlan0 时直接跳过,
# 物理网卡永远不会被改动。设备已存在但 MAC 与配置不符时一并纠正 —— 旧版本
# 克隆物理网卡 MAC, 升级后正是靠这里把身份收敛回去。
if ip -d link show wlan0 2>/dev/null | grep -qw dummy; then
    CUR_MAC=$(cat /sys/class/net/wlan0/address 2>/dev/null | tr 'A-Z' 'a-z')
    WANT_LOWER=$(printf '%s' "$WANT_MAC" | tr 'A-Z' 'a-z')
    if [ "$CUR_MAC" != "$WANT_LOWER" ]; then
        if ! ip link set wlan0 address "$WANT_MAC" 2>/dev/null; then
            ip link set wlan0 down || exit 1
            ip link set wlan0 address "$WANT_MAC" || exit 1
            ip link set wlan0 up || exit 1
        fi
        echo "leigod: wlan0 MAC ${CUR_MAC} -> ${WANT_MAC} (设备身份/SN 已变, 手机 App 需重新绑定)" >&2
    fi
    ip link set wlan0 up || exit 1

    # 设备 IP: getDeviceList 需要设备从 wlan0 取自身 IP, 把自己列为"可加速主机";
    # dummy 无 IP 会导致 devices 恒为空, App 侧无法选择游戏加速。
    # 行为由 /etc/leigod/device.conf 的 DEVICE_IP 控制(auto/具体IP/none)。
    DEVICE_IP="auto"
    if [ -r /etc/leigod/device.conf ]; then
        _v=$(sed -n 's/^[[:space:]]*DEVICE_IP[[:space:]]*=[[:space:]]*//p' /etc/leigod/device.conf | head -n1 | tr -d '[:space:]')
        [ -n "$_v" ] && DEVICE_IP="$_v"
    fi
    if [ "$DEVICE_IP" != "none" ]; then
        if [ "$DEVICE_IP" = "auto" ]; then
            DEVICE_IP=$(ip -4 route get 1.1.1.1 2>/dev/null | awk '{for(i=1;i<NF;i++) if($i=="src") print $(i+1)}' | head -n1)
        fi
        if [ -n "$DEVICE_IP" ] && ! ip -4 addr show dev wlan0 2>/dev/null | grep -qw "$DEVICE_IP"; then
            ip addr add "$DEVICE_IP/32" dev wlan0 || exit 1
        fi
    fi
fi
exit 0
