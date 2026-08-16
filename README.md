# OpenUniVPN — H3C SecPath SSLVPN 开源替代客户端

第三方实现的 UniVPN 协议客户端，支持多网关自动选路。

仅供研究学习用途（见 [LICENSE](LICENSE)）。

## 安装

### Arch Linux（AUR）

```bash
paru -S openunivpn        # 或 yay -S openunivpn
```

### 从源码运行

```bash
git clone https://github.com/tsaitang404/openunivpn.git /opt/openunivpn
cd /opt/openunivpn
```

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

[gateway]
# 格式: host:ip,host:ip  —— host 用于 TLS SNI，ip 用于实际连接
list = vpn.example.com:1.2.3.4,bjvpn.example.com:5.6.7.8

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
