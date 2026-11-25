# OpenUniVPN — H3C SecPath SSLVPN 开源替代客户端

第三方实现的 UniVPN 协议客户端，支持多网关自动选路。

仅供研究学习用途（见 [LICENSE](LICENSE)）。

## 兼容范围与限制

本项目不是通用 VPN 客户端，只针对实现相同 **H3C SecPath / UniVPN CNEM + NetExtension** 协议的网关。认证路径、CNEM 控制帧和 `REQVIP` 网络配置报文的字段偏移来自已验证的网关固件；其他厂商、其他 VPN 协议或固件升级后，必须先用实际报文验证兼容性。

- 网关配置使用 `host[:port]`，默认端口为 `443`；域名只解析 IPv4，TLS SNI 使用 `host`。
- 客户端只支持 IPv4 TUN、IPv4 网关和 IPv4 DNS；不支持 IPv6-only 网关。
- 网关下发的 DNS 和路由不是固定值；客户端会拒绝默认路由、覆盖网关的路由以及与现有路由冲突的前缀。
- 运行需要 Linux、root、`/dev/net/tun` 和 `ip` 命令。systemd/AUR 安装路径还需要 systemd；DNS 接管需要 `openresolv`，`dnsmasq` 后端需要额外的管理员配置。
- 网关若要求固定客户端 MAC，可在 `[auth] mac_address` 配置；留空时使用本机 MAC。该字段只用于兼容网关认证，不是安全凭据。

## 安装

### Arch Linux（AUR）

从 v1.1.11 升级时，**必须先停止旧客户端，再安装新版**；使用 `dnsmasq` 的用户还必须先确认离线路径和解析已恢复。见[升级前检查](#升级前检查)。

```bash
paru -S openunivpn        # 或 yay -S openunivpn
```

### 从源码运行

替换 v1.1.11 的程序文件前也必须先完成下列检查。

```bash
git clone https://github.com/tsaitang404/openunivpn.git /opt/openunivpn
cd /opt/openunivpn
```

### 升级前检查

1. **在旧版程序和停止钩子仍在磁盘上时**，若由 systemd 管理，先执行 `sudo systemctl stop openunivpn.service`，等待旧版停止钩子执行完毕；若为手动启动，则正常退出旧客户端。暂停任何自动拉起方式，并确认所有旧客户端都已退出。不要先覆盖文件再停服务。旧版使用过 `vpn0` resolvconf 标签时，也应确认旧标签已被移除，再启动新版。
2. 若 v1.1.11 使用了 `dnsmasq` 接管，确认 `/run/openunivpn-dns.servers` 是指向 `/etc/openunivpn/dnsmasq-offline.servers` 的软链接，而不是仍含 VPN 上游的普通文件；确认目标文件存在且 dnsmasq 可读。确认旧版恢复时成功重载了 dnsmasq；若无法确认，在核对离线软链接和上游后执行 `sudo systemctl reload dnsmasq.service`。再用系统解析器验证已知离线域名可解析（例如用 `getent ahostsv4` 查询一个已知在离线时可解析的域名）。**软链接恢复不等于重载或解析成功**；任一项异常就先排查并恢复，不要继续安装。
3. 确认上述检查通过后再升级。v1.1.11 的在线文件没有新版所有权标记；如果先升级，旧进程退出时调用的新版钩子不会恢复这份未知状态。若已经发生这种情况，先确认客户端均已停止且不会重启，再由管理员核实该运行时文件的来历，按本机配置恢复离线软链接、重载 dnsmasq 并验证解析。不要仅凭标记缺失就覆盖文件或伪造所有权。安装包不会代为停服或修改 DNS 运行时状态。

## 配置

配置文件查找优先级（取第一个存在的）：

1. 环境变量 `OPENUNIVPN_CONFIG` 指向的路径
2. `~/.config/openunivpn/config.conf`（用户级）
3. `/etc/openunivpn/config.conf`（系统级，systemd 服务读取）

### 格式（INI）

```ini
[auth]
username = <用户名>
password = <密码>
# 可选：网关要求固定客户端 MAC 时填写 AA-BB-CC-DD-EE-FF；留空则使用本机 MAC
mac_address =

[gateway]
# 格式: host[:port],host[:port] —— host 用于 TLS SNI 和 DNS 解析，端口缺省为 443
list = vpn.example.com:443,bjvpn.example.com:8443

[tun]
name = cnem0
```

### 首次配置

手动编辑 `/etc/openunivpn/config.conf`（系统级）或 `~/.config/openunivpn/config.conf`（用户级），
填入用户名、密码和网关列表。建议权限设为 `600`（含明文密码）：

```bash
sudo chmod 600 /etc/openunivpn/config.conf
```

## 使用

```bash
sudo python3 /opt/openunivpn/client.py   # 启动 VPN（自动选最快网关 + TUN 模式）
```

或交给 systemd：

```bash
sudo systemctl enable --now openunivpn   # 开机自启 + 启动
sudo systemctl status openunivpn
sudo journalctl -u openunivpn -f          # 跟踪日志
```

## 文件结构

```
/etc/openunivpn/config.conf              # 系统级配置（含凭据，建议 600）
~/.config/openunivpn/config.conf         # 用户级配置
~/.local/share/openunivpn/session.json   # 会话缓存（含 UserID/SessionID）
/opt/openunivpn/
├── client.py                            # VPN 客户端（CNEM 协议 + TUN 转发）
├── config.py                            # 配置加载 + 交互式向导
└── protocol-format.md                   # 协议逆向文档
/usr/lib/systemd/system/openunivpn.service
```

## 依赖

Python 3.8+，仅标准库。

## License

[MIT](LICENSE) — 仅限研究和学习用途。本软件为 SSLVPN 协议的独立第三方实现，
与原厂无任何关联。用户自行承担使用本软件的一切风险和责任。

## 回归测试

```bash
python3 -m unittest discover -s tests -v
```

测试不读取认证配置，不建立 VPN 或修改网络。覆盖 DATA 的 IPv4/IPv6 长度校验、
两种帧长度端序、拆包/粘包、控制帧及接收循环的断连行为。

DATA 帧边界取自内层 IP 长度。ACL/REQVIP 使用已有捕获的长度端序；
UDP_AVAILABLE/DATA_CONNECT 的已知四字节响应支持两种端序。
其他控制帧长度若存在歧义，等待下一帧头确认边界；孤立的未知控制帧可能暂缓处理，
需新增协议捕获才能确定其格式。

## 网关切换与断线恢复

客户端每轮只用 TCP 探测网关，按连通延迟依次尝试。超时、连接关闭或重置等临时传输故障
才会切换到下一个网关；一轮耗尽后在同一进程内重新探测。退避以 3、6、12、24、48 秒递增，
带少量抖动且不超过 60 秒，可被停止信号打断。会话建立后重置退避。即使离线超过 systemd
的启动限流窗口，客户端仍会继续尝试。

明确的认证拒绝、TLS 证书校验失败、配置错误、KICKOUT 或无法识别的协议响应，会停止而不是
切换网关或重新认证。退出状态 `78` 不触发 systemd 自动重启；检查日志并修正原因后再手动启动。
证书失败不会自动关闭校验，也不会被当成密码错误。

空闲或业务流量没有回复不触发重连；控制连接仍正常时，客户端没有独立的数据面健康探测。

## TUN 路由与升级迁移

客户端使用网关下发的有效 IPv4 子网掩码，不再假定 `/24`；掩码无效时停止连接。
默认仅安装该直连网段和网关下发的路由，
不再自动加入旧版内置的三条站点路由。若升级后缺少目标网段，请先向管理员核对网关已下发的路由及实际需要，
仅将缺少且获准的网段加入现有客户端配置（不要直接用示例覆盖现有文件）：

```ini
[tun]
name = cnem0
# 默认留空；若需要，填逗号分隔的 IPv4 网络 CIDR，例如 198.51.100.0/24。
extra_routes =
```

拒绝默认路由以及覆盖当前 VPN 网关地址的路由。已有同一目的前缀（即使 metric 不同）、VIP 冲突或同名接口时，
客户端停止连接，不覆盖或删除已有对象。创建 TUN 前也检查内核可能创建的广播 `/32`；若与已有主机路由或本次计划中的显式路由冲突，则拒绝整个计划。
若另有旧版自定义停止脚本或 systemd drop-in 按名称删除接口，升级时应单独审查并移除该操作。

地址和全部路由配置成功后才可接管 DNS；只使用路由查找结果指向本次 TUN 的 DNS 服务器。
断开或重连前先恢复本次修改的 DNS，再关闭本次创建的非持久 TUN；内核随接口回收路由。
如果 DNS 恢复失败，客户端仍释放 TUN，但会报告失败并停止重连。
路由查找不是 DNS 响应或 VPN 数据面健康探测。

## 本机使用 dnsmasq 时的 DNS 接管

默认继续使用 openresolv。`resolvconf_iface` 是独立的 resolvconf 标签，不是 TUN 接口名，默认值为 `vpn-openunivpn`；如本机已有同名标签，可在 `[dns]` 中修改。若系统通过本机 dnsmasq 解析，并且 dnsmasq 不使用 openresolv 写入的上游，可选用 `[dns]` 下的 `backend = dnsmasq`。此模式只更换 dnsmasq 上游，不更改网页流量路由。连接期间，公网域名也由 VPN DNS 解析。

启用前，由管理员一次性配置 dnsmasq：

1. 把原有 `server=` 上游（包括需在离线时保留的按域转发规则）移到 `/etc/openunivpn/dnsmasq-offline.servers`。确保该文件可被 dnsmasq 读取。移除仅为旧版 VPN 留下的临时转发，不要把它们放入离线文件。
2. 在 dnsmasq 中使用 `no-resolv` 和 `servers-file=/run/openunivpn-dns.servers`，不要保留其他静态或动态上游。不要移除本地 hosts、监听地址等非上游配置。
3. 在 `/etc/tmpfiles.d/openunivpn-dns.conf` 中写入 `L /run/openunivpn-dns.servers - - - - /etc/openunivpn/dnsmasq-offline.servers`，执行 `systemd-tmpfiles --create /etc/tmpfiles.d/openunivpn-dns.conf`。用 `dnsmasq --test` 验证，然后重启 dnsmasq。`dnsmasq.service` 必须支持用 SIGHUP 重读 `servers-file`。
4. 在 OpenUniVPN 配置中启用该后端，再启动 `openunivpn.service`。不要同时运行多个客户端实例。

两个 DNS 后端都默认校验 VPN 网关的 TLS 证书和主机名，且只采用经 VPN 隧道路由的 DNS 地址。使用企业 CA 的网关可在 `[gateway]` 中配置 `ca_file = /path/to/company-ca.pem`。仍需连接不受信网关时，可以显式设置 `[gateway]` 的 `tls_verify = false`，但此时不使用网关下发的 DNS：`dnsmasq` 要求在 `[dns]` 的 `servers` 填写受信的 VPN DNS IPv4 地址（逗号分隔）；`resolvconf` 可选填，未填写时保留系统 DNS。关闭校验可能使 VPN 凭据和流量被冒充网关截获，不影响浏览器的 HTTPS 校验。旧版 `resolvconf` 默认为不校验，升级前请检查网关证书配置。

断开时 OpenUniVPN 恢复本次切换的离线上游；通过 systemd 运行时，异常退出也会按当前 `INVOCATION_ID` 恢复，不接管其他实例的状态。
若手动运行的进程被强制终止，或 systemd 的恢复也失败，可能留下 `/run/openunivpn-dns.servers.owner`。发现所有权冲突（包括该标记残留或运行时文件来源不明）时，客户端不会接管或清理该状态，而是以 `78` 退出，不启动转发或重连。
若存在残留标记，由管理员在确认没有客户端运行且服务不会自动重启后，核实状态、恢复离线软链接并成功重载 dnsmasq，再清除确认残留的标记；不要删除 `.lock` 文件。若为旧版遗留的无标记文件，按[升级前检查](#升级前检查)处理。
若公司 DNS 本身超时，此模式不会改用公网 DNS；先验证 VPN 到公司 DNS 的连通性。
