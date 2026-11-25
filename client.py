#!/usr/bin/env python3
"""
UniVPN 开源客户端 — 自动选最优网关 + TUN 模式

用法:
  1. sudo python3 client.py               # 启动 VPN（自动认证 + 选最快网关）
  2. dae 分流内网段到 cnem0 / 浏览器直接访问内网 IP
"""
import socket, ssl, struct, sys, os, time, threading, select, random, fcntl, subprocess, ipaddress, logging, signal, shutil, errno, json
import re
from urllib.parse import urlencode
from contextlib import closing, contextmanager
from configparser import Error as ConfigError
from concurrent.futures import ThreadPoolExecutor, as_completed
from typing import Optional, Tuple
from config import load_config, _find_config, parse_extra_route
import dns_backend

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
    DATA 使用内层 IP 长度；已知控制帧使用捕获证据，其他帧等待下一帧边界。
    """
    if len(data) < 16:
        return None, None, data
    cmd = struct.unpack(">H", data[12:14])[0]
    plen_be = struct.unpack(">H", data[14:16])[0]
    plen_le = struct.unpack("<H", data[14:16])[0]
    if data[:4] != MAGIC_B:
        raise ValueError("Invalid CNEM magic")
    if cmd == CMD_DATA:
        if len(data) < 20:
            return None, None, data
        version = data[16] >> 4
        if version == 4:
            header_len = (data[16] & 15) * 4
            packet_len = struct.unpack(">H", data[18:20])[0]
            if header_len < 20 or packet_len < header_len:
                raise ValueError("Invalid IPv4 packet length")
        elif version == 6:
            if len(data) < 22:
                return None, None, data
            packet_len = 40 + struct.unpack(">H", data[20:22])[0]
        else:
            raise ValueError("Invalid IP version in CNEM DATA")
        if packet_len not in (plen_be, plen_le):
            raise ValueError("CNEM DATA length does not match IP length")
        plen = packet_len
    elif cmd == CMD_ACL:
        plen = plen_le  # Captured ACL responses use little endian.
    elif cmd == CMD_REQVIP:
        plen = plen_be  # Captured REQVIP responses use big endian.
    elif cmd in (CMD_UDP_AVAILABLE, CMD_DATA_CONNECT) and 4 in (plen_be, plen_le):
        plen = 4  # Captured handshake/keepalive responses carry a 4-byte value.
    elif plen_be == plen_le:
        plen = plen_be
    else:
        # Unknown control formats cannot be resolved from recv boundaries.
        # Accept only a candidate followed by another CNEM header; otherwise
        # wait for more bytes rather than consuming a potentially partial frame.
        candidates = [n for n in (plen_be, plen_le)
                      if len(data) >= 16 + n + 16
                      and data[16 + n:20 + n] == MAGIC_B]
        if len(candidates) != 1:
            return None, None, data
        plen = candidates[0]
    if len(data) < 16 + plen:
        return None, None, data
    return cmd, data[16:16 + plen], data[16 + plen:]


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

    # 路由表：@188 开始，每条 12B，数量由 @186 给出。
    if NETCFG_RT_COUNT_OFF + 2 <= len(payload):
        route_count = struct.unpack(">H", payload[NETCFG_RT_COUNT_OFF:NETCFG_RT_COUNT_OFF + 2])[0]
        end = NETCFG_RT_START + route_count * NETCFG_RT_STRIDE
        if end > len(payload):
            logger.warning("REQVIP 路由表截断")
            return None
        for off in range(NETCFG_RT_START, end, NETCFG_RT_STRIDE):
            net_b = payload[off:off + 4]
            mask_b = payload[off + 4:off + 8]
            vip["routes"].append((_parse_ip(net_b), _parse_ip(mask_b)))

    logger.info("REQVIP 解析: VIP=%s mask=%s DNS=%s routes=%d",
                vip["vip_ip"], vip["mask"], vip["dns"], len(vip["routes"]))
    return vip


def resolve_gateway(addr: str) -> Tuple[str, Optional[str]]:
    """解析网关地址，返回 (sni_host, ip)。addr 可为域名或 IP。"""
    try:
        socket.inet_aton(addr)
        return addr, addr  # 本身就是 IP
    except OSError:
        pass
    try:
        ip = socket.getaddrinfo(addr, None, socket.AF_INET, socket.SOCK_STREAM)[0][4][0]
        if not isinstance(ip, str):
            raise ValueError("invalid IPv4 resolver result")
        return addr, ip
    except socket.gaierror as exc:
        # An offline resolver can return a negative answer as well as EAI_AGAIN.
        if exc.errno in (socket.EAI_AGAIN, socket.EAI_NONAME, getattr(socket, 'EAI_NODATA', None)):
            return addr, None
        raise


def probe_gateway(addr, port, ctx1f4):
    """只测 TCP 连通延迟（不建 TLS、不发业务帧）。

    重要：不能在此建立 TLS 连接或发送任何 CNEM 帧。
    网关对同一会话的裸 TLS 连接（握手后不发协议帧就关闭）敏感，
    会判定异常并对后续主连接返回 KICKOUT (cmd=0x0008)。
    因此探测只做 TCP connect 测延迟，完整握手在探测之后串行执行。
    """
    _, ip = resolve_gateway(addr)
    if not ip:
        return None
    t0 = time.monotonic()
    try:
        with closing(socket.create_connection((ip, port), timeout=5)):
            lat = (time.monotonic() - t0) * 1000
    except (socket.timeout, TimeoutError):
        return None
    except OSError as exc:
        if exc.errno in TRANSIENT_ERRNOS:
            return None
        raise
    return {"host": addr, "ip": ip, "port": port, "latency": lat}


def select_gateway(ctx1f4, gateways):
    """并发探测 TCP 连通性，返回所有可达候选（按延迟升序）。"""
    logger.info("探测网关 TCP 连通性")
    if not gateways:
        return []
    with ThreadPoolExecutor(max_workers=min(len(gateways), 8)) as pool:
        futures = [pool.submit(probe_gateway, addr, port, ctx1f4) for addr, port in gateways]
        results = [r for f in as_completed(futures) if (r := f.result()) is not None]
    return sorted(results, key=lambda r: r["latency"])


def create_tun(name="cnem0"):
    TUNSETIFF = 0x400454CA
    IFF_TUN, IFF_NO_PI, IFF_TUN_EXCL = 0x0001, 0x1000, 0x8000
    if not re.fullmatch(r'[A-Za-z0-9_.-]{1,15}', name) or name in ('.', '..') or name.startswith('-'):
        raise SessionFailure('TUN 配置', '无效的 TUN 接口名称')
    # Kernel exclusivity prevents attaching to a persistent or concurrently created TUN.
    ifr = struct.pack("16sH22x", name.encode('ascii'), IFF_TUN | IFF_NO_PI | IFF_TUN_EXCL)
    fd = os.open("/dev/net/tun", os.O_RDWR)
    try:
        fcntl.ioctl(fd, TUNSETIFF, ifr)
    except BaseException:
        close_resource(os.close, fd)
        raise
    return fd, name


def run_cmd(args):
    result = subprocess.run(args, capture_output=True)
    if result.returncode:
        raise SessionFailure("TUN 配置", f"ip {args[1]} {args[2]} 失败（退出码 {result.returncode}）")


def negotiated_network(address, mask):
    network = ipaddress.IPv4Network(f'{address}/{mask}', strict=False)
    # ipaddress also accepts wildcard/host masks and numeric prefix lengths.
    if str(network.netmask) != mask:
        raise ValueError('invalid IPv4 netmask')
    return network


def implicit_broadcast_routes(network):
    # noprefixroute doesn't suppress local broadcast routes. Older Linux also
    # treats the subnet's first IP as a broadcast; /31 and /32 have neither.
    if network.prefixlen < 31:
        return (ipaddress.IPv4Network(network.broadcast_address),
                ipaddress.IPv4Network(network.network_address))
    return ()


def plan_tun(vip, extra_routes, gateway_ip):
    try:
        address = ipaddress.IPv4Address(vip['vip_ip'])
        if address.is_unspecified or address.is_loopback or address.is_multicast or int(address) == 0xffffffff:
            raise ValueError('invalid VIP')
        connected = negotiated_network(address, vip.get('mask'))
        routes = [connected]
        routes.extend(negotiated_network(net, mask) for net, mask in vip['routes'])
        routes.extend(parse_extra_route(route) for route in extra_routes)
        # Match the actual IPv4 endpoint, including literal forms inet_aton accepts.
        gateway = ipaddress.IPv4Address(socket.inet_aton(gateway_ip))
    except (ValueError, OSError) as exc:
        raise SessionFailure('TUN 配置', '无效的 IPv4 地址、掩码或路由') from exc
    if any(route.prefixlen == 0 or gateway in route for route in routes):
        raise SessionFailure('TUN 配置', '路由计划包含默认路由或覆盖当前 VPN 网关')
    for prefix in implicit_broadcast_routes(connected):
        if prefix in routes:
            raise SessionFailure('TUN 配置', f'IPv4 路由与隐式广播路由冲突：{prefix}')
    return ipaddress.IPv4Interface(f'{address}/{connected.prefixlen}'), tuple(dict.fromkeys(routes))


def check_route_conflicts(address, routes):
    implicit = (ipaddress.IPv4Network(address.ip), *implicit_broadcast_routes(address.network))
    for prefix in dict.fromkeys((*implicit, *routes)):
        result = subprocess.run(['ip', '-j', '-4', 'route', 'show', 'table', 'all', 'exact', str(prefix)],
                                capture_output=True, text=True, timeout=5)
        try:
            entries = json.loads(result.stdout) if result.returncode == 0 else None
        except (ValueError, TypeError):
            entries = None
        if not isinstance(entries, list):
            raise SessionFailure('TUN 配置', '无法检查现有 IPv4 路由')
        if entries:
            raise SessionFailure('TUN 配置', f'IPv4 路由冲突：{prefix}')


# ── 系统 DNS 管理（通过 openresolv/resolvconf 协调，与 NetworkManager 共存）──
# 依赖 openresolv 包（PKGBUILD depends）。使用独立的 VPN 标签（在 resolvconf 默认
# dynamic_order 中，VPN 标签通常自动排最前）。NetworkManager 需配置
# rc-manager=resolvconf（两者都走 resolvconf，互不覆盖）。
RESOLVCONF_IFACE = 'vpn-openunivpn'

def _resolvconf_available():
    """resolvconf 是否可用（依赖 openresolv）。缺失时跳过 DNS 注入，避免破坏网络。"""
    return shutil.which("resolvconf") is not None


def setup_dns(vpn_dns_list, backend='resolvconf', tun_name=None,
              resolvconf_iface=RESOLVCONF_IFACE, *, before_change=None):
    """将经隧道可达的 DNS 交给所选后端。"""
    if backend == 'dnsmasq':
        if dns_backend.activate(vpn_dns_list, tun_name, before_change=before_change):
            logger.info("dnsmasq 已切换为 VPN DNS: %s", vpn_dns_list)
        elif vpn_dns_list:
            logger.warning("没有可经 VPN 隧道路由的 DNS，保留原上游")
        return
    if not vpn_dns_list:
        return
    if not _resolvconf_available():
        logger.warning("openresolv(resolvconf) 未安装，跳过 VPN DNS 注入（不影响公网）")
        return
    servers = dns_backend.tunnel_dns_servers(vpn_dns_list, tun_name)
    if not servers:
        logger.warning("没有可经 VPN 隧道路由的 DNS，保留系统 DNS")
        return
    content = "\n".join(f"nameserver {d}" for d in servers) + "\n"
    if before_change is not None:
        before_change()
    subprocess.run(["resolvconf", "-a", resolvconf_iface], input=content,
                   capture_output=True, text=True).check_returncode()
    logger.info("VPN DNS 已通过 resolvconf 添加: %s", ', '.join(map(str, servers)))


def restore_dns(backend='resolvconf', resolvconf_iface=RESOLVCONF_IFACE):
    """Restore a backend whose state may have changed; propagate failures."""
    if backend == 'dnsmasq':
        dns_backend.restore()
        return
    subprocess.run(["resolvconf", "-d", resolvconf_iface],
                   capture_output=True, text=True).check_returncode()
    logger.info("VPN DNS 已从 resolvconf 移除")


@contextmanager
def session_dns(addresses, backend, tun_name, resolvconf_iface=RESOLVCONF_IFACE):
    changed = False
    failure = None

    def before_change():
        nonlocal changed
        changed = True

    try:
        try:
            setup_dns(addresses, backend, tun_name, resolvconf_iface,
                      before_change=before_change)
        except dns_backend.OwnershipConflict as exc:
            raise SessionFailure("DNS 配置", "dnsmasq 所有权冲突；请确认离线上游已恢复后再启动") from exc
        except (OSError, subprocess.SubprocessError, ValueError) as exc:
            if changed:
                raise SessionFailure("DNS 配置", f"切换 {backend} DNS 失败（{type(exc).__name__}）") from exc
            logger.warning("切换 %s DNS 失败，保留原 DNS（%s）", backend, type(exc).__name__)
        yield
    except BaseException as exc:
        failure = exc
        raise
    finally:
        if changed:
            try:
                restore_dns(backend, resolvconf_iface)
            except Exception as exc:
                reason = f"恢复 {backend} DNS 失败（{type(exc).__name__}）"
                if failure is None or (isinstance(failure, SessionFailure) and failure.retryable):
                    raise SessionFailure("DNS 清理", reason) from exc
                # A cleanup failure must not replace a terminal session failure.
                logger.error("%s", reason)


def gateway_tls_context(config):
    if config.get('tls_verify', True):
        return ssl.create_default_context(cafile=config.get('gateway_ca') or None)
    context = ssl.create_default_context()
    context.check_hostname = False
    context.verify_mode = ssl.CERT_NONE
    return context


def select_session_dns(config, advertised):
    configured = config.get('dns_servers', [])
    if not config.get('tls_verify', True):
        return configured
    if config.get('dns_backend') == 'dnsmasq':
        return configured or advertised
    return advertised


class StopRequest:
    """Signal handler writes only a flag; it never enters a lock or logs."""

    signum = None

    def request(self, signum, _frame):
        self.signum = signum

    def is_set(self):
        return self.signum is not None

    def wait(self, timeout):
        deadline = time.monotonic() + timeout
        while not self.is_set():
            remaining = deadline - time.monotonic()
            if remaining <= 0:
                break
            time.sleep(min(0.1, remaining))
        return self.is_set()


def main():
    logging.basicConfig(
        level=logging.INFO,
        format='%(asctime)s [%(levelname)s] %(message)s',
    )

    if os.geteuid() != 0:
        print("需要 root 权限 (TUN)")
        return EXIT_NO_RESTART

    # SIGTERM/SIGINT 请求主循环退出。
    stop_event = StopRequest()
    signal.signal(signal.SIGTERM, stop_event.request)
    signal.signal(signal.SIGINT, stop_event.request)

    try:
        config = load_config()
    except (ConfigError, OSError, ValueError) as exc:
        logger.error("配置读取失败（%s）；停止，不自动重试", type(exc).__name__)
        return EXIT_NO_RESTART

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
        return EXIT_NO_RESTART

    if not config.get('tls_verify', True):
        logger.warning("VPN 网关 TLS 身份校验已禁用；不接受网关下发的 DNS")
    try:
        result = run_vpn(config, stop_event)
        if stop_event.is_set():
            logger.info("收到信号 %s，连接已退出", stop_event.signum)
        return result
    except BaseException:
        # Last resort for an unexpected process-level failure. Normal session
        # cleanup runs before the TUN closes. dnsmasq only restores our claim.
        if config.get('dns_backend') == 'dnsmasq':
            try:
                restore_dns('dnsmasq')
            except Exception as exc:
                logger.error("恢复 dnsmasq DNS 失败（%s）", type(exc).__name__)
        raise


def run_vpn(config, stop_event):
    if stop_event.is_set():
        return 0
    try:
        context = gateway_tls_context(config)
    except (OSError, ValueError):
        logger.error("TLS 配置：无法加载 TLS 信任配置；停止，不自动重试")
        return EXIT_NO_RESTART
    delay = 3

    def on_ready():
        nonlocal delay
        delay = 3

    while not stop_event.is_set():
        try:
            candidates = select_gateway(0, config["gateways"])
        except Exception as exc:
            logger.error("网关探测异常（%s, errno=%s）；停止，不自动重试",
                         type(exc).__name__, getattr(exc, 'errno', None))
            return EXIT_NO_RESTART
        for gateway in candidates:
            if stop_event.is_set():
                return 0
            try:
                _run_session(config, context, stop_event, gateway, on_ready)
            except SessionFailure as exc:
                if stop_event.is_set() and exc.retryable:
                    return 0
                logger.warning("%s:%s %s：%s；%s", gateway['host'], gateway['port'],
                               exc.stage, exc, "可重试" if exc.retryable else "停止，不自动重试")
                if not exc.retryable:
                    return EXIT_NO_RESTART
            except Exception as exc:
                logger.error("%s:%s 本地或未知会话异常（%s, errno=%s）；停止，不自动重试",
                             gateway['host'], gateway['port'], type(exc).__name__, getattr(exc, 'errno', None))
                return EXIT_NO_RESTART
        if stop_event.is_set():
            break
        wait = min(60, delay * random.uniform(0.9, 1.1))
        logger.info("本轮无可用连接，%.1f 秒后重新探测网关", wait)
        if stop_event.wait(wait):
            break
        delay = min(60, delay * 2)
    return 0


class SessionFailure(Exception):
    def __init__(self, stage, reason, *, retryable=False):
        super().__init__(reason)
        self.stage = stage
        self.retryable = retryable


TRANSIENT_ERRNOS = {
    errno.ECONNABORTED, errno.ECONNREFUSED, errno.ECONNRESET, errno.EHOSTDOWN,
    errno.EHOSTUNREACH, errno.ENETDOWN, errno.ENETRESET, errno.ENETUNREACH,
    errno.EPIPE, errno.ETIMEDOUT, errno.ENOTCONN,
}
EXIT_NO_RESTART = 78
CMD_KICKOUT = 0x0008


@contextmanager
def network_io(stage):
    """Classify only network I/O, never local TUN/DNS errors by socket errno."""
    try:
        yield
    except ssl.SSLCertVerificationError:
        raise SessionFailure(stage, "TLS 证书校验失败") from None
    except (ssl.SSLEOFError, ssl.SSLZeroReturnError, socket.timeout, TimeoutError, EOFError):
        raise SessionFailure(stage, "传输超时或连接关闭", retryable=True) from None
    except ssl.SSLError:
        raise SessionFailure(stage, "TLS 协议异常") from None
    except OSError as exc:
        raise SessionFailure(stage, f"网络 I/O 异常（{type(exc).__name__}, errno={exc.errno}）",
                             retryable=exc.errno in TRANSIENT_ERRNOS) from None


def open_gateway_tls(context, gw, timeout, stage):
    with network_io(stage):
        raw = socket.create_connection((gw['ip'], gw['port']), timeout=timeout)
        try:
            return context.wrap_socket(raw, server_hostname=gw['host'])
        except BaseException:
            close_resource(raw.close)
            raise


def close_resource(close, *args):
    try:
        close(*args)
    except OSError as exc:
        logger.warning("关闭会话资源失败（%s, errno=%s）", type(exc).__name__, exc.errno)


@contextmanager
def session_socket(sock):
    try:
        yield sock
    finally:
        close_resource(sock.close)


def set_read_deadline(sock, deadline):
    remaining = deadline - time.monotonic()
    if remaining <= 0:
        raise TimeoutError
    sock.settimeout(remaining)


def authenticate(config, context, gw):
    # Master Auth is a separate short-lived TLS connection. Keep the request
    # unchanged; the only fields this client consumes are the magic and UID.
    with session_socket(open_gateway_tls(context, gw, 10, "认证连接")) as sock:
        username = config['username']
        query = urlencode([
            ('SelectLanguage', '0'),
            ('UserName', username),
            ('Password', config['password']),
            ('MacAddress', config.get('mac_address', '')),
            ('SVN_Seco_AaA', '1'),
        ])
        path = f"/netextension/netextensionlogin.html?{query}&"
        http_req = (f"GET {path} HTTP/1.1\r\n"
                    "Accept: image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, application/msword, application/vnd.ms-excel, application/vnd.ms-powerpoint, */*\r\n"
                    "Accept-Language: zh-cn\r\n"
                    "Accept-Encoding: gzip, deflate\r\n"
                    "User-Agent: Mozilla/4.0 (compatible; MSIE 6.0; NT 5.1; SV1; .NET CLR 2.0.50727)OS=Linux64\r\n"
                    f"Host: {gw['host']}\r\n"
                    "\r\n").encode()
        stage = "认证响应"
        magic = b"\xf0" * 4
        header = b""
        with network_io(stage):
            sock.sendall(http_req)
            deadline = time.monotonic() + 5
            while len(header) < 8:
                set_read_deadline(sock, deadline)
                chunk = sock.recv(8 - len(header))
                if not chunk:
                    raise EOFError
                header += chunk
                if len(header) >= 4 and header[:4] != magic:
                    raise SessionFailure(stage, "无法识别的认证响应协议")
        uid = struct.unpack(">I", header[4:8])[0]
        if uid == 0 or uid >= 0xFFFFF000:
            raise SessionFailure(stage, "认证拒绝")
        logger.info("NetExtension 认证成功")
        return uid


class CnemStream:
    """Preserve partial frames across reads and handshake/forwarding stages."""
    # Header + largest 16-bit payload + header lookahead for ambiguous lengths.
    MAX_HANDSHAKE_BUFFER = 16 + 0xffff + 16

    def __init__(self, sock):
        self.sock = sock
        self.buf = b""

    @staticmethod
    def _check_kickout(buf, stage):
        # A valid CNEM header suffices to recognize a KICKOUT, even if its
        # optional payload length cannot be inferred by the general parser.
        if (len(buf) >= 16 and buf[:4] == MAGIC_B
                and buf[12:14] == be16(CMD_KICKOUT)):
            raise SessionFailure(stage, "网关拒绝或踢出会话 (KICKOUT)")

    def check_buffered_kickout(self, stage):
        """Look only at frame boundaries, without consuming early DATA."""
        buf = self.buf
        while buf:
            self._check_kickout(buf, stage)
            try:
                cmd, _, buf = parse_cnem(buf)
            except ValueError:
                break  # The normal parser reports malformed frames.
            if cmd is None:
                break

    def pop(self, stage, *, only=None):
        self._check_kickout(self.buf, stage)
        try:
            cmd, payload, remaining = parse_cnem(self.buf)
        except ValueError:
            raise SessionFailure(stage, "CNEM 协议帧无效") from None
        if only is not None and cmd != only:
            return None, None
        self.buf = remaining
        return cmd, payload

    def receive(self, size):
        chunk = self.sock.recv(size)
        if not chunk:
            raise EOFError
        self.buf += chunk

    def expect(self, expected, stage, *, timeout, ignored=()):
        deadline = time.monotonic() + timeout
        while True:
            cmd, payload = self.pop(stage)
            if cmd == expected:
                return payload
            if cmd in ignored:
                continue
            if cmd is not None:
                raise SessionFailure(stage, "非预期或无法解析的 CNEM 协议帧")
            room = self.MAX_HANDSHAKE_BUFFER - len(self.buf)
            if room <= 0:
                raise SessionFailure(stage, "CNEM 握手帧超过缓冲上限或无法解析")
            set_read_deadline(self.sock, deadline)
            self.receive(min(65536, room))


def negotiate(sock, stream, gw, ctx1f4, stop_event):
    with session_socket(socket.socket(socket.AF_INET, socket.SOCK_DGRAM)) as udp:
        try:
            udp.connect((gw['ip'], gw['port']))
            udp.settimeout(2)
        except OSError:
            logger.warning("UDP 探测 socket 连接失败；继续 TLS 握手")

        with network_io("ACL 握手"):
            sock.settimeout(30)
            sock.sendall(cnem_frame(CMD_ACL, extra_be32=0, ctx1f4=ctx1f4))
            stream.expect(CMD_ACL, "ACL 握手", timeout=30)
        with network_io("REQVIP 握手"):
            sock.settimeout(15)
            sock.sendall(cnem_frame(CMD_REQVIP, ctx1f4=ctx1f4))
            reply = stream.expect(CMD_REQVIP, "REQVIP 握手", timeout=15, ignored=(CMD_ACL, CMD_KEEPALIVE))
            vip = parse_netcfg(reply)
            if not vip:
                raise SessionFailure("REQVIP 握手", "CNEM 网络配置无效")

        for cmd in (CMD_UDP_AVAILABLE, CMD_DATA_CONNECT):
            stage = f"CNEM 握手 0x{cmd:04x}"
            stream.check_buffered_kickout(stage)
            with network_io(stage):
                sock.settimeout(30)
                sock.sendall(cnem_frame(cmd, payload=be32(4), ctx1f4=ctx1f4))
                sock.settimeout(2)
                try:
                    if stream.pop(stage, only=cmd)[0] is None:
                        stream.receive(65536)
                        stream.check_buffered_kickout(stage)
                        stream.pop(stage, only=cmd)
                except (socket.timeout, TimeoutError):
                    # Optional acknowledgements; a read timeout alone is normal.
                    pass

        if stop_event.wait(1):
            return None
        with network_io("TLS UDP 探测"):
            sock.settimeout(30)
            sock.sendall(cnem_frame(CMD_UDP_DETECT, ctx1f4=ctx1f4))
        udp_detect = (struct.pack("<I", 0xBEEFFCFE) + bytes.fromhex("c192a4d6")
                      + struct.pack("<I", 0x1000021c) + be32(ctx1f4) + os.urandom(13))
        try:
            udp.sendto(udp_detect, (gw['ip'], gw['port']))
        except OSError:
            logger.warning("UDP 探测发送失败；继续使用 TLS")
        if not stop_event.wait(2):
            return vip
    return None


def _run_session(config, context, stop_event, gw, on_ready):
    ctx1f4 = authenticate(config, context, gw)
    if stop_event.is_set():
        return
    with session_socket(open_gateway_tls(context, gw, 15, "CNEM 连接")) as sock:
        stream = CnemStream(sock)
        try:
            vip = negotiate(sock, stream, gw, ctx1f4, stop_event)
        except SessionFailure as exc:
            if exc.retryable:
                stream.check_buffered_kickout(exc.stage)
            raise
        stream.check_buffered_kickout("CNEM 握手")
        if vip is None or stop_event.is_set():
            return
        backend = config.get('dns_backend', 'resolvconf')
        address, routes = plan_tun(vip, config.get('extra_routes', ()), gw['ip'])
        check_route_conflicts(address, routes)
        if stop_event.is_set():
            return
        tun_fd, tun_name = create_tun(config['tun_name'])
        try:
            run_cmd(["ip", "link", "set", "dev", tun_name, "up"])
            run_cmd(["ip", "addr", "add", str(address), "dev", tun_name, "noprefixroute"])
            for route in routes:
                run_cmd(["ip", "route", "add", str(route), "dev", tun_name])
            if stop_event.is_set():
                return
            dns = select_session_dns(config, vip['dns'])
            with session_dns(dns, backend, tun_name, config.get('resolvconf_iface', RESOLVCONF_IFACE)):
                on_ready()
                logger.info("已连接 %s:%s (%.0fms)，TUN=%s VIP=%s", gw['host'], gw['port'],
                            gw['latency'], tun_name, vip['vip_ip'])
                _forward(sock, stream, tun_fd, ctx1f4, stop_event)
        finally:
            # DNS cleanup runs first. Closing the fd removes the TUN and its routes.
            close_resource(os.close, tun_fd)


def _forward(sock, stream, tun_fd, ctx1f4, stop_event):
    done = threading.Event()
    sock_lock = threading.Lock()
    failures = []
    sock.settimeout(5)

    def send(frame, stage):
        with sock_lock, network_io(stage):
            if not done.is_set():
                sock.sendall(frame)

    def send_keepalive():
        next_keepalive = time.monotonic()
        while not done.wait(KEEPALIVE_CHECK_INTERVAL):
            if time.monotonic() >= next_keepalive:
                send(cnem_frame(CMD_DATA_CONNECT, payload=be32(4), ctx1f4=ctx1f4), "保活发送")
                next_keepalive = time.monotonic() + KEEPALIVE_IDLE_TIMEOUT

    def tun_to_tls():
        while not done.is_set():
            ready, _, _ = select.select([tun_fd], [], [], 1)
            if ready and not done.is_set():
                packet = os.read(tun_fd, 65536)
                if packet:
                    send(cnem_frame(CMD_DATA, packet, ctx1f4=ctx1f4), "TLS 数据发送")

    def tls_to_tun():
        while not done.is_set():
            cmd, payload = stream.pop("TLS 数据接收")
            if cmd is None:
                with network_io("TLS 数据接收"):
                    try:
                        stream.receive(65536)
                    except (BlockingIOError, socket.timeout, TimeoutError):
                        # Traffic need not elicit a reply; silence is not failure.
                        continue
            elif cmd == CMD_DATA and payload:
                os.write(tun_fd, payload)

    def worker(target):
        try:
            target()
        except Exception as exc:
            # Preserve parsed terminal failures even if another worker just
            # observed a transport error. Ignore shutdown-induced I/O errors.
            if not done.is_set() or (isinstance(exc, SessionFailure) and not exc.retryable):
                failures.append(exc)
        finally:
            done.set()

    threads = []
    try:
        for target in (tls_to_tun, tun_to_tls, send_keepalive):
            thread = threading.Thread(target=worker, args=(target,), daemon=True)
            thread.start()
            threads.append(thread)
        while not stop_event.is_set() and not done.wait(0.5):
            pass
    finally:
        done.set()
        try:
            sock.shutdown(socket.SHUT_RDWR)
        except OSError:
            pass
        finally:
            for thread in threads:
                thread.join()

    if failures and not stop_event.is_set():
        failure = next((exc for exc in failures
                        if not isinstance(exc, SessionFailure) or not exc.retryable), failures[0])
        if isinstance(failure, SessionFailure) and failure.retryable:
            stream.check_buffered_kickout(failure.stage)
        raise failure


if __name__ == "__main__":
    sys.exit(main())
