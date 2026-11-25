"""OpenUniVPN 配置管理

配置文件路径 (优先级):
  1. 环境变量 OPENUNIVPN_CONFIG
  2. ~/.config/openunivpn/config.conf  (用户级)
  3. /etc/openunivpn/config.conf       (系统级)

会话文件: ~/.local/share/openunivpn/session.json
"""

import os
import re
import sys
import configparser
import ipaddress
import uuid

USER_CONFIG = os.path.expanduser('~/.config/openunivpn/config.conf')
SYSTEM_CONFIG = '/etc/openunivpn/config.conf'
DATA_DIR = os.path.expanduser('~/.local/share/openunivpn')
SESSION_FILE = os.path.join(DATA_DIR, 'session.json')


def _find_config():
    paths = [
        os.environ.get('OPENUNIVPN_CONFIG', ''),
        USER_CONFIG,
        SYSTEM_CONFIG,
    ]
    for p in paths:
        if p and os.path.exists(p):
            return p
    return None


def parse_extra_route(route):
    _, sep, prefix = route.partition('/')
    try:
        if not (sep and prefix.isascii() and prefix.isdecimal()):
            raise ValueError
        network = ipaddress.IPv4Network(route)
        if network.prefixlen == 0:
            raise ValueError
    except ValueError:
        raise ValueError('[tun] extra_routes requires non-default IPv4 network CIDRs') from None
    return network


def parse_mac_address(value):
    """Return a gateway-compatible MAC string, deriving one when omitted."""
    raw = value.strip()
    if not raw:
        raw = f'{uuid.getnode():012x}'
    compact = re.sub(r'[:-]', '', raw)
    if not re.fullmatch(r'[0-9A-Fa-f]{12}', compact):
        raise ValueError('[auth] mac_address requires six hexadecimal octets')
    return '-'.join(compact[index:index + 2].upper() for index in range(0, 12, 2))


def _parse_config(path):
    """解析 INI 格式配置文件"""
    c = configparser.RawConfigParser()
    c.read(path)
    dns_backend = c.get('dns', 'backend', fallback='resolvconf').strip().lower()
    if dns_backend not in ('resolvconf', 'dnsmasq'):
        raise ValueError('[dns] backend must be resolvconf or dnsmasq')
    tls_verify = c.getboolean('gateway', 'tls_verify', fallback=True)
    dns_servers = []
    if dns_backend == 'dnsmasq' or not tls_verify:
        for raw in c.get('dns', 'servers', fallback='').split(','):
            if raw.strip():
                ip = ipaddress.IPv4Address(raw.strip())
                if ip.is_unspecified or ip.is_loopback or ip.is_multicast:
                    raise ValueError('[dns] servers must be unicast VPN IPv4 addresses')
                dns_servers.append(str(ip))
    if dns_backend == 'dnsmasq' and not tls_verify and not dns_servers:
        raise ValueError('[dns] servers is required when dnsmasq is used with tls_verify=false')

    gateways_raw = c.get('gateway', 'list', fallback='')
    gateways = []
    if gateways_raw:
        for pair in gateways_raw.split(','):
            pair = pair.strip()
            if not pair:
                continue
            # 格式: 地址:端口，地址可为域名或 IP，端口缺省 443
            addr, sep, port_text = pair.partition(':')
            addr, port_text = addr.strip(), port_text.strip()
            if not addr or any(c.isspace() for c in addr):
                raise ValueError('[gateway] list requires a hostname or IPv4 address')
            if sep and not (port_text.isascii() and port_text.isdecimal()):
                raise ValueError('[gateway] list requires a numeric port after colon')
            port = int(port_text) if sep else 443
            if not 1 <= port <= 65535:
                raise ValueError('[gateway] list port must be in 1..65535')
            gateways.append((addr, port))

    extra_routes = [str(parse_extra_route(raw.strip()))
                    for raw in c.get('tun', 'extra_routes', fallback='').split(',') if raw.strip()]
    return {
        'username': c.get('auth', 'username', fallback=''),
        'password': c.get('auth', 'password', fallback=''),
        'mac_address': parse_mac_address(c.get('auth', 'mac_address', fallback='')),
        'gateways': gateways,
        'tun_name': c.get('tun', 'name', fallback='cnem0'),
        'extra_routes': extra_routes,
        'dns_backend': dns_backend,
        'dns_servers': dns_servers,
        'resolvconf_iface': c.get('dns', 'resolvconf_iface', fallback='vpn-openunivpn').strip(),
        'tls_verify': tls_verify,
        'gateway_ca': c.get('gateway', 'ca_file', fallback='').strip(),
    }


def load_config():
    path = _find_config()
    if path:
        return _parse_config(path)
    return {'username': '', 'password': '', 'mac_address': parse_mac_address(''),
            'gateways': [], 'tun_name': 'cnem0', 'extra_routes': [],
            'resolvconf_iface': 'vpn-openunivpn'}


def setup_wizard():
    """交互式配置向导

    在非交互环境（systemd、CI、管道输入）下立即返回 False，
    避免挂起等待终端输入。
    """
    # 检测 stdin 是否为交互式终端
    if not sys.stdin.isatty():
        print("[!] 非交互环境，无法运行配置向导。", file=sys.stderr)
        print(f"    请手动编辑 {USER_CONFIG} 或 {SYSTEM_CONFIG}", file=sys.stderr)
        return False

    os.makedirs(os.path.dirname(USER_CONFIG), exist_ok=True)

    print("OpenUniVPN — 首次配置\n")

    username = input("用户名: ").strip()
    password = input("密码: ").strip()
    print()

    print("网关列表 (每行一个, 格式: host[:port], 空行结束)")
    print("  例: vpn.example.com:443（端口可省略，默认 443）")
    gateways = []
    while True:
        line = input(f"  网关 #{len(gateways)+1}: ").strip()
        if not line:
            break
        gateways.append(line)

    if not gateways:
        print("[!] 至少需要一个网关")
        return False

    # 写入配置（含明文密码，文件权限设为仅属主可读写）
    c = configparser.RawConfigParser()
    c['auth'] = {'username': username, 'password': password}
    c['gateway'] = {'list': ','.join(gateways)}
    c['tun'] = {'name': 'cnem0'}

    with open(USER_CONFIG, 'w') as f:
        c.write(f)
    os.chmod(USER_CONFIG, 0o600)

    # 创建数据目录
    os.makedirs(DATA_DIR, exist_ok=True)

    print(f"\n✓ 配置已保存: {USER_CONFIG} (权限 600)")
    return True
