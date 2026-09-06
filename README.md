# leigod-steamdeck-plugin

雷神加速器(Leigod)官方 **SteamDeck 插件**在普通 x86_64 Linux(打包时面向
Arch,其他发行版可参照)上的移植:将闭源官方二进制置于 bwrap 伪造的
SteamDeck 文件系统/进程视图中运行,手机雷神 App 经云端发现、绑定并下发加速。

与 [Husky0c/leigod-plugin-linux](https://github.com/Husky0c/leigod-plugin-linux)
(systemd BindReadOnlyPaths 方案)同一思想,本包的差异是改用 **bwrap 沙箱 +
sslh 门前过滤**,并修复了其 [issue #5](https://github.com/Husky0c/leigod-plugin-linux/issues/5)
所述的 web 进程崩溃问题。

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
重绑。若出现掉绑定,按"故障排查"一节逐层检查。

日志:`journalctl -xeu leigod`;`tail -f /tmp/acc/log/{web_api,acc_daemon,acc_PC}.log`。

## 配置(均在 /etc/leigod/,pacman 升级保留)

| 文件 | 作用 |
|---|---|
| `bwrap.conf` | bwrap 参数(逐行拼给 bwrap)。注意 `/dev` 必须用 `--dev-bind` 共享,原因见问题 #4 |
| `sslh-guard.cfg` | 5588 门前过滤(regex 探针只放行 `Upgrade: websocket`) |
| `device.conf` | `DEVICE_IP=auto/指定IP/none`:dummy wlan0 的自报 IP |
| `mirror.conf`(可选) | 构建期下载镜像(见 `/usr/share/leigod/mirror.conf.example`) |

改配置后 `sudo systemctl restart leigod`。

## 故障排查实录

本包开发过程中实际踩到并修复的五层问题,按"特征日志 → 根因 → 修复"记录,
便于后来者对号入座。这些问题的表象互相掩盖,**必须按顺序逐层排除**。

### #1 web 进程 SIGABRT 崩溃循环,App 无法绑定/提示设备离线

- **特征**:`acc_daemon.log` 每 5 秒 `child process recv signal, sig:6` 刷屏;
  coredump 崩溃地址恒定(`0x7d7149`);curl 5588 返回 Empty reply。
- **根因**:官方 web 进程基于 WebSocket++ 0.8.2,任何未完成 WebSocket 升级
  握手的普通 HTTP 连接(curl、浏览器、系统代理、App 部分探测)都会抛
  `websocketpp::exception(invalid state)` → `std::terminate` → SIGABRT。
  详见 [Husky0c issue #5](https://github.com/Husky0c/leigod-plugin-linux/issues/5)。
- **修复**:sslh 门前过滤(5588 → 5589),裸 HTTP 永远到不了后端。
  注意排查期间**不要**用 curl/浏览器直接探 5588,shell 里的全局
  `http_proxy` 也会让 Clash 替你发出致命的裸 HTTP;建议 `no_proxy` 加上本机。

### #2 绑定成功但 App 不发任何加速命令

- **特征**:`web_api.log` 只有 `getRouterInfo/getDeviceList/getNetworkState`
  轮询,无任何 bind/start 命令。
- **根因**:App 自身状态僵死(具体机制未知,重启 App 即恢复)。
- **修复**:重启手机 App,必要时解绑重绑。

### #3 加速命令到达,工作进程 1 秒内自杀,无 tun

- **特征**:`acc_PC.log` 中 `SteamDeckAccCore::start:55 create tun rules failed.`
  → 工作进程主动上报 `stop_acc`;`tun_PC` 不存在;App 显示"加速中"是假象。
- **根因(二选一或叠加)**:
  1. **`ipset` 未安装**——tun 模式把 2 万余条 IP 白名单灌进 ipset,是硬依赖
     而非可选;
  2. **bwrap `--dev /dev` 的设备白名单拒绝 `open("/dev/net/tun")`**——bwrap 以
     root 运行时,`--dev` 新建 tmpfs 的设备 cgroup 白名单不含 bind 进来的
     tun 节点,root 打开也 EACCES;`ip tuntap add` 即死。验证方法:
     `--dev-bind /dev /dev` 替代后 tun 创建立即成功。
- **修复**:`ipset` 移入 depends;`bwrap.conf` 改用 `--dev-bind /dev /dev`。

### #4 云端一直不在线(TURN wss 从不建立)

- **特征**:设备 UDP keepalive(64B/10s,`tcpdump` 可证)往返正常,但
  `Start turn tcp thread` 与 wss 连接(:5443)从不出现。
- **分析**:TurnAcc 的 wss 客户端启动疑似受"网络在线检测"(探测 1.1.1.1:443,
  大陆直连不可达,更多像国内外区域判断)影响;但在社区实测中,同一 LAN 下
  加速命令走 5588 直连,云端 TURN 不在线**不阻塞**本机使用加速(参考
  [issue #2](https://github.com/Husky0c/leigod-plugin-linux/issues/2))。
  若远程(非同 LAN)使用加速,可能受此影响,暂无解,留意官方二进制更新。

### #5 绑定后身份漂移,反复掉线

- **特征**:能绑定,过一会儿 App 提示"路由器加速功能已离线"。
- **根因**:设备身份 = dummy wlan0 的 MAC;若从真实无线网卡克隆 MAC 而该网卡
  开启了随机化,身份随连接漂移(参考 [issue #1](https://github.com/Husky0c/leigod-plugin-linux/issues/1))。
- **修复**:本包 MAC 默认取 `machine-id` 派生的稳定值(不随网络变化);
  若手工指定,确保固定。

## 安全与已知限制

1. **共享网络**:插件以 root 修改**主机**路由表、iptables 与 ipset;加速会话
   结束会清理自身规则。卸载本包不清 mangle 表,残留自查
   `iptables -t mangle -L OUTPUT -n`。
2. **明文下载 + 闭源二进制**:构建期 sha256 固定校验,运行期二进制访问雷神
   云端并上报(心跳/流量/引擎事件)。
3. **/dev 共享**:`bwrap.conf` 使用 `--dev-bind /dev /dev`(原因见问题 #3),
   沙箱不隔离设备;雷神二进制本身即以 root 运行,设备隔离无实际安全意义。
4. **自动升级**:官方 `acc_upgrade_monitor` 会改写 `/opt/leigod` 内容并含每日
   重启窗口(带非雷神盒子守卫);如需锁定版本可自行停用该进程。
5. **仅 x86_64**;依赖 systemd;需要内核支持 tun/dummy/netfilter。

## 构建

```bash
makepkg -sif                 # 或换镜像: LEIGOD_MIRROR=http://<镜像>/ makepkg -sif
makepkg --printsrcinfo > .SRCINFO
```

仓库文件:PKGBUILD、leigod-plugin.install、leigod.service、run.sh、
ensure-wlan0.sh,以及各配置/伪装文件(accelerator.ini、acc_version.ini、
bwrap.conf、sslh-guard.cfg、device.conf、fake_*、mirror.conf.example)与
README、.SRCINFO;远程二进制(acc-gw.router.amd64 / xdb / 官方守护脚本)由
source 数组从镜像下载并以 pinned sha256 校验,不入库。提交 AUR 前建议跑
`namcap PKGBUILD` 做最终检查。
