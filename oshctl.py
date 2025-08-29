#!/usr/bin/env python3
import sys
import os
import shutil
import pathlib

HOSTS_FILE = "/etc/hosts"
MARKER = "# [oshd] tmp\n"

def hosts_starts_with_noclear():
    try:
        with open("/etc/systemd/system/oshd-clean.service", "r") as f:
            first_line = f.readline().strip()
        return first_line == "# oshd-noclear"
    except FileNotFoundError:
        return False

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

def main():
    if len(sys.argv) < 2:
        print("Usage: oshctl [add|rm|clear|service] ...")
        return
    
    cmd = sys.argv[1]

    if cmd == "add":
        if len(sys.argv) < 4:
            print("Usage: oshctl add <host[:tmp]> <ip|alias>")
            return
        raw_host, ip = sys.argv[2], sys.argv[3]
        tmp = False
        if raw_host.endswith(":tmp"):
            host = raw_host.split(":")[0]
            tmp = True
        else:
            host = raw_host
        add_entry(host, ip, tmp)

    elif cmd == "rm":
        if len(sys.argv) < 3:
            print("Usage: oshctl rm <host>")
            return
        rm_entry(sys.argv[2])

    elif cmd == "clear":
        clear_tmp()

    elif cmd == "service":
        if hosts_starts_with_noclear():
            print("Service management disabled (did you install from an package library?)")
            return
        if len(sys.argv) < 3:
            print("Usage: oshctl service [install|uninstall]")
            return
        action = sys.argv[2]
        if action == "install":
            with open("/etc/systemd/system/oshd-clean.service", "w") as f:
                f.write(f"""[Unit]
Description=Clean temporary /etc/hosts entries from oshd
DefaultDependencies=no
Before=shutdown.target reboot.target halt.target poweroff.target

[Service]
Type=oneshot
ExecStart={pathlib.Path(__file__).resolve()} clear

[Install]
WantedBy=halt.target reboot.target shutdown.target poweroff.target
""")
            os.system("systemctl daemon-reload")
            print("It is reccomended to now enable and start oshd-clean.service.")
        elif action == "uninstall":
            if os.path.exists("etc/systemd/system/oshd-clean.service"):
                os.system("systemctl disable --now oshd-clean.service")
                os.remove("/etc/systemd/system/oshd-clean.service")
                os.system("systemctl daemon-reload")

if __name__ == "__main__":
    main()

