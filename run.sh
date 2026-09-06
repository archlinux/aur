#!/bin/bash
# 雷神加速器 systemd 沙箱启动器
# 职责: 拉起 sslh 门前过滤(5588 -> 127.0.0.1:5589)与日志大小守护,
# 然后 exec 官方守护脚本。文件系统视图 / 能力 / 命名空间加固均由
# leigod.service 完成, 本脚本不做任何特权操作。
# 本方案网络与主机共享: 沙箱内插件会以 root 直接修改主机路由表与 iptables 规则, 属预期行为。

if [ $# -ge 1 ]; then
    CMD=$1
    shift
else
    CMD=/home/deck/leigod/steamdeck_acc_monitor.sh
fi

# 日志大小守护: 官方 daemon 纯追加不轮转, 单文件超 50 MiB 即清零。
# 后台运行, exec 后由沙箱 pid 1 收养, 随服务停止被一并清理(同下方 sslh)。
(
    LOG_DIR=/tmp/acc/log/
    while :; do
        for _lf in "$LOG_DIR"*.log; do
            [ -f "$_lf" ] || continue
            [ "$(wc -c < "$_lf")" -le 52428800 ] || : > "$_lf"
        done
        sleep 60
    done
) &

# WebSocket 门前过滤(5588 -> 127.0.0.1:5589): 只放行 WebSocket 升级连接,
# 裸 HTTP 就地关闭(官方 web 进程遇裸 HTTP 会崩溃, 见 TROUBLESHOOTING.md #1)。
# 启动失败则整个服务退出, 交由 systemd 重启并留下明确日志。
SSLH_CONF="${LEIGOD_SSLH_CONF:-/etc/leigod/sslh-guard.cfg}"
/usr/bin/sslh -f -F "$SSLH_CONF" &
sslh_pid=$!
sleep 0.3
if ! kill -0 "$sslh_pid" 2>/dev/null; then
    echo "error: sslh guard failed to start (config: $SSLH_CONF)" >&2
    exit 1
fi

exec "$CMD" "$@"
