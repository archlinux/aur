"""Opt-in exclusive upstream switching for a local dnsmasq."""
from contextlib import contextmanager
import fcntl
import ipaddress
import json
import os
import subprocess
import tempfile
from pathlib import Path
from uuid import uuid4

ACTIVE = Path('/run/openunivpn-dns.servers')
OFFLINE = Path('/etc/openunivpn/dnsmasq-offline.servers')
PROCESS_TOKEN = uuid4().hex


class OwnershipConflict(OSError):
    """Existing DNS state cannot safely be adopted by a new session."""


def reload_dnsmasq():
    subprocess.run(['/usr/bin/systemctl', 'reload', 'dnsmasq.service'], check=True, timeout=15)


def replace_active(content=None):
    with tempfile.TemporaryDirectory(dir=ACTIVE.parent, prefix='.openunivpn-dns-') as directory:
        staged = Path(directory) / 'servers'
        if content is None:
            staged.symlink_to(OFFLINE)
        else:
            staged.write_text(content, encoding='ascii')
            staged.chmod(0o644)
        os.replace(staged, ACTIVE)


def process_owner():
    return f'{os.getpid()}:{PROCESS_TOKEN}'


@contextmanager
def locked_claim():
    # Never remove the lock file: waiters must all lock the same inode.
    lock = ACTIVE.with_name(ACTIVE.name + '.lock')
    with lock.open('a') as stream:
        fcntl.flock(stream, fcntl.LOCK_EX)
        yield ACTIVE.with_name(ACTIVE.name + '.owner')


def write_claim(path, claim):
    with tempfile.TemporaryDirectory(dir=path.parent, prefix='.openunivpn-dns-') as directory:
        staged = Path(directory) / 'owner'
        staged.write_text(json.dumps(claim), encoding='ascii')
        os.replace(staged, path)


def routed_to_tunnel(ip, tun_name):
    if not tun_name:
        return False
    result = subprocess.run(['/usr/bin/ip', '-j', 'route', 'get', str(ip)],
                            capture_output=True, text=True, timeout=5)
    if result.returncode != 0:
        return False
    routes = json.loads(result.stdout)
    return (len(routes) == 1 and routes[0].get('dev') == tun_name
            and routes[0].get('type', 'unicast') == 'unicast')


def tunnel_dns_servers(addresses, tun_name):
    servers = []
    for address in addresses:
        try:
            ip = ipaddress.ip_address(address)
        except ValueError:
            continue
        if ip.version != 4 or ip.is_unspecified or ip.is_loopback or ip.is_multicast or ip in servers:
            continue
        if routed_to_tunnel(ip, tun_name):
            servers.append(ip)
    return servers


def activate(addresses, tun_name, *, before_change=None):
    with locked_claim() as path:
        # Even an offline symlink or an empty DNS list doesn't make a pending
        # claim safe: the previous owner may not have reloaded dnsmasq yet.
        if os.path.lexists(path):
            raise OwnershipConflict('dnsmasq upstreams already claimed')
        offline_link = ACTIVE.is_symlink() and ACTIVE.readlink() == OFFLINE
        if not offline_link and os.path.lexists(ACTIVE):
            raise OwnershipConflict('unrecognized dnsmasq runtime servers file')
        servers = tunnel_dns_servers(addresses, tun_name)
        if not servers:
            return False
        if not offline_link or not OFFLINE.is_file():
            raise OSError('dnsmasq integration not ready: expected the offline servers file and its runtime symlink')
        claim = dict(process=process_owner(), invocation=os.getenv('INVOCATION_ID'), restoring=False)
        # Publish ownership before touching ACTIVE so a killed process can be recovered.
        write_claim(path, claim)
        try:
            if before_change is not None:
                before_change()
            replace_active(''.join(f'server={ip}\n' for ip in servers))
            reload_dnsmasq()
        except (OSError, subprocess.SubprocessError):
            if before_change is None:
                restore_claim(path, claim)
            raise
    return True


def restore_claim(path, claim):
    """Recover an already matched claim while holding its lock."""
    if ACTIVE.is_symlink():
        if ACTIVE.readlink() != OFFLINE or not OFFLINE.is_file():
            raise OSError('dnsmasq offline servers symlink is invalid')
        if not claim['restoring']:
            # Activation died before replacing the offline symlink.
            path.unlink()
            return
    elif ACTIVE.is_file():
        if not OFFLINE.is_file():
            raise OSError('dnsmasq offline servers file is missing')
        # Mark the rollback before replacing ACTIVE. A crash or failed reload
        # after the symlink is back still needs another reload.
        write_claim(path, {**claim, 'restoring': True})
        replace_active()
    else:
        raise OSError('dnsmasq runtime servers file is missing')
    reload_dnsmasq()
    path.unlink()


def restore_owned(key, value):
    with locked_claim() as path:
        try:
            claim = json.loads(path.read_text(encoding='ascii'))
        except FileNotFoundError:
            return
        if claim[key] == value:
            restore_claim(path, claim)


def restore():
    restore_owned('process', process_owner())


def restore_for_invocation():
    invocation = os.getenv('INVOCATION_ID')
    if invocation:
        restore_owned('invocation', invocation)


if __name__ == '__main__':
    restore_for_invocation()
