#!/bin/bash
# 雷神加速器 bwrap 沙箱启动器
# 读取 /etc/leigod/bwrap.conf(逐行, '#' 注释, 空白拆分), 拼接 bwrap 参数后执行。
# 本方案网络与主机共享: 沙箱内插件会以 root 直接修改主机路由表与 iptables 规则, 属预期行为。

CONF="${LEIGOD_BWRAP_CONF:-/etc/leigod/bwrap.conf}"
CMD=${1:-/home/deck/leigod/steamdeck_acc_monitor.sh}
if [ ! -r "$CONF" ]; then
    echo "error: $CONF not readable" >&2
    exit 1
fi
if [ ! -r /opt/leigod/fake_version ]; then
    echo "error: /opt/leigod/fake_version missing" >&2
    exit 1
fi

# bwrap.conf 中 "--ro-bind-data 10 /etc/version" 需要 fd 10 指向假 version 文件
exec 10< /opt/leigod/fake_version

# WebSocket 门前过滤(5588 -> 127.0.0.1:5589): 官方 web 进程收到未升级的普通 HTTP
# 会 SIGABRT 崩溃(WebSocket++ invalid state), sslh 只放行 "Upgrade: websocket"
# 连接, 其余就地关闭。启动失败则整个服务退出, 交由 systemd 重启并留下明确日志。
SSLH_CONF="${LEIGOD_SSLH_CONF:-/etc/leigod/sslh-guard.cfg}"
/usr/bin/sslh -f -F "$SSLH_CONF" &
sslh_pid=$!
sleep 0.3
if ! kill -0 "$sslh_pid" 2>/dev/null; then
    echo "error: sslh guard failed to start (config: $SSLH_CONF)" >&2
    exit 1
fi

args=()
while IFS= read -r line || [ -n "$line" ]; do
    line="${line%%#*}"                            # 去掉行内注释
    [ -z "${line//[[:space:]]/}" ] && continue    # 跳过空行
    read -r -a words <<< "$line"                  # 按空白拆分为多个参数
    args+=("${words[@]}")
done < "$CONF"

exec /usr/bin/bwrap "${args[@]}" -- "$CMD" "${@:2}"