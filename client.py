#!/usr/bin/env python3
"""
UniVPN 开源客户端 — 自动选最优网关 + TUN 模式

用法:
  1. sudo python3 client.py               # 启动 VPN（自动认证 + 选最快网关）
  2. dae 分流内网段到 cnem0 / 浏览器直接访问内网 IP
"""
import socket, ssl, struct, json, sys, os, time, threading, select, fcntl, subprocess, ipaddress, logging, re, signal, shutil
from concurrent.futures import ThreadPoolExecutor, as_completed
from config import load_config, setup_wizard, _find_config

logger = logging.getLogger('openunivpn')

# ── CNEM 协议常量 ──────────────────────────────────────
# 详见 protocol-format.md + MITM 实测（2026-08-07）
# 完整握手序列（MITM 捕获，bjvpn.canway.net）：
#   ACL(0x0006,plen4) → REQVIP(0x0003,plen0) → UDP_AVAILABLE(0x000D,plen4=4)
#   → DATA_CONNECT(0x001A,plen4=4) → UDP探测(0x0010,plen0) → DATA(0x0002)
CNEM_MAGIC = 0xBEEFFCFE
CNEM_SESSION = 0xD6A492C1
CMD_ACL = 0x0006         # ACL 请求（连接后第 2 帧）
CMD_HANDSHAKE = 0x001D   # 连接握手帧（连接后第 1 帧，340B：Linux64+网关域名，ctx=0）
CMD_REQVIP = 0x0003      # REQVIP 请求（无载荷）
CMD_UDP_AVAILABLE = 0x000D  # UDP_AVAILABLE（REQVIP 后，plen=4 payload=4）
CMD_DATA_CONNECT = 0x001A   # DATA_CONNECT（plen=4 payload=4，网关回 UdpPort）
CMD_UDP_DETECT = 0x0010     # UDP 探测（plen=0）
CMD_DATA = 0x0002        # 数据帧
CMD_KEEPALIVE = 0x0005

# 心跳参数
# ⚠ 2026-08-08 实测：网关对空闲连接固定 ~34 秒踢（3 次采样均 34s）。
# 网关超时窗口约 30 秒，原配置 30 秒才发心跳正好卡在边界被踢。
# 缩短为 8 秒间隔 / 15 秒空闲即发心跳，确保网关窗口内必有包。
# v3: 保活改用真实 DNS 查询（UDP 53 走数据面），比 ICMP ping 更接近真实流量
KEEPALIVE_CHECK_INTERVAL = 6    # 检查间隔（秒）
KEEPALIVE_IDLE_TIMEOUT = 12     # 距上次发包超过此值则发保活


def be32(v):
    """大端 32 位打包"""
    return struct.pack(">I", v & 0xFFFFFFFF)


def be16(v):
    """大端 16 位打包"""
    return struct.pack(">H", v & 0xFFFF)


MAGIC_B = struct.pack("<I", CNEM_MAGIC)
SESS_B = struct.pack("<I", CNEM_SESSION)

KEEPALIVE_FRAME = MAGIC_B + SESS_B + be32(0) + be16(CMD_KEEPALIVE) + be16(0)


def cnem_frame(cmd, payload=b"", ctx1f4=0, extra_be32=None):
    """构造 CNEM 帧（16 字节帧头 + 可选载荷）

    帧格式（详见 protocol-format.md §3.1）：
      +0   u32 LE  magic
      +4   u32 LE  session[0..3]
      +8   u32 BE  ctx1f4 (网络字节序)
      +12  u16 BE  cmd
      +14  u16 BE  payload 长度
      +16  ...     payload
    """
    if extra_be32 is not None:
        payload = payload + be32(extra_be32)
    return MAGIC_B + SESS_B + be32(ctx1f4) + be16(cmd) + be16(len(payload)) + payload


def parse_cnem(data):
    """解析 CNEM 帧，返回 (cmd, payload, remaining)。

    若数据不完整返回 (None, None, 原始 data)，由调用方继续缓冲。

    ⚠ len 字段端序：实测网关响应中 ACL(cmd=0x0006) 用**小端**（`14 00`=20），
    REQVIP(cmd=0x0003) 用**大端**（`03 bc`=956）。发送方向恒用大端（网关接受）。
    因此这里对响应帧做自适应：BE/LE 都试，取能恰好覆盖缓冲长度者。
    """
    if len(data) < 16:
        return None, None, data
    cmd = struct.unpack(">H", data[12:14])[0]
    plen_be = struct.unpack(">H", data[14:16])[0]
    plen_le = struct.unpack("<H", data[14:16])[0]
    # 优先选能恰好覆盖缓冲的端序；两端序都不完整则返回 None 继续缓冲
    for plen in sorted({plen_be, plen_le}):
        if plen <= 65535 and 16 + plen <= len(data):
            return cmd, data[16:16 + plen], data[16 + plen:]
    return None, None, data


# ── REQVIP 响应解析 ──────────────────────────────────
# 结构（2026-08-07 实测，bjvpn.canway.net, payload=956B）：
#   @0   4B  VIP
#   @4   4B  掩码
#   @8   4B  保留
#   ...  中间为随机/加密数据（约 @8-159）
#   @160 4B  DNS 服务器 1
#   @164 4B  DNS 服务器 2
#   @168 16B 零填充
#   @186 2B  BE 路由数量
#   @188 ... 路由表，每条 12B：network(4B) + mask(4B) + extra(4B)
# ⚠ 偏移基于本网关固件实测，若固件升级结构变化需重新校准
#   （对照 protocol-format.md §4 和 HTML 逆向报告）

NETCFG_DNS_OFF = 0xA0        # 160
NETCFG_RT_COUNT_OFF = 0xBA   # 186
NETCFG_RT_START = 0xBC       # 188
NETCFG_RT_STRIDE = 12

def _parse_ip(b):
    return ".".join(str(x) for x in b)

def parse_netcfg(payload):
    """从 REQVIP 响应载荷中提取 VIP/掩码/DNS/路由（精确偏移解析）。"""
    if len(payload) < 30:
        logger.warning("REQVIP 响应过短 (%d 字节)，无法解析", len(payload))
        return None

    vip = {
        "vip_ip": _parse_ip(payload[0:4]),
        "mask": _parse_ip(payload[4:8]),
        "dns": [],
        "routes": [],
    }
    logger.debug("REQVIP netcfg 载荷=%dB VIP=%s mask=%s",
                 len(payload), vip["vip_ip"], vip["mask"])

    # DNS：@160/164 两个连续 IP（跳过 0.0.0.0）
    for off in (NETCFG_DNS_OFF, NETCFG_DNS_OFF + 4):
        if off + 4 <= len(payload):
            candidate = _parse_ip(payload[off:off + 4])
            if candidate != "0.0.0.0":
                vip["dns"].append(candidate)
    if not vip["dns"]:
        logger.warning("未能从 REQVIP 响应解析出 DNS（偏移可能已漂移）")

    # 路由表：@188 开始，每条 12B，数量由 @184 给出
    if NETCFG_RT_COUNT_OFF + 2 <= len(payload):
        route_count = struct.unpack(">H", payload[NETCFG_RT_COUNT_OFF:NETCFG_RT_COUNT_OFF + 2])[0]
        off = NETCFG_RT_START
        for _ in range(route_count):
            if off + 8 > len(payload):
                break
            net_b = payload[off:off + 4]
            mask_b = payload[off + 4:off + 8]
            if net_b == b"\x00\x00\x00\x00" and mask_b == b"\x00\x00\x00\x00":
                break
            vip["routes"].append((_parse_ip(net_b), _parse_ip(mask_b)))
            off += NETCFG_RT_STRIDE

    logger.info("REQVIP 解析: VIP=%s mask=%s DNS=%s routes=%d",
                vip["vip_ip"], vip["mask"], vip["dns"], len(vip["routes"]))
    return vip


def resolve_gateway(addr):
    """解析网关地址，返回 (sni_host, ip)。addr 可为域名或 IP。"""
    try:
        socket.inet_aton(addr)
        return addr, addr  # 本身就是 IP
    except OSError:
        pass
    try:
        ip = socket.getaddrinfo(addr, None, socket.AF_INET, socket.SOCK_STREAM)[0][4][0]
        return addr, ip
    except Exception:
        return addr, None


def probe_gateway(addr, port, ctx1f4):
    """只测 TCP 连通延迟（不建 TLS、不发业务帧）。

    重要：不能在此建立 TLS 连接或发送任何 CNEM 帧。
    网关对同一会话的裸 TLS 连接（握手后不发协议帧就关闭）敏感，
    会判定异常并对后续主连接返回 KICKOUT (cmd=0x0008)。
    因此探测只做 TCP connect 测延迟，完整握手仅在 main() 中做一次。
    """
    host, ip = resolve_gateway(addr)
    if not ip:
        return None
    t0 = time.time()
    try:
        raw = socket.create_connection((ip, port), timeout=5)
        raw.close()
        lat = (time.time() - t0) * 1000
        return {"host": addr, "ip": ip, "port": port, "latency": lat}
    except Exception:
        return None


def select_gateway(ctx1f4, gateways):
    """并发探测所有网关（仅 TCP/TLS 连通性），按延迟升序返回最快的一个"""
    print("[*] 探测网关...")
    results = []
    with ThreadPoolExecutor(max_workers=min(len(gateways), 8)) as pool:
        futures = {pool.submit(probe_gateway, addr, port, ctx1f4): addr for addr, port in gateways}
        for f in as_completed(futures):
            r = f.result()
            if r:
                results.append(r)
    if not results:
        print("[!] 所有网关不可达")
        sys.exit(1)
    results.sort(key=lambda r: r["latency"])
    for r in results:
        print(f"  {r['host']}:{r['port']} {r['latency']:.0f}ms")
    return results[0]


def create_tun(name="cnem0"):
    TUNSETIFF = 0x400454CA
    fd = os.open("/dev/net/tun", os.O_RDWR)
    ifr = struct.pack("16sH", name.encode(), 0x0001 | 0x1000)
    fcntl.ioctl(fd, TUNSETIFF, ifr)
    return fd, name


def run_cmd(args):
    """安全运行系统命令"""
    subprocess.run(args, check=False, capture_output=True)


# ── 系统 DNS 管理（通过 openresolv/resolvconf 协调，与 NetworkManager 共存）──
# 依赖 openresolv 包（PKGBUILD depends）。用接口名 vpn0（在 resolvconf 默认
# dynamic_order 中，DNS 自动排最前）。NetworkManager 需配置 rc-manager=resolvconf
# （两者都走 resolvconf，互不覆盖）。
RESOLVCONF_IFACE = 'vpn0'

def _resolvconf_available():
    """resolvconf 是否可用（依赖 openresolv）。缺失时跳过 DNS 注入，避免破坏网络。"""
    return shutil.which("resolvconf") is not None


def setup_dns(vpn_dns_list):
    """把 VPN DNS 通过 resolvconf 加入系统（自动排最前，保留原 DNS fallback）。"""
    if not vpn_dns_list:
        return
    if not _resolvconf_available():
        logger.warning("openresolv(resolvconf) 未安装，跳过 VPN DNS 注入（不影响公网）")
        return
    try:
        content = "\n".join(f"nameserver {d}" for d in vpn_dns_list) + "\n"
        p = subprocess.run(
            ["resolvconf", "-a", RESOLVCONF_IFACE],
            input=content, capture_output=True, text=True,
        )
        if p.returncode == 0:
            logger.info("VPN DNS 已通过 resolvconf 添加: %s", vpn_dns_list)
        else:
            logger.warning("resolvconf 添加 DNS 失败: %s", p.stderr.strip())
    except Exception as e:
        logger.warning("更新系统 DNS 失败: %s", e)


def restore_dns():
    """VPN 退出时从 resolvconf 移除 VPN DNS。"""
    if not _resolvconf_available():
        return
    try:
        p = subprocess.run(
            ["resolvconf", "-d", RESOLVCONF_IFACE],
            capture_output=True, text=True,
        )
        if p.returncode == 0:
            logger.info("VPN DNS 已从 resolvconf 移除")
        else:
            logger.warning("resolvconf 移除 DNS 失败: %s", p.stderr.strip())
    except Exception as e:
        logger.warning("恢复系统 DNS 失败: %s", e)


def main():
    logging.basicConfig(
        level=logging.INFO,
        format='%(asctime)s [%(levelname)s] %(message)s',
    )

    if os.geteuid() != 0:
        print("需要 root 权限 (TUN)")
        sys.exit(1)

    # SIGTERM/SIGINT 优雅退出（systemd stop 时执行 finally 恢复 DNS/清理 TUN）
    stop_event = threading.Event()

    def _handle_signal(signum, frame):
        logger.info("收到信号 %s，正在退出...", signum)
        stop_event.set()

    signal.signal(signal.SIGTERM, _handle_signal)
    signal.signal(signal.SIGINT, _handle_signal)

    config = load_config()

    # ── 配置完整性校验：缺项时给出明确诊断，而非笼统报错 ──
    missing = []
    if not config["gateways"]:
        missing.append("网关列表(gateway.list)")
    if not config["username"]:
        missing.append("用户名(auth.username)")
    if not config["password"]:
        missing.append("密码(auth.password)")
    if missing:
        print("[!] 配置不完整，缺少: " + "、".join(missing))
        print("    配置文件路径: " + (_find_config() or "(未找到配置文件)"))
        print("    请编辑该文件后重试。")
        sys.exit(2)

    gateways = config["gateways"]
    tun_name = config["tun_name"]
    username = config["username"]
    password = config["password"]

    # ── 数据面稳定性参数 ──
    RECV_TIMEOUT = 5          # TLS recv 轮询超时（秒）
    STALE_TIMEOUT = 30        # 数据面无任何回包达到该秒数判定假死（秒）
    RECONNECT_DELAY = 3       # 断连后重连间隔（秒）

    # ── 主循环：建立连接 + 转发；数据面假死/断连时自动重连 ──
    while not stop_event.is_set():
        # 注：ctx1f4 初始值不重要，NetExtension 认证后会覆盖为认证 UserID
        ctx1f4 = 0
        gw = select_gateway(ctx1f4, gateways)
        host, ip, port, latency = gw["host"], gw["ip"], gw["port"], gw["latency"]

        # ── 完整握手（对照官方 UniVPNCS 日志时序 2026-08-07 22:37:49-50）──
        #   官方流程（日志验证）：
        #     1. Master Auth：独立短连接完成认证（拿 UserID），随即关闭
        #     2. SSL Start Nem：新建 CNEM 主连接 fd=12，第一帧即 ACL
        #     3. ACL → REQVIP → UDP_AVAILABLE → DATA_CONNECT → UDP_DETECT → DATA
        #   ⚠ 官方主连接第一帧就是 ACL，无额外"握手帧(0x001D)"；认证与主连接是
        #     两个不同连接。旧实现先建主连接发 0x001D 再认证，导致网关 KICKOUT。

        # 1. 认证短连接（独立连接，认证完即关闭；确定性失败直接退出）
        if username and password:
            try:
                auth_ctx = ssl.create_default_context()
                auth_ctx.check_hostname = False
                auth_ctx.verify_mode = ssl.CERT_NONE
                auth_sock = auth_ctx.wrap_socket(
                    socket.create_connection((ip, port), timeout=10), server_hostname=host)
                pwd_enc = password.replace("%", "%25")
                path = (f"/netextension/netextensionlogin.html?"
                        f"SelectLanguage=0&UserName={username}&Password={pwd_enc}"
                        f"&MacAddress=F04B-B3B9-EBE5&SVN_Seco_AaA=1&")
                http_req = (f"GET {path} HTTP/1.1\r\n"
                            "Accept: image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, application/msword, application/vnd.ms-excel, application/vnd.ms-powerpoint, */*\r\n"
                            "Accept-Language: zh-cn\r\n"
                            "Accept-Encoding: gzip, deflate\r\n"
                            "User-Agent: Mozilla/4.0 (compatible; MSIE 6.0; NT 5.1; SV1; .NET CLR 2.0.50727)OS=Linux64\r\n"
                            f"Host: {host}\r\n"
                            "\r\n").encode()
                auth_sock.sendall(http_req)
                auth_sock.settimeout(5)
                auth_resp = auth_sock.recv(65536)
                auth_sock.close()
                if auth_resp[:4] == b"\xf0\xf0\xf0\xf0":
                    new_uid = struct.unpack(">I", auth_resp[4:8])[0]
                    # 网关对认证失败返回 UserID=0xfffffffb(-5) 等错误码，须与合法 UserID 区分
                    if new_uid == 0 or new_uid >= 0xFFFFF000:
                        print(f"[!] 认证失败：网关 {host} 拒绝登录（错误码 0x{new_uid:08x}）")
                        print("    可能原因：用户名或密码错误、账号被禁用/锁定。")
                        sys.exit(1)
                    ctx1f4 = new_uid  # 用认证 UserID 作为 CNEM ctx
                    m = re.search(rb"[A-Za-z0-9+/=]{44}", auth_resp)
                    if m:
                        logger.info("NetExtension 认证成功 UserID=0x%08x 密钥len=%d", new_uid, len(m.group(0)))
                    else:
                        logger.info("NetExtension 认证成功 UserID=0x%08x", new_uid)
                else:
                    print(f"[!] 认证失败：网关 {host} 拒绝登录（{len(auth_resp)}B）")
                    print("    可能原因：用户名或密码错误、账号被禁用/锁定、或不允许当前来源拨入。")
                    print(f"    响应前 16 字节: {auth_resp[:16].hex()}")
                    sys.exit(1)
            except (socket.timeout, OSError, ssl.SSLError) as e:
                print(f"[!] 认证失败：无法连接网关 {host}:{port}（{e}）")
                print("    请检查网络连通性和网关地址是否正确。")
                sys.exit(1)
            except Exception as e:
                print(f"[!] 认证异常：{e}")
                sys.exit(1)

        # 2. 新建 CNEM 主连接（fd=12），第一帧即 ACL（官方时序，无握手帧）
        ssl_ctx = ssl.create_default_context()
        ssl_ctx.check_hostname = False
        ssl_ctx.verify_mode = ssl.CERT_NONE
        raw = socket.create_connection((ip, port), timeout=15)
        sock = ssl_ctx.wrap_socket(raw, server_hostname=host)
        sock.settimeout(30)

        # 3. UDP socket connect 到网关:4433（模拟 univpn fd=14，数据面激活需要）
        udp_probe = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        try:
            udp_probe.connect((ip, port))
            udp_probe.settimeout(2)
            logger.info("UDP socket 已 connect %s:%s", ip, port)
        except Exception as e:
            logger.warning("UDP connect 失败: %s", e)

        # 4. ACL（连接A第一帧，20B：16B 头 + 4B ctx+0x1f8，ctx=认证UserID）
        sock.sendall(cnem_frame(CMD_ACL, extra_be32=0, ctx1f4=ctx1f4))
        acl_resp = b""
        try:
            acl_resp = sock.recv(4096)
        except Exception:
            pass
        logger.info("ACL 响应 %dB: %s", len(acl_resp), acl_resp[:64].hex())
        acl_cmd, _, _ = parse_cnem(acl_resp)
        if acl_cmd == 0x0008:
            # KICKOUT：网关拒绝连接（逆向确认 cmd=0x0008 即 KICKOUT，原因码 g_uiReConnectResult=6）
            print(f"[!] 网关拒绝连接 (KICKOUT cmd=0x0008, {len(acl_resp)}B)")
            print("    可能原因：同账号在其他设备登录(多端冲突)、账号受限、或网关对该出口IP限制")
            sock.close()
            print(f"[*] {RECONNECT_DELAY} 秒后重连...")
            time.sleep(RECONNECT_DELAY)
            continue
        if acl_cmd != CMD_ACL:
            print(f"[!] ACL 握手失败 (resp cmd=0x{(acl_cmd or 0):04x}, {len(acl_resp)}B)")
            sys.exit(1)
        logger.info("ACL 握手成功")

        # 5. REQVIP（16B 帧头，无载荷）
        sock.sendall(cnem_frame(CMD_REQVIP, ctx1f4=ctx1f4))
        buf = b""
        try:
            sock.settimeout(15)
            for _ in range(10):
                d = sock.recv(65536)
                if not d:
                    break
                buf += d
        except Exception:
            pass
        sock.settimeout(30)

        # 解析 REQVIP 响应：提取 VIP/掩码/DNS/路由
        vip = None
        off = 0
        while off + 16 <= len(buf):
            cmd, pl, rest = parse_cnem(buf[off:])
            if cmd is None:
                break
            if cmd == 0x0003 and len(pl) >= 30:
                vip = parse_netcfg(pl)
                if vip:
                    logger.info("REQVIP 解析成功: VIP=%s mask=%s", vip["vip_ip"], vip["mask"])
                break
            off += 16 + len(pl)

        if not vip:
            print("[!] REQVIP 响应解析失败，无法继续")
            sys.exit(1)

        # 6. UDP_AVAILABLE → DATA_CONNECT → UDP 探测（MITM 实测必须）
        handshake_ok = True
        for cmd_val, payload in (
            (CMD_UDP_AVAILABLE, struct.pack(">I", 4)),
            (CMD_DATA_CONNECT, struct.pack(">I", 4)),
        ):
            try:
                sock.sendall(cnem_frame(cmd_val, payload=payload, ctx1f4=ctx1f4))
            except Exception as e:
                print(f"[!] 握手发送 cmd=0x{cmd_val:04x} 失败: {e}，触发重连")
                handshake_ok = False
                break
            logger.info("已发送 cmd=0x%04x", cmd_val)
            try:
                sock.settimeout(2)
                r = sock.recv(65536)
                if r:
                    rcmd, rpl, _ = parse_cnem(r)
                    logger.info("  响应 cmd=0x%04x payload=%s", rcmd or 0, (rpl or b"").hex()[:32])
            except socket.timeout:
                logger.warning("  cmd=0x%04x 无响应", cmd_val)
            except Exception:
                pass
            sock.settimeout(30)
        if not handshake_ok:
            sock.close()
            print(f"[*] 握手中断，{RECONNECT_DELAY} 秒后重连...")
            time.sleep(RECONNECT_DELAY)
            continue

        # UDP 探测帧（0x0010，无载荷）——发 TLS + UDP socket
        time.sleep(1)
        try:
            sock.sendall(cnem_frame(CMD_UDP_DETECT, ctx1f4=ctx1f4))
            logger.info("已发送 UDP 探测 cmd=0x0010")
        except Exception:
            logger.warning("UDP 探测发送失败（忽略）")
        # UDP socket 也发一帧探测（HTML §7 格式）
        try:
            udp_detect = (struct.pack("<I", 0xBEEFFCFE) + bytes.fromhex("c192a4d6")
                          + struct.pack("<I", 0x1000021c) + struct.pack(">I", ctx1f4)
                          + os.urandom(13))
            udp_probe.sendto(udp_detect, (ip, port))
            logger.info(" UDP 探测帧 %dB 已发送", len(udp_detect))
        except Exception:
            pass

        # 等待 UDP 探测超时（官方客户端在此等 2 秒后切换到 SSL 模式）
        logger.info("等待 UDP 探测超时（2秒）...")
        time.sleep(2)

        # ── TUN 配置 ──
        tun_fd, tun_name = create_tun(tun_name)
        run_cmd(["ip", "link", "set", tun_name, "up"])
        run_cmd(["ip", "addr", "add", f"{vip['vip_ip']}/24", "dev", tun_name])
        for net, mask in vip["routes"]:
            prefix = ipaddress.IPv4Network(f"{net}/{mask}", strict=False).prefixlen
            run_cmd(["ip", "route", "add", f"{net}/{prefix}", "dev", tun_name])
        for subnet in ["10.11.0.0/16", "10.12.0.0/16", "10.13.0.0/16"]:
            run_cmd(["ip", "route", "add", subnet, "dev", tun_name])
        if vip["dns"]:
            setup_dns(vip["dns"])

        print(f"\n[*] {host} ({latency:.0f}ms) VIP={vip['vip_ip']} DNS={vip['dns']}")
        print(f"    TUN: {tun_name}  Ctrl+C 停止")

        # ── 双向转发 + 心跳 + 假死检测 ──
        running = True
        session_start = time.time()
        last_keepalive = time.time()
        last_rx = time.time()
        sock_lock = threading.Lock()
        reconnect = [False]

        def send_keepalive():
            """每 KEEPALIVE_CHECK_INTERVAL 秒检查一次，距上次发包超过
            KEEPALIVE_IDLE_TIMEOUT 秒则发送保活流量，防止网关踢连接。

            ⚠ 2026-08-08 实测结论：
            - 空闲 ~34s 被网关踢（网关空闲超时）
            - 0x0005 空载荷心跳、0x0010 UDP探测帧均不被网关视为有效流量
            - ICMP ping / UDP DNS 保活效果有限
            - 持续真实流量（HTTP/DNS 查询）连接稳定
            - cmd=0x001A (DATA_CONNECT) 网关有回包（握手时 payload=11510000）
            因此保活用 0x001A 帧：网关回包 → last_rx 更新 → 假死检测不触发。"""
            nonlocal last_keepalive
            while running:
                time.sleep(KEEPALIVE_CHECK_INTERVAL)
                if time.time() - last_keepalive >= KEEPALIVE_IDLE_TIMEOUT:
                    try:
                        # 保活帧：DATA_CONNECT(0x001A)，握手阶段网关回包
                        keepalive_frame = cnem_frame(CMD_DATA_CONNECT,
                                                     payload=struct.pack(">I", 4),
                                                     ctx1f4=ctx1f4)
                        with sock_lock:
                            sock.sendall(keepalive_frame)
                        last_keepalive = time.time()
                        logger.info("保活: DATA_CONNECT 0x001A 已发送")
                    except Exception:
                        break

        def tun_to_tls():
            nonlocal last_keepalive
            while running:
                r, _, _ = select.select([tun_fd], [], [], 1)
                if r:
                    try:
                        packet = os.read(tun_fd, 65536)
                        if packet:
                            with sock_lock:
                                sock.sendall(cnem_frame(CMD_DATA, packet, ctx1f4=ctx1f4))
                            last_keepalive = time.time()
                    except OSError as e:
                        print(f"  [!] TUN读取错误: {e}")
                        reconnect[0] = True
                        break
                    except Exception as e:
                        print(f"  [!] TLS写入错误: {e}")
                        reconnect[0] = True
                        break

        def tls_to_tun():
            nonlocal last_rx
            buf = b""
            sock.settimeout(RECV_TIMEOUT)
            while running:
                try:
                    data = sock.recv(65536)
                    if not data:
                        print("  [!] TLS连接关闭，触发重连")
                        reconnect[0] = True
                        break
                    buf += data
                    while len(buf) >= 16:
                        cmd, payload, remaining = parse_cnem(buf)
                        if cmd is None:
                            break
                        buf = remaining
                        if cmd == CMD_DATA and payload:
                            last_rx = time.time()  # 仅数据帧更新（控制帧回包不算，防假死检测被保活欺骗）
                            os.write(tun_fd, payload)
                        elif cmd in (0x0008, 0x0005, 0x000D, 0x001A, 0x0003):
                            # 控制帧：KICKOUT(0x0008)/KEEPALIVE(0x0005) 等，打印供诊断
                            logger.info("  收到控制帧 cmd=0x%04x plen=%d %s",
                                         cmd, len(payload), payload.hex()[:64])
                            # 即使收到控制帧回包，数据面(0x0002)可能已假死；检查并重连
                            if time.time() - last_rx > STALE_TIMEOUT:
                                print(f"  [!] 数据面假死（{STALE_TIMEOUT}s 无数据帧回包），触发重连")
                                reconnect[0] = True
                                break
                            if cmd == 0x0008:
                                # KICKOUT：被服务器踢出（网关不发错误码，统一提示）
                                print("  ⚠ 被网关踢出连接 (KICKOUT)")
                                reconnect[0] = True
                                break
                except BlockingIOError:
                    # EAGAIN：SSL socket 暂时无数据（正常，非错误），继续轮询
                    continue
                except socket.timeout:
                    # 长时间无任何回包 → 数据面假死（网关半开连接），触发重连
                    if time.time() - last_rx > STALE_TIMEOUT:
                        print(f"  [!] 数据面假死（{STALE_TIMEOUT}s 无回包），触发重连")
                        reconnect[0] = True
                        break
                    continue
                except Exception as e:
                    print(f"  [!] TLS读取错误: {e}，触发重连")
                    reconnect[0] = True
                    break

        t1 = threading.Thread(target=tun_to_tls, daemon=True)
        t2 = threading.Thread(target=tls_to_tun, daemon=True)
        t3 = threading.Thread(target=send_keepalive, daemon=True)
        t1.start()
        t2.start()
        t3.start()

        try:
            while t1.is_alive() and t2.is_alive() and not stop_event.is_set():
                time.sleep(0.5)
        except KeyboardInterrupt:
            stop_event.set()

        # 清理本会话（先停线程再关 fd，避免转发线程访问已关闭资源）
        running = False
        t1.join(timeout=3)
        t2.join(timeout=3)
        t3.join(timeout=3)
        sock.close()
        os.close(tun_fd)
        run_cmd(["ip", "link", "del", tun_name])
        restore_dns()
        print("已清理")

        if not reconnect[0] or stop_event.is_set():
            break  # 正常退出（收到停止信号/手动停止）

        print(f"[*] 数据面断开，{RECONNECT_DELAY} 秒后重连...")
        time.sleep(RECONNECT_DELAY)


if __name__ == "__main__":
    main()
