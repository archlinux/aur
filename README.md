# leigod-steamdeck-plugin

雷神加速器(Leigod)官方 **SteamDeck 插件**在普通 x86_64 Linux(打包时面向
Arch,其他发行版可参照)上的移植:将闭源官方二进制置于 systemd 加固伪造的
SteamDeck 文件系统/进程视图中运行,手机雷神 App 经云端发现、绑定并下发加速。

与 [Husky0c/leigod-plugin-linux](https://github.com/Husky0c/leigod-plugin-linux)
同思路:用只读覆盖伪造 SteamDeck 环境(product_name/os-release)的做法即借鉴自
该项目(其用 systemd `BindReadOnlyPaths` 实现)。本包在此基础上把文件系统视图
收窄为构造式白名单,并叠加 **sslh 门前过滤**,修复了其
[issue #5](https://github.com/Husky0c/leigod-plugin-linux/issues/5) 所述的
web 进程崩溃问题。加固全部落在 **`leigod.service`** 单元内:私有 pid 命名空间
+ 构造式路径视图 + 能力收敛,由 systemd 在 exec 前完成挂载——进程本身只持有
`CAP_NET_ADMIN`+`CAP_NET_RAW`。

## 运行架构

```
手机 App ──LAN──> :5588 sslh(门前过滤,只放行 WebSocket 升级)
                        └──> 127.0.0.1:5589 acc-gw web 进程(命令/查询 API)
acc-gw daemon ──fork──> acc-gw web / acc-gw acc(加速工作进程, 建 tun_PC)
acc-gw acc ──> tun_PC(10.20.0.0/16)+ iptables/ipset 分流 ──> s5 隧道 ──> 加速节点
acc-gw worker ──UDP keepalive──> route-turn.xxghh.biz:5588(云端在线)
```

| 端口/对象 | 用途 |
|---|---|
| 0.0.0.0:5588 | sslh 门前过滤(WebSocket-only,见下文问题 #1) |
| 127.0.0.1:5589 | 插件 web 进程(构建时 sed 后移,只接受 sslh 转发) |
| udp 6066 | 设备 LAN 发现服务(App 广播探测) |
| tcp 10001 | web 进程实时调试台(`set_log_level debug/info/warning/error`) |
| tun_PC | 加速 TUN 设备(10.20.0.1/16),仅加速会话期间存在 |
| wlan0 (dummy) | 设备身份(MAC 即 SN),由 `ensure-wlan0.sh` 幂等创建 |

## 安装与使用

```bash
makepkg -si                      # 或 paru -U <构建出的包>
sudo systemctl enable --now leigod
```

手机绑定(**手机须与电脑在同一局域网**):雷神加速器 App → **硬件加速** → 选择
**SteamDeck** → **一路点到底部完成绑定**(不需要按 App 提示在电脑上执行任何命令)。
绑定后即可选游戏加速。

**绑定是持久的**:token 存于 `/opt/leigod/config/accelerator.ini`(磁盘),
设备身份(SN)由 `machine-id` 派生、重启不变,云侧按 SN+账号维系——电脑重启后
无需重新绑定。升级/重装本包时,install 钩子会自动保存并恢复该文件,同样不需要
重绑。若出现掉绑定,按 [TROUBLESHOOTING.md](TROUBLESHOOTING.md) 逐层检查。

日志:`journalctl -xeu leigod`;`tail -f /opt/leigod/log/{web_api,acc_daemon,acc_PC}.log`
(沙箱内插件写 `/tmp/acc/log`,systemd 单元把它 bind 到宿主的 `/opt/leigod/log`)。
官方 daemon 纯追加不轮转,故 `run.sh` 内置日志守护(每 60 秒检查):
**单文件超过 50 MiB 自动清零**(清零即丢失旧日志属预期;上限是本包的策略,
通过补丁以外的独立进程实现,不耦合官方脚本)。

## 配置(均在 /etc/leigod/,pacman 升级保留)

| 文件 | 作用 |
|---|---|
| `leigod.service` | **沙箱本体**:路径视图/能力/命名空间全在单元里(`/usr/lib/systemd/system/`),用户覆盖用 `systemctl edit leigod` |
| `sslh-guard.cfg` | 5588 门前过滤(regex 探针只放行 `Upgrade: websocket`) |
| `device.conf` | `DEVICE_IP=auto/指定IP/none`:dummy wlan0 的自报 IP |
| `mirror.conf`(可选) | 构建期下载镜像(见 `/usr/share/leigod/mirror.conf.example`) |

改配置后 `sudo systemctl restart leigod`。

## 故障排查

遇到问题先查 [TROUBLESHOOTING.md](TROUBLESHOOTING.md)
(特征 → 根因 → 修复,按表象互相掩盖的依赖顺序排列);
systemd 沙箱迁移的完整定位过程与排障方法论见
[MIGRATION.md](MIGRATION.md)。

## 安全与已知限制

1. **共享网络**:插件以 root 修改**主机**路由表、iptables 与 ipset;加速会话
   结束会清理自身规则。卸载本包不清 mangle 表,残留自查
   `iptables -t mangle -L OUTPUT -n`。
2. **明文下载 + 闭源二进制**:构建期 sha256 固定校验,运行期二进制访问雷神
   云端并上报(心跳/流量/引擎事件)。
3. **路径/设备视图收窄**(由 `leigod.service` 实现):私有 pid 命名空间
   (`PrivatePIDs=yes`,宿主进程与 `/proc/1/root` 均不可见);`/dev` 为私有
   固定节点集,仅 bind 进 `/dev/net/tun` 并经 cgroup 白名单放行;**根整体
   以 tmpfs 遮蔽,仅按白名单 bind 放回**(`/usr` 与 usr-merged 链接路径、
   `/etc` 白名单 12 项、安装目录、日志目录),视图与宿主顶层布局无关,
   双启动 `/efi`、`/windows` 等挂载不会漏入(见 MIGRATION.md §8);唯一持久可写区是
   `/opt/leigod`(映射为沙箱内 `/home/deck/leigod`)。进程能力收敛到
   `CAP_NET_ADMIN`+`CAP_NET_RAW`,读不了其他用户权限收紧的文件。
   代价:闭源二进制若需要白名单之外的路径会失败——在 `leigod.service` 的
   bind 段追加即可(例如 dbus 需
   `BindPaths=/run/dbus/system_bus_socket:/run/dbus/system_bus_socket`)。
   已知取舍:服务主进程是私有 pid 命名空间的 pid 1,未被回收的孤儿进程以
   僵尸形式留存至服务重启,无功能影响;`ProtectKernelTunables=yes` 若导致
   加速异常(日志指向 sysctl 写入失败),删除该行后重试。
4. **自动升级**:官方 `acc_upgrade_monitor` 会改写 `/opt/leigod` 内容并含每日
   重启窗口(带非雷神盒子守卫);如需锁定版本可自行停用该进程。
5. **仅 x86_64**;依赖 systemd ≥ 254(`PrivatePids=`);需要内核 tun/dummy 模块
   (包内 `modules-load.d` 已预加载)。

## 构建

```bash
makepkg -sif                 # 或换镜像: LEIGOD_MIRROR=http://<镜像>/ makepkg -sif
makepkg --printsrcinfo > .SRCINFO
```

仓库文件:PKGBUILD、leigod-plugin.install、leigod.service、run.sh、
ensure-wlan0.sh、leigod.conf(modules-load.d),以及各配置/伪装文件
(accelerator.ini、acc_version.ini、sslh-guard.cfg、device.conf、fake_*、
mirror.conf.example)与 README、.SRCINFO;远程二进制(acc-gw.router.amd64 /
xdb / 官方守护脚本)由 source 数组从镜像下载并以 pinned sha256 校验,不入库。
提交 AUR 前建议跑 `namcap PKGBUILD` 做最终检查。
