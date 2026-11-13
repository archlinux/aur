#!/usr/bin/env python3
"""welink-wine Linux 原生文件对话框与文件管理器桥接助手。

由 Wine 容器内的 Electron 主进程 (welink-dlg.js) 通过本地回环端口拉起：
  python3 -I /opt/welink-wine/welink-filedialog.py <port>

优先通过 D-Bus 调用 xdg-desktop-portal (org.freedesktop.portal.FileChooser /
org.freedesktop.FileManager1)，在 KDE Plasma / GNOME 等桌面下弹出系统原生文件对话框
（与 Linux 原生微信体验一致）；若 portal 不可用则回退到 zenity。
"""
import json
import os
import random
import re
import shutil
import socket
import subprocess
import sys
import urllib.parse

DATA_DIR = os.path.join(
    os.environ.get("XDG_DATA_HOME") or os.path.expanduser("~/.local/share"),
    "welink-wine",
)
PREFIX_DIR = os.path.realpath(
    os.environ.get("WINEPREFIX") or os.path.join(DATA_DIR, "prefix")
)
DRIVE_C = os.path.join(PREFIX_DIR, "drive_c")
LAST_DIR_FILE = os.path.join(DATA_DIR, "last_dialog_dir")


def load_last_dir():
    try:
        with open(LAST_DIR_FILE, "r", encoding="utf-8") as f:
            p = f.read().strip()
        if p and os.path.isdir(p):
            return p
    except Exception:
        pass
    return os.path.expanduser("~")


def save_last_dir(path):
    if not path:
        return
    d = path if os.path.isdir(path) else os.path.dirname(path)
    if not d or not os.path.isdir(d):
        return
    real = os.path.realpath(d)
    if real == PREFIX_DIR or real.startswith(PREFIX_DIR + "/"):
        return
    try:
        os.makedirs(DATA_DIR, exist_ok=True)
        with open(LAST_DIR_FILE, "w", encoding="utf-8") as f:
            f.write(real)
    except Exception:
        pass


def win_to_linux(raw_path):
    if not raw_path or not isinstance(raw_path, str):
        return ""
    s = raw_path.strip()
    if not s:
        return ""
    norm = s.replace("\\", "/")
    # 处理 WeLink 内部用 process.env.HOME 拼出的 \home\user\... 或 C:\home\user\...
    m_home = re.match(r"^(?:[a-zA-Z]:)?(/home/[^:*?\"<>|]+)$", norm)
    if m_home and os.path.exists("/home"):
        cand = m_home.group(1)
        if not os.path.exists(cand):
            home = os.path.expanduser("~")
            if cand.startswith(home + "/"):
                rel = cand[len(home) + 1 :]
                wine_cand = os.path.join(DRIVE_C, "users", os.path.basename(home), rel)
                if os.path.exists(wine_cand):
                    return os.path.realpath(wine_cand)
        return cand
    if re.match(r"^[zZ]:/", norm):
        return "/" + norm[3:].lstrip("/")
    if re.match(r"^[cC]:/", norm):
        return os.path.join(DRIVE_C, norm[3:].lstrip("/"))
    if norm.startswith("/"):
        return norm
    return ""


def resolve_default_path(raw_path, is_save):
    if not raw_path or not isinstance(raw_path, str):
        return load_last_dir(), ""
    norm = raw_path.replace("\\", "/")
    # 二维码保存等场景会传入 app.asar/xxx_二维码，只提取文件名
    if ".asar/" in norm:
        return load_last_dir(), os.path.basename(norm)

    lp = win_to_linux(raw_path)
    if not lp:
        return load_last_dir(), (os.path.basename(norm) if is_save else "")

    if os.path.isdir(lp):
        folder = os.path.realpath(lp)
        name = ""
    elif is_save:
        parent = os.path.dirname(lp)
        folder = os.path.realpath(parent) if (parent and os.path.isdir(parent)) else ""
        name = os.path.basename(lp)
    else:
        parent = os.path.dirname(lp)
        folder = os.path.realpath(parent) if (parent and os.path.isdir(parent)) else ""
        name = ""

    # 若解析符号链接后仍在 Wine 容器内部（如 C:\Program Files\WeLink），回退到上次目录或主目录
    if not folder or folder == PREFIX_DIR or folder.startswith(PREFIX_DIR + "/"):
        folder = load_last_dir()
    return folder, name


def get_active_x11_window():
    try:
        out = subprocess.check_output(
            ["xprop", "-root", "_NET_ACTIVE_WINDOW"],
            stderr=subprocess.DEVNULL,
            timeout=0.5,
            text=True,
        )
        m = re.search(r"0x[0-9a-fA-F]+", out)
        if m:
            val = int(m.group(0), 16)
            if val > 0:
                return f"x11:{val:x}"
    except Exception:
        pass
    return ""


def case_insensitive_glob(ext):
    ext = ext.lstrip("*.")
    if not ext or ext == "*":
        return "*"
    chars = []
    for c in ext:
        if c.isalpha():
            chars.append(f"[{c.lower()}{c.upper()}]")
        else:
            chars.append(c)
    return "*." + "".join(chars)


def build_portal_filters(filters):
    out = []
    for f in filters or []:
        name = str(f.get("name") or "Files")
        exts = f.get("extensions") or ["*"]
        pats = []
        for e in exts:
            pats.append((0, case_insensitive_glob(str(e))))
        if pats:
            out.append((name, pats))
    if not out:
        out.append(("All Files", [(0, "*")]))
    elif not any(any(p == "*" for _, p in pats) for _, pats in out):
        out.append(("All Files (*)", [(0, "*")]))
    return out


def ensure_default_ext(path, filters):
    if not path:
        return path
    base = os.path.basename(path)
    if "." in base and not base.endswith("."):
        return path
    if filters:
        exts = filters[0].get("extensions") or []
        if exts and exts[0] not in ("*", "*.*"):
            ext = str(exts[0]).lstrip("*.")
            if ext:
                return f"{path.rstrip('.')}.{ext}"
    return path


def portal_file_chooser(req):
    from gi.repository import Gio, GLib

    mode = req.get("mode", "open")
    is_save = mode == "save"
    title = req.get("title") or (
        "选择文件夹" if mode == "folder" else ("保存文件" if is_save else "打开文件")
    )
    accept_label = req.get("buttonLabel") or ""
    multiple = bool(req.get("multiple", False))
    filters = req.get("filters") or []
    folder, current_name = resolve_default_path(req.get("defaultPath", ""), is_save)

    if is_save and current_name:
        current_name = ensure_default_ext(current_name, filters)

    bus = Gio.bus_get_sync(Gio.BusType.SESSION, None)
    uniq = bus.get_unique_name().lstrip(":").replace(".", "_")
    token = f"welink_{os.getpid()}_{random.randint(1000, 999999)}"
    expected_handle = f"/org/freedesktop/portal/desktop/request/{uniq}/{token}"

    opts = {
        "handle_token": GLib.Variant("s", token),
        "modal": GLib.Variant("b", True),
    }
    if accept_label:
        opts["accept_label"] = GLib.Variant("s", accept_label)
    if folder and os.path.isdir(folder):
        opts["current_folder"] = GLib.Variant("ay", os.fsencode(folder) + b"\x00")

    if is_save:
        method = "SaveFile"
        if current_name:
            opts["current_name"] = GLib.Variant("s", current_name)
        pfilters = build_portal_filters(filters)
        opts["filters"] = GLib.Variant("a(sa(us))", pfilters)
        opts["current_filter"] = GLib.Variant("(sa(us))", pfilters[0])
    else:
        method = "OpenFile"
        opts["multiple"] = GLib.Variant("b", multiple)
        opts["directory"] = GLib.Variant("b", mode == "folder")
        if mode != "folder":
            pfilters = build_portal_filters(filters)
            opts["filters"] = GLib.Variant("a(sa(us))", pfilters)
            opts["current_filter"] = GLib.Variant("(sa(us))", pfilters[0])

    loop = GLib.MainLoop()
    result_holder = {"response": 2, "uris": []}

    def on_response(conn, sender, obj_path, iface, sig_name, params):
        resp, res = params.unpack()
        result_holder["response"] = resp
        result_holder["uris"] = res.get("uris") or []
        loop.quit()

    sub_id = bus.signal_subscribe(
        "org.freedesktop.portal.Desktop",
        "org.freedesktop.portal.Request",
        "Response",
        expected_handle,
        None,
        Gio.DBusSignalFlags.NONE,
        on_response,
    )
    sub_id2 = None
    try:
        parent_win = get_active_x11_window()
        ret = bus.call_sync(
            "org.freedesktop.portal.Desktop",
            "/org/freedesktop/portal/desktop",
            "org.freedesktop.portal.FileChooser",
            method,
            GLib.Variant("(ssa{sv})", (parent_win, title, opts)),
            GLib.VariantType("(o)"),
            Gio.DBusCallFlags.NONE,
            -1,
            None,
        )
        actual_handle = ret.unpack()[0]
        if actual_handle != expected_handle:
            sub_id2 = bus.signal_subscribe(
                "org.freedesktop.portal.Desktop",
                "org.freedesktop.portal.Request",
                "Response",
                actual_handle,
                None,
                Gio.DBusSignalFlags.NONE,
                on_response,
            )
        loop.run()
    finally:
        bus.signal_unsubscribe(sub_id)
        if sub_id2 is not None:
            bus.signal_unsubscribe(sub_id2)

    if result_holder["response"] != 0 or not result_holder["uris"]:
        return {"canceled": True, "paths": []}

    paths = []
    for u in result_holder["uris"]:
        parsed = urllib.parse.urlparse(u)
        if parsed.scheme == "file":
            p = urllib.parse.unquote(parsed.path)
            if is_save:
                p = ensure_default_ext(p, filters)
            paths.append(p)
    if paths:
        save_last_dir(paths[0])
    return {"canceled": len(paths) == 0, "paths": paths}


def zenity_fallback(req):
    mode = req.get("mode", "open")
    is_save = mode == "save"
    title = req.get("title") or "WeLink"
    multiple = bool(req.get("multiple", False))
    filters = req.get("filters") or []
    folder, current_name = resolve_default_path(req.get("defaultPath", ""), is_save)

    cmd = ["zenity", "--file-selection", f"--title={title}"]
    if mode == "folder":
        cmd.append("--directory")
    elif is_save:
        cmd.extend(["--save", "--confirm-overwrite"])
        if current_name:
            current_name = ensure_default_ext(current_name, filters)
    if multiple and not is_save:
        cmd.extend(["--multiple", "--separator=\n"])

    target = os.path.join(folder, current_name) if current_name else (folder.rstrip("/") + "/")
    cmd.append(f"--filename={target}")

    if mode != "folder":
        for f in filters:
            name = f.get("name") or "Files"
            exts = [f"*.{e.lstrip('*.')}" for e in (f.get("extensions") or ["*"])]
            cmd.append(f"--file-filter={name} | {' '.join(exts)}")

    env = os.environ.copy()
    env["GTK_USE_PORTAL"] = "1"
    r = subprocess.run(cmd, env=env, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL, text=True)
    if r.returncode != 0:
        return {"canceled": True, "paths": []}
    paths = [p for p in r.stdout.splitlines() if p]
    if paths:
        save_last_dir(paths[0])
    return {"canceled": len(paths) == 0, "paths": paths}


def show_item_in_folder(raw_path):
    lp = win_to_linux(raw_path)
    if not lp:
        return {"ok": False}
    real = os.path.realpath(lp)
    target = real if os.path.exists(real) else lp
    try:
        from gi.repository import Gio, GLib

        uri = urllib.parse.urlunparse(("file", "", urllib.parse.quote(target), "", "", ""))
        bus = Gio.bus_get_sync(Gio.BusType.SESSION, None)
        bus.call_sync(
            "org.freedesktop.FileManager1",
            "/org/freedesktop/FileManager1",
            "org.freedesktop.FileManager1",
            "ShowItems",
            GLib.Variant("(ass)", ([uri], "")),
            None,
            Gio.DBusCallFlags.NONE,
            3000,
            None,
        )
        return {"ok": True}
    except Exception:
        d = target if os.path.isdir(target) else os.path.dirname(target)
        if d and os.path.exists(d):
            subprocess.Popen(
                ["xdg-open", d],
                stdin=subprocess.DEVNULL,
                stdout=subprocess.DEVNULL,
                stderr=subprocess.DEVNULL,
            )
            return {"ok": True}
    return {"ok": False}


def handle_request(req):
    action = req.get("action", "dialog")
    if action == "ping":
        return {"ok": True, "paths": [load_last_dir()]}
    if action == "showItemInFolder":
        return show_item_in_folder(req.get("path", ""))

    try:
        return portal_file_chooser(req)
    except Exception:
        if shutil.which("zenity"):
            return zenity_fallback(req)
        raise


def main():
    if len(sys.argv) < 2:
        return 1
    arg = sys.argv[1]
    if arg == "--file" and len(sys.argv) >= 4:
        req_file, res_file = sys.argv[2], sys.argv[3]
        try:
            with open(req_file, "r", encoding="utf-8") as f:
                req = json.load(f)
            res = handle_request(req)
        except Exception as e:
            res = {"error": str(e)}
        tmp = res_file + ".tmp"
        with open(tmp, "w", encoding="utf-8") as f:
            json.dump(res, f, ensure_ascii=False)
        os.replace(tmp, res_file)
        return 0

    port = int(arg)
    with socket.create_connection(("127.0.0.1", port), timeout=5) as sock:
        chunks = []
        while True:
            data = sock.recv(65536)
            if not data:
                break
            chunks.append(data)
            if b"\n" in data:
                break
        raw = b"".join(chunks).decode("utf-8").strip()
        req = json.loads(raw) if raw else {}
        try:
            res = handle_request(req)
        except Exception as e:
            res = {"error": str(e)}
        sock.sendall((json.dumps(res, ensure_ascii=False) + "\n").encode("utf-8"))
    return 0


if __name__ == "__main__":
    sys.exit(main())
