#!/usr/bin/env python3
"""Quickemu TUI Manager - terminal interface for quickemu VMs."""

import argparse
import curses
import os
import re
import subprocess
import sys
import tarfile
import tempfile
import time
from pathlib import Path

QUICKEMU_DIR = Path(os.environ.get("QUICKEMU_DIR", "/home/spiriwind/Projects/quickemu"))
QUICKEMU_BIN = QUICKEMU_DIR / "quickemu"

# View states
VIEW_LIST = 0
VIEW_DETAIL = 1
VIEW_EDIT = 2

# Colors
C_NORMAL = 0
C_TITLE = 1
C_GREEN = 2
C_RED = 3
C_CYAN = 4
C_YELLOW = 5
C_DIM = 6
C_SELECTED = 7
C_BORDER = 8
C_EDIT_ACTIVE = 9

# Editable fields: (key, label, field_type, choices_or_default)
EDIT_FIELDS = [
    ("cpu_cores", "CPU 核数", "text", "auto 或数字 (如 2, 4)"),
    ("ram", "内存", "text", "如 4G, 8G, 16G"),
    ("disk_size", "磁盘容量", "text", "如 32G, 64G, 128G"),
    ("display", "显示后端", "choice", ["gtk", "sdl", "spice", "spice-app", "cocoa", "none"]),
    ("secureboot", "安全启动", "choice", ["off", "on"]),
    ("tpm", "TPM", "choice", ["off", "on"]),
    ("boot", "启动方式", "choice", ["efi", "bios"]),
    ("sound_card", "声卡", "choice", ["intel-hda", "ac97", "es1370", "sb16", "usb-audio", "virtio-sound-pci", "none"]),
    ("keyboard", "键盘", "choice", ["usb", "ps2", "virtio"]),
    ("keyboard_layout", "键盘布局", "text", "如 en-us, de, zh"),
    ("mouse", "鼠标", "choice", ["tablet", "ps2", "usb", "virtio"]),
    ("usb_controller", "USB 控制器", "choice", ["ehci", "xhci", "none"]),
    ("network", "网络", "text", "如 user, tap0, br0"),
    ("viewer", "查看器", "choice", ["spicy", "remote-viewer", "none"]),
    ("monitor", "监控", "choice", ["socket", "telnet", "none"]),
    ("serial", "串口", "choice", ["socket", "telnet", "none"]),
    ("extra_args", "附加参数", "text", "传给 QEMU 的额外参数"),
]

# Default values for fields not present in conf
FIELD_DEFAULTS = {
    "cpu_cores": "auto",
    "ram": "auto",
    "display": "gtk",
    "secureboot": "off",
    "tpm": "off",
    "boot": "efi",
    "sound_card": "intel-hda",
    "keyboard": "usb",
    "keyboard_layout": "en-us",
    "mouse": "tablet",
    "usb_controller": "ehci",
    "viewer": "spicy",
    "monitor": "socket",
    "serial": "",
    "network": "",
    "extra_args": "",
}


def init_colors():
    curses.start_color()
    curses.use_default_colors()
    curses.init_pair(C_TITLE, curses.COLOR_WHITE, -1)
    curses.init_pair(C_GREEN, curses.COLOR_GREEN, -1)
    curses.init_pair(C_RED, curses.COLOR_RED, -1)
    curses.init_pair(C_CYAN, curses.COLOR_CYAN, -1)
    curses.init_pair(C_YELLOW, curses.COLOR_YELLOW, -1)
    curses.init_pair(C_DIM, 8, -1)
    curses.init_pair(C_SELECTED, curses.COLOR_BLACK, curses.COLOR_CYAN)
    curses.init_pair(C_BORDER, 8, -1)
    curses.init_pair(C_EDIT_ACTIVE, curses.COLOR_BLACK, curses.COLOR_YELLOW)


def format_size(bytes_val):
    if not bytes_val:
        return "-"
    for unit in ["B", "KB", "MB", "GB", "TB"]:
        if bytes_val < 1024:
            return f"{bytes_val:.1f} {unit}" if unit != "B" else f"{bytes_val} B"
        bytes_val /= 1024
    return f"{bytes_val:.1f} PB"


def safe_addstr(win, y, x, text, attr=0):
    h, w = win.getmaxyx()
    if y < 0 or y >= h or x < 0:
        return
    max_w = w - x - 1
    if max_w <= 0:
        return
    try:
        win.addnstr(y, x, text, max_w, attr)
    except curses.error:
        pass


def parse_vm_conf(conf_path):
    text = conf_path.read_text(errors="ignore")
    def _get(key, default=None):
        m = re.search(rf'^{key}="?([^"\n]+)"?', text, re.MULTILINE)
        return m.group(1).strip('"') if m else default

    name = conf_path.stem
    guest_os = _get("guest_os", "unknown")
    disk_img = _get("disk_img")
    disk_size = _get("disk_size", "?")

    disk_used = None
    if disk_img:
        dp = QUICKEMU_DIR / disk_img
        if dp.exists():
            disk_used = dp.stat().st_size

    vm = {
        "name": name,
        "conf": str(conf_path),
        "guest_os": guest_os,
        "disk_img": disk_img,
        "disk_size": disk_size,
        "disk_used": disk_used,
        "cpu_cores": _get("cpu_cores", FIELD_DEFAULTS["cpu_cores"]),
        "ram": _get("ram", FIELD_DEFAULTS["ram"]),
        "macos_release": _get("macos_release"),
        "iso": _get("iso"),
        "img": _get("img"),
        "boot": _get("boot", FIELD_DEFAULTS["boot"]),
        "display": _get("display", FIELD_DEFAULTS["display"]),
        "secureboot": _get("secureboot", FIELD_DEFAULTS["secureboot"]),
        "tpm": _get("tpm", FIELD_DEFAULTS["tpm"]),
        "sound_card": _get("sound_card", FIELD_DEFAULTS["sound_card"]),
        "keyboard": _get("keyboard", FIELD_DEFAULTS["keyboard"]),
        "keyboard_layout": _get("keyboard_layout", FIELD_DEFAULTS["keyboard_layout"]),
        "mouse": _get("mouse", FIELD_DEFAULTS["mouse"]),
        "usb_controller": _get("usb_controller", FIELD_DEFAULTS["usb_controller"]),
        "network": _get("network", FIELD_DEFAULTS["network"]),
        "viewer": _get("viewer", FIELD_DEFAULTS["viewer"]),
        "monitor": _get("monitor", FIELD_DEFAULTS["monitor"]),
        "serial": _get("serial", FIELD_DEFAULTS["serial"]),
        "extra_args": _get("extra_args", FIELD_DEFAULTS["extra_args"]),
        "ssh_port": _get("ssh_port", ""),
        "spice_port": _get("spice_port", ""),
        "width": _get("width", ""),
        "height": _get("height", ""),
        "running": False,
    }
    return vm


def save_vm_conf(vm):
    """Write VM config back to .conf file, preserving shebang."""
    conf_path = Path(vm["conf"])
    old_text = conf_path.read_text(errors="ignore")
    shebang = ""
    for line in old_text.splitlines():
        if line.startswith("#!"):
            shebang = line
            break

    lines = []
    if shebang:
        lines.append(shebang)
    lines.append('')

    # Fields to write (order matters)
    write_fields = [
        "guest_os", "disk_img", "disk_size", "cpu_cores", "ram",
        "macos_release", "iso", "img", "boot", "display",
        "secureboot", "tpm", "sound_card", "keyboard", "keyboard_layout",
        "mouse", "usb_controller", "network", "viewer", "monitor",
        "serial", "ssh_port", "spice_port", "width", "height", "extra_args",
    ]

    for key in write_fields:
        val = vm.get(key)
        if val is None or val == "" or val == FIELD_DEFAULTS.get(key, ""):
            # Skip empty or default values, but always write essential ones
            if key in ("guest_os", "disk_img", "disk_size"):
                pass  # always write
            else:
                continue
        if " " in str(val) or '"' in str(val):
            lines.append(f'{key}="{val}"')
        else:
            lines.append(f'{key}={val}')

    lines.append('')
    conf_path.write_text('\n'.join(lines))


def is_vm_running(vm):
    # Check PID file: <vm_dir>/<vm_name>.pid
    pid_file = QUICKEMU_DIR / vm["name"] / f"{vm['name']}.pid"
    if pid_file.exists():
        try:
            pid = int(pid_file.read_text().strip())
            # Check if process is actually alive
            os.kill(pid, 0)
            return True
        except (ValueError, ProcessLookupError, PermissionError, OSError):
            # PID file stale or invalid
            return False
    return False


def find_vms():
    vms = []
    for conf in sorted(QUICKEMU_DIR.glob("*.conf")):
        vm = parse_vm_conf(conf)
        if vm:
            vm["running"] = is_vm_running(vm)
            vms.append(vm)
    return vms


def start_vm(vm):
    subprocess.Popen(
        [str(QUICKEMU_BIN), "--vm", vm["conf"]],
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
        start_new_session=True,
    )


def stop_vm(vm):
    subprocess.run(
        [str(QUICKEMU_BIN), "--vm", vm["conf"], "--kill"],
        capture_output=True, timeout=10,
    )


def get_snapshot_info(vm):
    try:
        r = subprocess.run(
            [str(QUICKEMU_BIN), "--vm", vm["conf"], "--snapshot", "info"],
            capture_output=True, text=True, timeout=15
        )
        return r.stdout.strip() if r.returncode == 0 else None
    except Exception:
        return None


def draw_box(win, y, x, w, h, title=""):
    win.attron(curses.color_pair(C_BORDER))
    win.addch(y, x, curses.ACS_ULCORNER)
    win.addch(y, x + w - 1, curses.ACS_URCORNER)
    win.addch(y + h - 1, x, curses.ACS_LLCORNER)
    win.addch(y + h - 1, x + w - 1, curses.ACS_LRCORNER)
    for i in range(1, w - 1):
        win.addch(y, x + i, curses.ACS_HLINE)
        win.addch(y + h - 1, x + i, curses.ACS_HLINE)
    for i in range(1, h - 1):
        win.addch(y + i, x, curses.ACS_VLINE)
        win.addch(y + i, x + w - 1, curses.ACS_VLINE)
    win.attroff(curses.color_pair(C_BORDER))
    if title:
        win.attron(curses.color_pair(C_CYAN) | curses.A_BOLD)
        win.addstr(y, x + 2, f" {title} ")
        win.attroff(curses.color_pair(C_CYAN) | curses.A_BOLD)


def draw_progress_bar(win, y, x, width, percent, color=C_CYAN):
    filled = int(width * min(percent, 100) / 100)
    win.attron(curses.color_pair(C_DIM))
    win.addstr(y, x, "[" + " " * width + "]")
    win.attroff(curses.color_pair(C_DIM))
    if filled > 0:
        bar = "█" * filled
        win.attron(curses.color_pair(color))
        win.addstr(y, x + 1, bar)
        win.attroff(curses.color_pair(color))
    pct_str = f"{percent:.0f}%"
    win.addstr(y, x + width + 2, pct_str)


# ─── List View ──────────────────────────────────────────────────────────────

def draw_list(stdscr, vms, selected, scroll_offset):
    h, w = stdscr.getmaxyx()

    # Header
    stdscr.attron(curses.color_pair(C_CYAN) | curses.A_BOLD)
    safe_addstr(stdscr, 0, 2, "⚡ Quickemu Manager")
    stdscr.attroff(curses.color_pair(C_CYAN) | curses.A_BOLD)

    running_count = sum(1 for v in vms if v["running"])
    total_disk = sum(v["disk_used"] or 0 for v in vms)
    info = f" {len(vms)} VMs | {running_count} running | disk: {format_size(total_disk)} "
    stdscr.attron(curses.color_pair(C_DIM))
    safe_addstr(stdscr, 0, w - len(info) - 1, info)
    stdscr.attroff(curses.color_pair(C_DIM))

    # Separator
    stdscr.attron(curses.color_pair(C_BORDER))
    stdscr.addstr(1, 0, "─" * w)
    stdscr.attroff(curses.color_pair(C_BORDER))

    if not vms:
        stdscr.attron(curses.color_pair(C_DIM))
        safe_addstr(stdscr, h // 2, w // 2 - 12, "No VMs found")
        safe_addstr(stdscr, h // 2 + 1, w // 2 - len(str(QUICKEMU_DIR)) // 2, str(QUICKEMU_DIR))
        stdscr.attroff(curses.color_pair(C_DIM))
        return

    selected = max(0, min(selected, len(vms) - 1))
    vm_start_y = 3
    vm_area_h = h - 6
    visible_count = max(1, vm_area_h // 4)

    if selected < scroll_offset:
        scroll_offset = selected
    if selected >= scroll_offset + visible_count:
        scroll_offset = selected - visible_count + 1

    for idx in range(scroll_offset, min(scroll_offset + visible_count, len(vms))):
        vm = vms[idx]
        y = vm_start_y + (idx - scroll_offset) * 4
        is_sel = idx == selected
        card_w = min(w - 4, 80)
        card_x = 2

        if is_sel:
            draw_box(stdscr, y - 1, card_x, card_w, 4, vm["name"])
        else:
            draw_box(stdscr, y - 1, card_x, card_w, 4)

        name_x = card_x + 2
        if is_sel:
            stdscr.attron(curses.color_pair(C_SELECTED) | curses.A_BOLD)
        else:
            stdscr.attron(curses.color_pair(C_TITLE) | curses.A_BOLD)
        safe_addstr(stdscr, y, name_x, vm["name"][:30])
        stdscr.attroff(curses.color_pair(C_SELECTED if is_sel else C_TITLE) | curses.A_BOLD)

        status_x = name_x + min(len(vm["name"]), 30) + 2
        if vm["running"]:
            stdscr.attron(curses.color_pair(C_GREEN) | curses.A_BOLD)
            safe_addstr(stdscr, y, status_x, "● RUNNING")
            stdscr.attroff(curses.color_pair(C_GREEN) | curses.A_BOLD)
        else:
            stdscr.attron(curses.color_pair(C_DIM))
            safe_addstr(stdscr, y, status_x, "○ stopped")
            stdscr.attroff(curses.color_pair(C_DIM))

        detail_y = y + 1
        os_str = vm["guest_os"]
        if vm.get("macos_release"):
            os_str += f" ({vm['macos_release']})"
        details = f"{os_str}  CPU: {vm['cpu_cores']}  RAM: {vm['ram']}  Disk: {vm['disk_size']}"
        stdscr.attron(curses.color_pair(C_DIM))
        safe_addstr(stdscr, detail_y, name_x, details[:card_w - 4])
        stdscr.attroff(curses.color_pair(C_DIM))

        if vm["disk_used"] and vm["disk_size"]:
            match = re.match(r"(\d+(?:\.\d+)?)(G|T|M)", vm["disk_size"])
            if match:
                num = float(match.group(1))
                unit_mult = {"T": 1024**4, "G": 1024**3, "M": 1024**2}.get(match.group(2), 1)
                total_bytes = num * unit_mult
                pct = (vm["disk_used"] / total_bytes) * 100
                bar_w = min(20, card_w - 50)
                draw_progress_bar(stdscr, detail_y, name_x + min(len(details), card_w - 4) + 2, bar_w, pct)

    if len(vms) > visible_count:
        scroll_info = f"[{selected + 1}/{len(vms)}]"
        stdscr.attron(curses.color_pair(C_DIM))
        safe_addstr(stdscr, vm_start_y, w - len(scroll_info) - 3, scroll_info)
        stdscr.attroff(curses.color_pair(C_DIM))


# ─── Detail View ────────────────────────────────────────────────────────────

def draw_detail(stdscr, vm, detail_scroll):
    h, w = stdscr.getmaxyx()
    pad_w = min(w - 4, 76)
    pad_x = 2

    draw_box(stdscr, 0, pad_x, pad_w, h - 1, f" {vm['name']} ")

    rows = []
    rows.append(("__header__", "基础信息"))
    rows.append(("名称", vm["name"]))
    rows.append(("类型", vm["guest_os"] + (f" ({vm['macos_release']})" if vm.get("macos_release") else "")))
    rows.append(("状态", "● 运行中" if vm["running"] else "○ 已停止"))
    rows.append(("配置文件", vm["conf"]))
    rows.append(("", ""))

    rows.append(("__header__", "硬件配置"))
    rows.append(("CPU 核数", vm["cpu_cores"]))
    rows.append(("内存", vm["ram"]))
    rows.append(("启动方式", vm["boot"]))
    rows.append(("显示后端", vm["display"]))
    rows.append(("安全启动", vm["secureboot"]))
    rows.append(("TPM", vm["tpm"]))
    rows.append(("声卡", vm["sound_card"]))
    rows.append(("键盘", f"{vm['keyboard']} ({vm['keyboard_layout']})"))
    rows.append(("鼠标", vm["mouse"]))
    rows.append(("USB 控制器", vm["usb_controller"]))
    rows.append(("查看器", vm["viewer"]))
    rows.append(("监控", vm["monitor"]))
    if vm["serial"]:
        rows.append(("串口", vm["serial"]))
    if vm["network"]:
        rows.append(("网络", vm["network"]))
    if vm["ssh_port"]:
        rows.append(("SSH 端口", vm["ssh_port"]))
    if vm["spice_port"]:
        rows.append(("SPICE 端口", vm["spice_port"]))
    if vm["extra_args"]:
        rows.append(("附加参数", vm["extra_args"]))
    rows.append(("", ""))

    rows.append(("__header__", "存储"))
    if vm["disk_img"]:
        rows.append(("磁盘镜像", vm["disk_img"]))
        rows.append(("磁盘容量", vm["disk_size"]))
        if vm["disk_used"]:
            rows.append(("实际占用", format_size(vm["disk_used"])))
    if vm["iso"]:
        rows.append(("ISO 镜像", vm["iso"]))
    if vm["img"]:
        rows.append(("恢复镜像", vm["img"]))

    # Snapshots
    rows.append(("", ""))
    rows.append(("__header__", "快照"))
    snap_info = get_snapshot_info(vm)
    if snap_info:
        for line in snap_info.splitlines()[:10]:
            rows.append(("", line.strip()))
    else:
        rows.append(("", "(无快照或无法获取)"))

    # Draw rows
    content_y = 2
    max_visible = h - 5
    if detail_scroll < 0:
        detail_scroll = 0

    for i, (label, value) in enumerate(rows[detail_scroll:], start=detail_scroll):
        y = content_y + (i - detail_scroll)
        if y >= h - 3:
            break

        if label == "__header__":
            safe_addstr(stdscr, y, pad_x + 2, f"── {value} ", curses.color_pair(C_CYAN) | curses.A_BOLD)
        elif label == "" and value == "":
            pass
        elif label:
            safe_addstr(stdscr, y, pad_x + 2, f"{label}: ", curses.color_pair(C_DIM))
            safe_addstr(stdscr, y, pad_x + 2 + len(label) + 2, str(value), curses.color_pair(C_TITLE))
        else:
            safe_addstr(stdscr, y, pad_x + 4, str(value), curses.color_pair(C_DIM))

    # Scroll indicator
    total = len(rows)
    if total > max_visible:
        pct = int(detail_scroll / max(1, total - max_visible) * 100)
        safe_addstr(stdscr, h - 2, pad_x + pad_w - 10, f"[{pct}%] ↑↓", curses.color_pair(C_DIM))


# ─── Edit View ──────────────────────────────────────────────────────────────

def draw_edit(stdscr, vm, edit_cursor, edit_mode, edit_input):
    h, w = stdscr.getmaxyx()
    pad_w = min(w - 4, 76)
    pad_x = 2

    draw_box(stdscr, 0, pad_x, pad_w, h - 1, f" 编辑: {vm['name']} ")

    # Column layout
    col1_x = pad_x + 2
    col2_x = pad_x + 28
    col3_x = pad_x + 50
    start_y = 2

    # Header
    safe_addstr(stdscr, start_y, col1_x, "字段", curses.color_pair(C_CYAN) | curses.A_BOLD)
    safe_addstr(stdscr, start_y, col2_x, "当前值", curses.color_pair(C_CYAN) | curses.A_BOLD)
    safe_addstr(stdscr, start_y, col3_x, "说明", curses.color_pair(C_CYAN) | curses.A_BOLD)
    stdscr.attron(curses.color_pair(C_BORDER))
    stdscr.addstr(start_y + 1, pad_x, "─" * pad_w)
    stdscr.attroff(curses.color_pair(C_BORDER))

    for i, (key, label, ftype, hint) in enumerate(EDIT_FIELDS):
        y = start_y + 2 + i
        if y >= h - 3:
            break

        is_sel = i == edit_cursor
        current_val = vm.get(key, FIELD_DEFAULTS.get(key, ""))
        if not current_val and key not in vm:
            current_val = FIELD_DEFAULTS.get(key, "(未设置)")

        # Highlight selected row
        if is_sel and edit_mode:
            # Editing mode
            safe_addstr(stdscr, y, col1_x, f"  {label}", curses.color_pair(C_EDIT_ACTIVE) | curses.A_BOLD)
            safe_addstr(stdscr, y, col2_x, edit_input + "█", curses.color_pair(C_EDIT_ACTIVE))
        elif is_sel:
            safe_addstr(stdscr, y, col1_x, f"▸ {label}", curses.color_pair(C_CYAN) | curses.A_BOLD)
            safe_addstr(stdscr, y, col2_x, str(current_val), curses.color_pair(C_YELLOW))
        else:
            safe_addstr(stdscr, y, col1_x, f"  {label}", curses.color_pair(C_DIM))
            safe_addstr(stdscr, y, col2_x, str(current_val), curses.color_pair(C_TITLE))

        # Hint column
        if is_sel:
            safe_addstr(stdscr, y, col3_x, str(hint)[:w - col3_x - 3], curses.color_pair(C_DIM))

    # Footer
    footer_y = h - 2
    stdscr.attron(curses.color_pair(C_BORDER))
    stdscr.addstr(footer_y - 1, pad_x, "─" * pad_w)
    stdscr.attroff(curses.color_pair(C_BORDER))

    if edit_mode:
        safe_addstr(stdscr, footer_y, pad_x + 2, "Enter:确认  Esc:取消  Tab:选择补全", curses.color_pair(C_YELLOW))
    else:
        safe_addstr(stdscr, footer_y, pad_x + 2, "↑↓:选择  Enter:编辑  Esc:返回  s:保存", curses.color_pair(C_DIM))


def handle_edit_key(key, vm, edit_cursor, edit_mode, edit_input, edit_choice_idx):
    """Returns (new_cursor, new_mode, new_input, new_choice_idx, action, quit_flag)"""
    action = None
    quit_flag = False

    if edit_mode:
        # Currently editing a field
        field_key, field_label, field_type, hint = EDIT_FIELDS[edit_cursor]

        if key == 27:  # Esc - cancel edit
            edit_mode = False
            edit_input = ""
        elif key in (curses.KEY_ENTER, 10, 13):  # Enter - confirm
            if edit_input:
                vm[field_key] = edit_input
            edit_mode = False
            edit_input = ""
        elif key == 9:  # Tab - cycle choices
            if field_type == "choice" and isinstance(hint, list):
                edit_choice_idx = (edit_choice_idx + 1) % len(hint)
                edit_input = hint[edit_choice_idx]
        elif key in (curses.KEY_BACKSPACE, 127, 8):
            edit_input = edit_input[:-1]
        elif 32 <= key <= 126:
            edit_input += chr(key)

    else:
        # Navigation mode
        if key == 27:  # Esc - back to detail
            quit_flag = True
        elif key == curses.KEY_UP or key == ord("k"):
            edit_cursor = max(0, edit_cursor - 1)
        elif key == curses.KEY_DOWN or key == ord("j"):
            edit_cursor = min(len(EDIT_FIELDS) - 1, edit_cursor + 1)
        elif key in (curses.KEY_ENTER, 10, 13):
            # Enter edit mode
            field_key, field_label, field_type, hint = EDIT_FIELDS[edit_cursor]
            edit_input = vm.get(field_key, FIELD_DEFAULTS.get(field_key, ""))
            if field_type == "choice" and isinstance(hint, list):
                try:
                    edit_choice_idx = hint.index(edit_input)
                except ValueError:
                    edit_choice_idx = 0
            edit_mode = True
        elif key == ord("s"):
            action = "save"

    return edit_cursor, edit_mode, edit_input, edit_choice_idx, action, quit_flag


# ─── Main Loop ──────────────────────────────────────────────────────────────

def tui(stdscr):
    curses.curs_set(0)
    stdscr.nodelay(False)
    stdscr.timeout(-1)
    init_colors()

    # State
    view = VIEW_LIST
    selected = 0
    scroll_offset = 0
    detail_scroll = 0
    edit_cursor = 0
    edit_mode = False
    edit_input = ""
    edit_choice_idx = 0
    status_msg = ""
    status_time = 0
    current_vm = None
    vms = []

    while True:
        stdscr.erase()
        h, w = stdscr.getmaxyx()

        if view == VIEW_LIST:
            vms = find_vms()
            draw_list(stdscr, vms, selected, scroll_offset)

            # Footer
            footer_y = h - 2
            stdscr.attron(curses.color_pair(C_BORDER))
            stdscr.addstr(footer_y - 1, 0, "─" * w)
            stdscr.attroff(curses.color_pair(C_BORDER))

            if status_msg and time.time() - status_time < 3:
                stdscr.attron(curses.color_pair(C_YELLOW))
                safe_addstr(stdscr, footer_y, 2, status_msg)
                stdscr.attroff(curses.color_pair(C_YELLOW))
            else:
                safe_addstr(stdscr, footer_y, 2, "↑↓:navigate  i/Enter:detail  s:start  x:stop  r:refresh  q:quit", curses.color_pair(C_DIM))

        elif view == VIEW_DETAIL:
            draw_detail(stdscr, current_vm, detail_scroll)

            footer_y = h - 2
            stdscr.attron(curses.color_pair(C_BORDER))
            stdscr.addstr(footer_y - 1, 0, "─" * w)
            stdscr.attroff(curses.color_pair(C_BORDER))

            if status_msg and time.time() - status_time < 3:
                stdscr.attron(curses.color_pair(C_YELLOW))
                safe_addstr(stdscr, footer_y, 2, status_msg)
                stdscr.attroff(curses.color_pair(C_YELLOW))
            else:
                safe_addstr(stdscr, footer_y, 2, "↑↓:scroll  e:edit  s:start/stop  x:export  R:reset  Esc/q:back", curses.color_pair(C_DIM))

        elif view == VIEW_EDIT:
            draw_edit(stdscr, current_vm, edit_cursor, edit_mode, edit_input)

            footer_y = h - 2
            stdscr.attron(curses.color_pair(C_BORDER))
            stdscr.addstr(footer_y - 1, 0, "─" * w)
            stdscr.attroff(curses.color_pair(C_BORDER))

            if status_msg and time.time() - status_time < 3:
                stdscr.attron(curses.color_pair(C_YELLOW))
                safe_addstr(stdscr, footer_y, 2, status_msg)
                stdscr.attroff(curses.color_pair(C_YELLOW))

        stdscr.refresh()

        # ── Input ──
        key = stdscr.getch()

        if view == VIEW_LIST:
            if key == ord("q"):
                break
            elif key == curses.KEY_UP or key == ord("k"):
                selected = max(0, selected - 1)
            elif key == curses.KEY_DOWN or key == ord("j"):
                selected = min(len(vms) - 1, selected + 1)
            elif key == ord("r"):
                status_msg = "Refreshed"
                status_time = time.time()
            elif key == ord("i") and vms:
                current_vm = vms[selected]
                detail_scroll = 0
                view = VIEW_DETAIL
            elif key in (curses.KEY_ENTER, 10, 13) and vms:
                current_vm = vms[selected]
                detail_scroll = 0
                view = VIEW_DETAIL
            elif key == ord("s") and vms:
                vm = vms[selected]
                if not vm["running"]:
                    status_msg = f"Starting {vm['name']}..."
                    status_time = time.time()
                    stdscr.timeout(100)
                    stdscr.refresh()
                    start_vm(vm)
                    time.sleep(1)
                    status_msg = f"Started {vm['name']}"
                    status_time = time.time()
                    stdscr.timeout(-1)
            elif key == ord("x") and vms:
                vm = vms[selected]
                if vm["running"]:
                    status_msg = f"Stopping {vm['name']}..."
                    status_time = time.time()
                    stdscr.timeout(100)
                    stdscr.refresh()
                    stop_vm(vm)
                    status_msg = f"Stopped {vm['name']}"
                    status_time = time.time()
                    stdscr.timeout(-1)

        elif view == VIEW_DETAIL:
            if key == 27 or key == ord("q"):  # Esc or q - back to list
                view = VIEW_LIST
            elif key == curses.KEY_UP or key == ord("k"):
                detail_scroll = max(0, detail_scroll - 1)
            elif key == curses.KEY_DOWN or key == ord("j"):
                detail_scroll += 1
            elif key == ord("e"):
                edit_cursor = 0
                edit_mode = False
                edit_input = ""
                edit_choice_idx = 0
                view = VIEW_EDIT
            elif key == ord("s"):
                if current_vm["running"]:
                    status_msg = f"Stopping {current_vm['name']}..."
                    status_time = time.time()
                    stdscr.timeout(100)
                    stdscr.refresh()
                    stop_vm(current_vm)
                    current_vm["running"] = False
                    status_msg = f"Stopped {current_vm['name']}"
                    status_time = time.time()
                    stdscr.timeout(-1)
                else:
                    status_msg = f"Starting {current_vm['name']}..."
                    status_time = time.time()
                    stdscr.timeout(100)
                    stdscr.refresh()
                    start_vm(current_vm)
                    time.sleep(1)
                    current_vm["running"] = True
                    status_msg = f"Started {current_vm['name']}"
                    status_time = time.time()
                    stdscr.timeout(-1)
            elif key == ord("x"):
                # Export
                try:
                    args_ns = argparse.Namespace(name=current_vm["name"], output=None, config_only=False)
                    cli_export(args_ns)
                    status_msg = f"✓ Exported {current_vm['name']}.tar.gz"
                    status_time = time.time()
                except Exception as e:
                    status_msg = f"Export failed: {e}"
                    status_time = time.time()
            elif key == ord("R"):
                # Reset (capital R)
                if current_vm["running"]:
                    status_msg = "Cannot reset: VM is running"
                    status_time = time.time()
                else:
                    args_ns = argparse.Namespace(name=current_vm["name"], force=False)
                    try:
                        cli_reset(args_ns)
                        status_msg = f"✓ Reset {current_vm['name']}"
                        status_time = time.time()
                    except SystemExit:
                        status_msg = "Reset cancelled"
                        status_time = time.time()
            elif key == ord("I"):
                # Import (capital I)
                view = VIEW_LIST
                status_msg = "Use CLI: quickemu-tui import <archive.tar.gz>"
                status_time = time.time()

        elif view == VIEW_EDIT:
            edit_cursor, edit_mode, edit_input, edit_choice_idx, action, quit_flag = \
                handle_edit_key(key, current_vm, edit_cursor, edit_mode, edit_input, edit_choice_idx)

            if quit_flag:
                view = VIEW_DETAIL
            elif action == "save":
                try:
                    save_vm_conf(current_vm)
                    status_msg = "✓ 已保存配置"
                    status_time = time.time()
                    view = VIEW_DETAIL
                except Exception as e:
                    status_msg = f"保存失败: {e}"
                    status_time = time.time()


# ─── CLI ────────────────────────────────────────────────────────────────────

def cli_list(args):
    vms = find_vms()
    if not vms:
        print("No VMs found")
        return
    if args.json:
        import json
        print(json.dumps(vms, indent=2, default=str, ensure_ascii=False))
        return

    # Table format
    name_w = max(len(v["name"]) for v in vms) + 2
    print(f"{'NAME':<{name_w}} {'STATUS':<10} {'OS':<12} {'CPU':<6} {'RAM':<6} {'DISK':<8} {'USED'}")
    print("─" * (name_w + 60))
    for vm in vms:
        status = "running" if vm["running"] else "stopped"
        os_str = vm["guest_os"]
        if vm.get("macos_release"):
            os_str += f" ({vm['macos_release']})"
        used = format_size(vm["disk_used"]) if vm["disk_used"] else "-"
        print(f"{vm['name']:<{name_w}} {status:<10} {os_str:<12} {vm['cpu_cores']:<6} {vm['ram']:<6} {vm['disk_size']:<8} {used}")


def cli_info(args):
    vm = _find_vm(args.name)
    if not vm:
        return
    print(f"名称:       {vm['name']}")
    print(f"类型:       {vm['guest_os']}" + (f" ({vm['macos_release']})" if vm.get("macos_release") else ""))
    print(f"状态:       {'运行中' if vm['running'] else '已停止'}")
    print(f"配置文件:   {vm['conf']}")
    print()
    print("── 硬件 ──")
    print(f"CPU:        {vm['cpu_cores']}")
    print(f"RAM:        {vm['ram']}")
    print(f"启动方式:   {vm['boot']}")
    print(f"显示后端:   {vm['display']}")
    print(f"安全启动:   {vm['secureboot']}")
    print(f"TPM:        {vm['tpm']}")
    print(f"声卡:       {vm['sound_card']}")
    print(f"键盘:       {vm['keyboard']} ({vm['keyboard_layout']})")
    print(f"鼠标:       {vm['mouse']}")
    print(f"USB:        {vm['usb_controller']}")
    print(f"查看器:     {vm['viewer']}")
    print(f"监控:       {vm['monitor']}")
    if vm["serial"]:
        print(f"串口:       {vm['serial']}")
    if vm["network"]:
        print(f"网络:       {vm['network']}")
    if vm["ssh_port"]:
        print(f"SSH 端口:   {vm['ssh_port']}")
    if vm["spice_port"]:
        print(f"SPICE 端口: {vm['spice_port']}")
    if vm["extra_args"]:
        print(f"附加参数:   {vm['extra_args']}")
    print()
    print("── 存储 ──")
    if vm["disk_img"]:
        print(f"磁盘镜像:   {vm['disk_img']}")
        print(f"磁盘容量:   {vm['disk_size']}")
        if vm["disk_used"]:
            print(f"实际占用:   {format_size(vm['disk_used'])}")
    if vm["iso"]:
        print(f"ISO:        {vm['iso']}")
    if vm["img"]:
        print(f"恢复镜像:   {vm['img']}")

    if args.json:
        import json
        print()
        print(json.dumps(vm, indent=2, default=str, ensure_ascii=False))


def cli_start(args):
    vm = _find_vm(args.name)
    if not vm:
        return
    if vm["running"]:
        print(f"'{vm['name']}' is already running")
        return
    start_vm(vm)
    print(f"Started '{vm['name']}'")


def cli_stop(args):
    vm = _find_vm(args.name)
    if not vm:
        return
    if not vm["running"]:
        print(f"'{vm['name']}' is not running")
        return
    stop_vm(vm)
    print(f"Stopped '{vm['name']}'")


def cli_set(args):
    vm = _find_vm(args.name)
    if not vm:
        return
    key = args.key
    value = args.value

    # Validate key
    valid_keys = [f[0] for f in EDIT_FIELDS]
    if key not in valid_keys:
        print(f"Error: unknown field '{key}'")
        print(f"Valid fields: {', '.join(valid_keys)}")
        sys.exit(1)

    vm[key] = value
    try:
        save_vm_conf(vm)
        print(f"{vm['name']}: {key} = {value}")
    except Exception as e:
        print(f"Error saving: {e}", file=sys.stderr)
        sys.exit(1)


def cli_delete(args):
    vm = _find_vm(args.name)
    if not vm:
        return
    if vm["running"]:
        print(f"Error: '{vm['name']}' is running, stop it first", file=sys.stderr)
        sys.exit(1)

    if args.disk_only:
        confirm = input(f"Delete disk for '{vm['name']}'? [y/N] ")
        if confirm.lower() != "y":
            return
        subprocess.run([str(QUICKEMU_BIN), "--vm", vm["conf"], "--delete-disk"], check=True)
        print(f"Deleted disk for '{vm['name']}'")
    else:
        confirm = input(f"Delete entire VM '{vm['name']}' (config + disk)? [y/N] ")
        if confirm.lower() != "y":
            return
        subprocess.run([str(QUICKEMU_BIN), "--vm", vm["conf"], "--delete-vm"], check=True)
        print(f"Deleted VM '{vm['name']}'")


def _find_vm(name):
    vms = find_vms()
    for vm in vms:
        if vm["name"] == name:
            return vm
    print(f"Error: VM '{name}' not found", file=sys.stderr)
    print(f"Available: {', '.join(v['name'] for v in vms)}", file=sys.stderr)
    return None


# ─── Import / Export ────────────────────────────────────────────────────────

def cli_reset(args):
    """Reset VM: delete disk and EFI vars, keep config"""
    vm = _find_vm(args.name)
    if not vm:
        return
    if vm["running"]:
        print(f"Error: VM '{vm['name']}' is running, stop it first", file=sys.stderr)
        sys.exit(1)

    if not args.force:
        print(f"VM: {vm['name']}")
        print(f"  Disk: {vm['disk_img']} ({format_size(vm['disk_used']) if vm['disk_used'] else '?'})")
        print(f"  Config will be kept at: {vm['conf']}")
        confirm = input(f"Delete disk and reset '{vm['name']}'? [y/N] ")
        if confirm.lower() != "y":
            return

    try:
        subprocess.run([str(QUICKEMU_BIN), "--vm", vm["conf"], "--delete-disk"], check=True)
        print(f"Reset '{vm['name']}' — disk deleted, config kept")
    except subprocess.CalledProcessError as e:
        print(f"Error: {e}", file=sys.stderr)
        sys.exit(1)


def cli_export(args):
    """Export VM config (+ disk) as .tar.gz"""
    vm = _find_vm(args.name)
    if not vm:
        return

    conf_path = Path(vm["conf"])
    vm_dir = conf_path.parent
    vm_name = vm["name"]
    output = args.output or f"{vm_name}.tar.gz"

    print(f"Exporting '{vm_name}' to {output}...")

    with tarfile.open(output, "w:gz") as tar:
        # Add .conf file
        tar.add(conf_path, arcname=f"{vm_name}.conf")
        print(f"  Added {conf_path.name}")

        if not args.config_only:
            # Add disk image
            if vm.get("disk_img"):
                disk_path = QUICKEMU_DIR / vm["disk_img"]
                if disk_path.exists():
                    tar.add(disk_path, arcname=f"{vm_name}/{vm['disk_img']}")
                    print(f"  Added {vm['disk_img']} ({format_size(disk_path.stat().st_size)})")
                else:
                    print(f"  Warning: disk not found: {disk_path}")

            # Add EFI vars
            efi_vars = vm_dir / "OVMF_VARS.fd"
            if efi_vars.exists():
                tar.add(efi_vars, arcname=f"{vm_name}/OVMF_VARS.fd")
                print(f"  Added OVMF_VARS.fd")

            # Add ISO if exists
            if vm.get("iso"):
                iso_path = QUICKEMU_DIR / vm["iso"]
                if iso_path.exists():
                    tar.add(iso_path, arcname=f"{vm_name}/{vm['iso']}")
                    print(f"  Added {vm['iso']} ({format_size(iso_path.stat().st_size)})")

    size = Path(output).stat().st_size
    print(f"Exported: {output} ({format_size(size)})")


def cli_import(args):
    """Import VM from .tar.gz"""
    archive = Path(args.archive)
    if not archive.exists():
        print(f"Error: {archive} not found", file=sys.stderr)
        sys.exit(1)

    print(f"Importing from {archive}...")

    with tarfile.open(archive, "r:*") as tar:
        # List contents
        members = tar.getnames()
        print(f"  Contents: {', '.join(members[:10])}{'...' if len(members) > 10 else ''}")

        # Find .conf file
        conf_member = None
        for m in members:
            if m.endswith(".conf"):
                conf_member = m
                break

        if not conf_member:
            print("Error: no .conf file found in archive", file=sys.stderr)
            sys.exit(1)

        vm_name = conf_member.replace(".conf", "")

        # Check if VM is running
        existing_conf = QUICKEMU_DIR / conf_member
        if existing_conf.exists():
            existing_vm = parse_vm_conf(existing_conf)
            if is_vm_running(existing_vm):
                print(f"Error: VM '{vm_name}' is running, stop it first", file=sys.stderr)
                sys.exit(1)

        # Check if VM already exists
        dest = QUICKEMU_DIR
        if existing_conf.exists() and not args.force:
            print(f"Error: VM '{vm_name}' already exists (use --force to overwrite)", file=sys.stderr)
            sys.exit(1)

        # Extract
        tar.extractall(path=dest)
        print(f"Imported VM: {vm_name}")

        # Check disk
        for m in members:
            if "disk.qcow2" in m:
                disk_size = tar.getmember(m).size
                print(f"  Disk: {format_size(disk_size)}")
                break

    print(f"Done. Use 'quickemu-tui start {vm_name}' to start")


def main():
    global QUICKEMU_DIR, QUICKEMU_BIN

    parser = argparse.ArgumentParser(
        prog="quickemu-tui",
        description="Quickemu VM Manager — TUI and CLI",
    )
    parser.add_argument("-d", "--dir", help="Quickemu VM directory", default=str(QUICKEMU_DIR))
    sub = parser.add_subparsers(dest="command")

    # list
    p_list = sub.add_parser("list", aliases=["ls"], help="List VMs")
    p_list.add_argument("--json", action="store_true", help="JSON output")

    # info
    p_info = sub.add_parser("info", help="Show VM details")
    p_info.add_argument("name", help="VM name")
    p_info.add_argument("--json", action="store_true", help="JSON output")

    # start
    p_start = sub.add_parser("start", help="Start a VM")
    p_start.add_argument("name", help="VM name")

    # stop
    p_stop = sub.add_parser("stop", help="Stop a running VM")
    p_stop.add_argument("name", help="VM name")

    # set
    p_set = sub.add_parser("set", help="Set a VM config value")
    p_set.add_argument("name", help="VM name")
    p_set.add_argument("key", help="Config key (e.g. cpu_cores, ram)")
    p_set.add_argument("value", help="New value")

    # delete
    p_del = sub.add_parser("delete", aliases=["rm"], help="Delete a VM")
    p_del.add_argument("name", help="VM name")
    p_del.add_argument("--disk-only", action="store_true", help="Only delete disk image")

    # reset
    p_reset = sub.add_parser("reset", help="Reset VM disk (factory reset)")
    p_reset.add_argument("name", help="VM name")
    p_reset.add_argument("--force", action="store_true", help="Skip confirmation")

    # export
    p_exp = sub.add_parser("export", help="Export VM as .tar.gz")
    p_exp.add_argument("name", help="VM name")
    p_exp.add_argument("-o", "--output", help="Output file (default: <name>.tar.gz)")
    p_exp.add_argument("--config-only", action="store_true", help="Export config only (no disk)")

    # import
    p_imp = sub.add_parser("import", aliases=["imp"], help="Import VM from .tar.gz")
    p_imp.add_argument("archive", help="Archive file (.tar.gz)")
    p_imp.add_argument("--force", action="store_true", help="Overwrite if VM exists")

    args = parser.parse_args()

    # Override dir if specified
    if args.dir and args.dir != str(QUICKEMU_DIR):
        QUICKEMU_DIR = Path(args.dir)
        QUICKEMU_BIN = QUICKEMU_DIR / "quickemu"

    if not QUICKEMU_DIR.exists():
        print(f"Error: {QUICKEMU_DIR} not found", file=sys.stderr)
        sys.exit(1)

    if args.command in ("list", "ls"):
        cli_list(args)
    elif args.command == "info":
        cli_info(args)
    elif args.command == "start":
        cli_start(args)
    elif args.command == "stop":
        cli_stop(args)
    elif args.command == "set":
        cli_set(args)
    elif args.command in ("delete", "rm"):
        cli_delete(args)
    elif args.command == "reset":
        cli_reset(args)
    elif args.command == "export":
        cli_export(args)
    elif args.command in ("import", "imp"):
        cli_import(args)
    else:
        # No subcommand — launch TUI
        curses.wrapper(tui)


if __name__ == "__main__":
    main()
