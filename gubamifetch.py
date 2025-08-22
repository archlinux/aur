
#!/usr/bin/env python3
import os
import subprocess
import shutil
from textwrap import wrap
import time

def print_logo():
    logo = [
        "⠀⠀⠀⠀⠀⠀⠀⢀⣀⡀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⢀⣶⠿⠉⠉⠑⠲⠾⠟⡏⢩⠻⣦⣀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⢀⣤⡞⠉⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠃⠙⢿⣄⠀⠀⠀",
        "⠀⠀⢀⠞⠉⠂⠀⠀⡀⢰⣀⣰⣰⣄⣆⠀⠀⠀⠀⠀⠻⣄⡀⠀",
        "⠐⠺⡧⣧⣵⡤⡬⠶⠾⠿⠭⠭⠬⠭⠿⠿⠶⠤⠤⣶⢾⣾⡟⠒",
        "⠀⠀⠹⡏⣟⡌⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠄⠀⠀⢠⣏⡜⠁⠀",
        "⠀⠀⠀⠈⠻⣧⢀⠀⠀⠀⠀⠀⠃⠀⠀⠀⠀⠀⢠⣧⠎⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠙⠓⢬⣄⣀⣀⣆⣀⣤⣠⣴⠶⠛⠁⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠙⠛⠋⠉⠁⠀⠀⠀⠀⠀⠀⠀"
    ]
    return logo

def run_cmd(cmd):
    try:
        return subprocess.check_output(cmd, shell=True, text=True).strip()
    except:
        return None

def get_cpu_usage():
    try:
        with open("/proc/stat") as f:
            line = f.readline()
        parts = line.split()
        total1 = sum(map(int, parts[1:]))
        idle1 = int(parts[4])
        time.sleep(0.1)
        with open("/proc/stat") as f:
            line = f.readline()
        parts = line.split()
        total2 = sum(map(int, parts[1:]))
        idle2 = int(parts[4])
        total_diff = total2 - total1
        idle_diff = idle2 - idle1
        usage = 100 * (total_diff - idle_diff) / total_diff if total_diff != 0 else 0
        return f"{usage:.0f}%"
    except:
        return "N/A"

def get_info():
    info = {}

    os_desc = run_cmd("lsb_release -d") or ""
    if os_desc:
        os_desc = os_desc.split(":",1)[1].strip()
    else:
        os_desc = ""
    if not os_desc and os.path.exists("/etc/os-release"):
        with open("/etc/os-release") as f:
            for line in f:
                if line.startswith("PRETTY_NAME="):
                    os_desc = line.split("=",1)[1].strip().strip('"')
                    break
    info["OS"] = os_desc or "N/A"

    info["Kernel"] = run_cmd("uname -r") or "N/A"
    info["Hostname"] = run_cmd("hostname") or "N/A"
    info["Uptime"] = run_cmd("uptime -p") or "N/A"
    shell = os.environ.get("SHELL","")
    info["Shell"] = os.path.basename(shell) if shell else "N/A"
    res = run_cmd("xrandr | grep '*' | awk '{print $1}' | head -n1")
    info["Resolution"] = res or "N/A"
    de = os.environ.get("XDG_CURRENT_DESKTOP","")
    if not de:
        de = run_cmd("wmctrl -m 2>/dev/null | grep Name | cut -d ':' -f2 | sed 's/^ *//'") or ""
    info["DE / WM"] = de or "N/A"
    gtk = run_cmd("gsettings get org.gnome.desktop.interface gtk-theme 2>/dev/null")
    icon = run_cmd("gsettings get org.gnome.desktop.interface icon-theme 2>/dev/null")
    wm = run_cmd("gsettings get org.gnome.desktop.wm.preferences theme 2>/dev/null")
    info["WM Theme"] = wm.strip("'") if wm else "N/A"
    info["GTK Theme"] = gtk.strip("'") if gtk else "N/A"
    info["Icon Theme"] = icon.strip("'") if icon else "N/A"
    cpu = ""
    try:
        with open("/proc/cpuinfo") as f:
            for line in f:
                if line.startswith("model name"):
                    cpu = line.split(":",1)[1].strip()
                    break
    except:
        cpu = "N/A"
    info["CPU"] = cpu or "N/A"
    gpu = run_cmd("lspci | grep -i 'vga\\|3d\\|2d' | cut -d ':' -f3 | sed 's/^ *//' | paste -sd '; ' -")
    info["GPU"] = gpu or "N/A"
    ram = run_cmd("free -h | awk '/Mem:/ {print $3 \" / \" $2}'")
    info["RAM Usage"] = ram or "N/A"
    swap = run_cmd("free -h | awk '/Swap:/ {print $3 \" / \" $2}'")
    info["Swap Usage"] = swap or "N/A"
    disks_out = run_cmd("df -h --output=target,used,size -x tmpfs -x devtmpfs")
    disks = []
    if disks_out:
        lines = disks_out.splitlines()[1:]
        for l in lines:
            t,u,s = l.split()
            if t == "/" or t.startswith("/mnt"):
                disks.append(f"{t}: {u} / {s}")
    info["Disks"] = disks or ["N/A"]
    info["Terminal"] = os.environ.get("TERM", "N/A")
    battery = ""
    acpi_out = run_cmd("acpi -b")
    if acpi_out and "No support" not in acpi_out:
        battery = acpi_out.split(",")[1].strip()
    else:
        upower_bat = run_cmd("upower -i $(upower -e | grep BAT)")
        if upower_bat:
            for line in upower_bat.splitlines():
                if "percentage" in line:
                    battery = line.split(":")[1].strip()
                    break
    if battery:
        info["Battery"] = battery
    locale = os.environ.get("LANG", "N/A")
    info["Locale"] = locale
    info["CPU Usage"] = get_cpu_usage()

    return info

def print_combined_view(info, width):
    logo = print_logo()
    logo_width = max(len(line) for line in logo)
    gap = 3
    key_width = max(len(k) for k in info.keys()) + 1
    value_width = width - logo_width - gap - key_width
    if value_width < 20:
        value_width = 20

    items = list(info.items())
    wrapped_items = []
    for k, v in items:
        if isinstance(v, list):
            v_str = "; ".join(v)
        else:
            v_str = str(v)
        wrapped = wrap(v_str, width=value_width, break_long_words=False, break_on_hyphens=False)
        if not wrapped:
            wrapped = [""]
        wrapped_items.append((k, wrapped))

    total_info_lines = sum(len(w_lines) for _, w_lines in wrapped_items)
    max_lines = max(len(logo), total_info_lines)

    info_lines = []
    for k, w_lines in wrapped_items:
        for i, line in enumerate(w_lines):
            if i == 0:
                info_lines.append((k, line))
            else:
                info_lines.append(("", line))

    for i in range(max_lines):
        logo_line = logo[i] if i < len(logo) else " " * logo_width
        if i < len(info_lines):
            k, val = info_lines[i]
            if logo_line.strip() == "":
                print(f"{' ' * (logo_width + gap + key_width)}{val}")
            else:
                print(f"{logo_line}{' ' * gap}\033[0;32m{k:<{key_width}}\033[0m{val}")
        else:
            print(logo_line)

def print_terminal_colors():
    colors = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
    blocks = []
    for c in colors:
        blocks.append(f"\033[48;5;{c}m  \033[0m")
    print("\nTerminal Colors: " + " ".join(blocks))

def main():
    width = shutil.get_terminal_size((80, 20)).columns
    info = get_info()
    print_combined_view(info, width)
    print_terminal_colors()

if __name__ == "__main__":
    main()
