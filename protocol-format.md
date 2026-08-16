# H3C UniVPN (SecPath SSLVPN) 协议格式 — 已确认结构

日期：2026-08-06 逆向，2026-08-07 通过 UniVPNCS 二进制反汇编 + 运行日志交叉验证
二进制：`/usr/local/UniVPN/serviceclient/UniVPNCS`（ELF x86-64，6.75MB，无内部符号）
日志：`/usr/local/UniVPN/log/UniVPN_UniVPNCS_2783.log`（2026-08-06 22:40 成功连接 <GATEWAY>）

---

## 0.1 🎉 2026-08-07 最终突破：数据面打通（MITM + gdb 验证）

通过 **TLS MITM 代理**（iptables DNAT + 自签证书）捕获 univpn 完整明文帧，
配合 **gdb 附加 UniVPNCS** 在数据帧构造函数（0xd35ca）/发送函数（0xe4b59）断点验证，
**openunivpn 已完整实现协议并打通数据面**（DNS 查询经隧道正常解析）。

### 完整连接结构（双连接）
```
连接A（主连接 fd=12）: 握手帧(0x001D) → ACL → REQVIP → UDP_AVAILABLE → DATA_CONNECT → UDP_DETECT → DATA
连接B（HTTP 认证短连接）: GET /netextension/netextensionlogin.html → 166B（认证UserID + 44字符base64隧道密钥）
UDP socket（fd=14）: connect 到网关:4433（不发数据也需建立，数据面激活需要）
```

### 关键细节
1. **握手帧 cmd=0x001D**（340B）：`magic + session + ctx=0 + 001d + 0144 + [Linux64@0 + 网关域名@64 + 01 00 00@320]`
   → 网关回 792B（协商 ctx=0x00ffffff，payload 全零）
2. **HTTP 认证必须在独立连接**（同连接会 Broken pipe），响应 `f0f0f0f0 + UserID + ... + 00002c00 + base64密钥(44B)`
3. **CNEM 握手 ctx 用认证 UserID**（不是 /login.html 的 UserID）
4. **数据帧**：`magic + session + ctx(认证UserID) + 0002 + len + 明文IP包`（无加密、无 seq）
5. **数据面只接受允许路由内的目标**：REQVIP 下发的 43 条路由才是可访问的；
   测试 10.11.8.2 会触发 KICKOUT（cmd=0x0008），用 172.16.1.3（DNS1）正常
6. **心跳帧 ctx 也用认证 UserID**
7. 网关对**同会话并发 TLS 连接**敏感（探测阶段裸 TLS 会触发 KICKOUT）

---

## 0. 关键结论更新（对比上一版报告）

1. **VIP 不是 DHCP 获取**（对当前网关 szvpn/bjvpn）。日志证据：
   `Cnem parse vip info from gateway ok`，`Cnem parse new netcfginfo][DNS Server IP Nums is 2`
   VIP(10.11.250.126)、掩码、DNS(10.11.8.2/10.11.8.3)、路由全部由**网关在 REQVIP 响应内下发**（netcfg 报文字段 → `pstVnic`）。
   （代码里仍保留 DHCP 路径 `Cnem get vip from dhcp server`，用于 V1/老网关兜底。）
2. **网关接受裸 REQVIP 但不回 UdpPort 的原因**：真实客户端在 REQVIP 之前先发送**ACL 请求**（首个帧）。缺失 ACL 是上一版 v3 收不到完整响应的最可能原因。
3. UDP 探测（0x0007）总是超时符合预期，网关要求降级到 SSL/TCP/自定义 TLS 隧道。

---

## 1. 连接全握手时序（22:40 成功的真实调用链）

```
1. [CAUTH]  Master auth   (web_form)   -> UserID + SVN_SessionID
2. [CADM]  SSL Start Nem   TunnelMode:2  RouteCoverType:1  GmAlgorithmSel:0
3. [NETC]  Cnem SSL create ok  fd=12  -> <GATEWAY>:4433  HostName=<GATEWAY>
4. [CNEM]  status20 msgtype1 ->  Cnem send acl request to gateway ok   (第一帧 = ACL)
5. [CNEM]  status126 msgtype6 -> Cnem send vip request to gateway ok   (REQVIP)
6. [CNEM]  <= CMDtype REQVIP  (网关回) -> parse new netcfginfo -> VIP+掩码+DNS+路由
7. [CNEM]  <= handle packet   UdpPort 4433, ulTransMode
8. [CNEM]  UDP socket fd14 connect 4433 -> send iv udp detect request OK
9. [CNEM]  UDPDetect Timeout -> 自动切换 SSL Tunnel
10.[CNEM]  vnic set: GatewayIP=5a653eb7(<GATEWAY>) 及 ip/mask/dns/netfchid=15
11.[CNEM]  route set（网关下发的若干路由）
12.数据: vnic(cnem_vnic, fd15) <-> fd12(TLS)
```

### 状态机（status/message 供复盘）
```
init->(0,0) ssl create->(fd12,1 bind) ->run20/1 acl  ->126/6 vip req
  ->parse vm(ok3) ->121/3 ->(2)131/2 ->UdpPort ok4  ->136/4 udp detect
  ->ok5 21/5 -> send udp detect ->(timeout) switch ssl 11 ->141/11 vnic+route
```

---

## 3. 请求帧构造（从二进制反汇编）

### 3.1 帧头构造器 `CnemBuf eb_On` @ 0xbd32f（NEM v2，非 V1 分支）
入参: `bd32f(buf, &head, size)`
- `head[0]`: u32（当前进程上下文 ctx+0x1f4）
- `head[4]`: u16 = cmd
- `head[6]`: u16 = 载荷长度
输出（写入 buf 的前 16 字节）：
```
+0  u32 LE  0xbeeffcfe         ->  fe fc ef be
+4  u32 LE  0xd6a492c1         ->  c1 92 a4 d6   (会话标识[0..3])
+8  u32 BE  (head[0])          网络字节序值
+12 u16 BE  cmd
+14 u16 BE  len(payload)
---- 与既有一致 ----
```
> 该分支＝GmAlgorithmSel=0（当前网关）。对应反汇编 `Cnem_HandlerTp=0xbd41a`（报告里 0xbd41a 即帧构造断点地址）。

### 3.2 ACL 请求（连接后第 1 帧，20 字节）——函数含 `mov word[buf+0xc],0x600` / `mov word[buf+0xe],0x400`
```
+0  u32  magic            fe fc ef be
+4  u32  session[0..3]    c1 92 a4 d6
+8  u32 BE ctx+0x1f4       网络字节序
+c  u16 BE 0x0006          业务类型?
+e  u16 BE 0x0004
+10 u32 BE ctx+0x1f8
```
> 发送出口 `0xe4b59`（channel 解析 + `bed4e`/`f0803` 写 TLS）。

### 3.3 REQVIP/VIP 请求（第 2 帧）

> ⚠ **2026-08-07 更正**：早先版本此处误记为「当前网关 cmd=0x0004，载荷 0x10」。
> 经命令分发表（二进制偏移 0x458aa8）+ 实测验证，正确值为：
> **当前网关 cmd=0x0003，载荷长度=0（仅 16 字节帧头）**。

根据算法分支（命令分发表 0x458aa8 + 反汇编 0xd4731-0xd4754 验证）：
- **V1 网关（GmAlgorithm=1, cmd=0x0005）**：头 8 字节 + 32 字节 SessionID（来自全局缓冲 0x694f00）。载荷＝ `buff.size = 0x08 + 0x20`
- **当前网关（GmAlgorithm=0, cmd=0x0003）**：标准 16 字节帧头，**载荷长度=0**
  帧头由 0xbd32f 写：magic + session[0..3] + BE(ctx+0x1f4 = UserID) + cmd(0x0003) + len(0)

实测（2026-08-07 最终验证）：发送 16 字节 REQVIP 帧 → 网关回 ~972 字节 VIP 数据（含 VIP/掩码/DNS/路由）。

---

## 4. 网上下发（网关 -> 客户端，对应 cmdtype）
- cmdtype REQVIP：`Cnem parse new netcfginfo` → DNS Server nums、IP、掩码、网关
- cmdtype UDP_AVAILABLE / DATA_CONNECT / KEEPALIVE / KICKOUT / DHCP / IP_UNAVAILABLE（均已在字符串常量中）

## 5. 网关地址
本次/历次连接实际为 **<GATEWAY>:4433 = <GATEWAY>**（报告首行 <GATEWAY>:4433=<GATEWAY>，二者同源）。目标隧道全部走 **4433**。