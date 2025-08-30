#!/usr/bin/env python3
import os
import sys
import socket
import pwd
import grp
import signal

HOSTS_FILE = "/etc/hosts"
MARKER = "# [oshd] tmp\n"
SOCKET_PATH = "/run/oshd.sock"

# --- Hosts editing functions ---
def add_entry(host, ip, tmp=False):
    entry = f"{ip}\t{host}"
    if tmp:
        entry += f"\t{MARKER.strip()}"
    with open(HOSTS_FILE, "a") as f:
        f.write(entry + "\n")

def rm_entry(host):
    lines = []
    with open(HOSTS_FILE, "r") as f:
        for line in f:
            if host not in line.split():
                lines.append(line)
    with open(HOSTS_FILE, "w") as f:
        f.writelines(lines)

def clear_tmp():
    lines = []
    with open(HOSTS_FILE, "r") as f:
        for line in f:
            if MARKER.strip() not in line:
                lines.append(line)
    with open(HOSTS_FILE, "w") as f:
        f.writelines(lines)

# --- Command handler (shared by daemon and one-shot) ---
def handle_command(cmd_line):
    parts = cmd_line.strip().split()
    if not parts:
        return b"ERROR: empty command"

    cmd = parts[0].lower()

    if cmd == "add":
        if len(parts) < 3:
            return b"ERROR: usage: add <host[:tmp]> <ip>"
        raw_host, ip = parts[1], parts[2]
        tmp = False
        if raw_host.endswith(":tmp"):
            host = raw_host.split(":")[0]
            tmp = True
        else:
            host = raw_host
        add_entry(host, ip, tmp)
        return b"OK"

    elif cmd == "rm":
        if len(parts) < 2:
            return b"ERROR: usage: rm <host>"
        rm_entry(parts[1])
        return b"OK"

    elif cmd == "clean":
        clear_tmp()
        return b"OK"
    elif cmd == "list":
        with open(HOSTS_FILE) as f: print(f.read())
    else:
        return b"ERROR: unknown command"
# --- Cleanup ---
def on_exit(signum, frame):
    print(f"Got signal {signum}, cleaning up...")
    clear_tmp()
    sys.exit(0)

# --- Daemon mode ---
def run_daemon():
    # Remove stale socket
    if os.path.exists(SOCKET_PATH):
        os.remove(SOCKET_PATH)

    server = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
    server.bind(SOCKET_PATH)
    os.chmod(SOCKET_PATH, 0o660)
    
    for sig in (signal.SIGTERM, signal.SIGINT, signal.SIGHUP):
        signal.signal(sig, on_exit)

    root_uid = pwd.getpwnam("root").pw_uid
    wheel_gid = grp.getgrnam("wheel").gr_gid
    os.chown(SOCKET_PATH, root_uid, wheel_gid)
    server.listen()
    print(f"oshd daemon listening on {SOCKET_PATH}...")

    while True:
        conn, _ = server.accept()
        with conn:
            try:
                data = conn.recv(1024)
                if not data:
                    continue
                response = handle_command(data.decode())
                conn.sendall(response)
            except Exception as e:
                conn.sendall(f"ERROR: {e}".encode())

# --- One-shot mode ---
def run_command_directly(argv):
    cmd_line = " ".join(argv[1:])
    response = handle_command(cmd_line)
    print(response.decode())

# --- Entry point ---
if __name__ == "__main__":
    if len(sys.argv) == 1:
        # No arguments → run daemon
        run_daemon()
    else:
        # Arguments → treat as direct command (one-shot)
        run_command_directly(sys.argv)

