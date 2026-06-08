#!/usr/bin/env python3
"""
挑挑拣拣 — 照片多轮筛选助手

操作:
  Ctrl+Space                    → 💝 收藏 / 💔 放回
  Ctrl+A                        → 💝 一键全收藏
  Ctrl+Down                     → ✨ 筛完往下~
  Ctrl+Up                       → 🔙 回头看看~
  关闭 loupe                    → 自动退出
"""

import os
import sys
import json
import shutil
import subprocess
from pathlib import Path

import gi
gi.require_version('Atspi', '2.0')
from gi.repository import Atspi

BASE_DIR = Path.cwd()  # 当前工作目录
CMD_FIFO = "/tmp/image_filter_cmd"
VIEWER_BIN = "loupe"
KEYBINDING_PREFIX = (
    "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/image-filter"
)
SCHEMA = "org.gnome.settings-daemon.plugins.media-keys"

# Shortcuts: each action maps to a key binding and a single-char FIFO code
KEYBINDINGS = {
    "next":     {"binding": "<Control>Down",  "code": "N"},
    "prev":     {"binding": "<Control>Up",    "code": "P"},
    "like":     {"binding": "<Control>space", "code": "T"},
    "like_all": {"binding": "<Control>a",     "code": "A"},
}


def gsettings_get(schema, key):
    r = subprocess.run(["gsettings", "get", schema, key], capture_output=True, text=True)
    val = r.stdout.strip()
    if val.startswith("@as "):
        return []
    if val.startswith("["):
        try:
            return json.loads(val.replace("'", '"'))
        except Exception:
            return []
    return [val.strip("'",)] if val else []


def gsettings_set(schema, key, value):
    if isinstance(value, list):
        val_str = "[" + ", ".join(f"'{v}'" for v in value) + "]"
    else:
        val_str = str(value)
    subprocess.run(["gsettings", "set", schema, key, val_str], check=False)


def dconf_write(path, value):
    subprocess.run(["dconf", "write", path, value], check=False)


def register_keybindings():
    """Register Ctrl+Down, Ctrl+Up, Ctrl+Space globally.

    Each shortcut runs:  python3 <this-script> --cmd <code>
    The --cmd handler writes the single-char code directly to the FIFO.
    """
    script_path = os.path.abspath(sys.argv[0])
    python = sys.executable

    existing = gsettings_get(SCHEMA, "custom-keybindings")
    existing = [e for e in existing if "image-filter" not in e]

    new_paths = []
    for action, config in KEYBINDINGS.items():
        base = f"{KEYBINDING_PREFIX}-{action}"
        list_path = f"{base}/"

        command = f"{python} {script_path} --cmd {config['code']}"

        dconf_write(f"{base}/name", f"'image-filter-{action}'")
        dconf_write(f"{base}/binding", f"'{config['binding']}'")
        dconf_write(f"{base}/command", f"'{command}'")

        if list_path not in existing:
            new_paths.append(list_path)

    existing.extend(new_paths)
    gsettings_set(SCHEMA, "custom-keybindings", existing)
    print("✓ 快捷键已注册: Ctrl+Space=收藏  Ctrl+Down=下一轮  Ctrl+Up=上一轮")


def unregister_keybindings():
    existing = gsettings_get(SCHEMA, "custom-keybindings")
    existing = [e for e in existing if "image-filter" not in e]
    gsettings_set(SCHEMA, "custom-keybindings", existing)
    for action in KEYBINDINGS:
        subprocess.run(
            ["dconf", "reset", "-f", f"{KEYBINDING_PREFIX}-{action}/"],
            check=False,
        )
    print("✓ 快捷键已移除")


def get_images_in_dir(d):
    return sorted([str(p) for p in Path(d).glob("*.jpg")])


def notify(msg):
    """Send a transient, friendly desktop notification with a cute title."""
    subprocess.run(
        ["notify-send", "挑挑拣拣", msg,
         "--app-name=pick_photo_helper", "--transient"],
        check=False,
    )


def layer_msg(layer):
    """Get cute notification message for entering a layer."""
    messages = {
        1: "你最爱的都在这儿 ✨",
        2: "超爱的一批！继续继续 ✨",
        3: "舍不得放下的都在这了 ✨",
    }
    if layer in messages:
        return messages[layer]
    return f"第 {layer} 轮了～这些都是心尖尖上的 ✨"


def prev_layer_msg(target_layer):
    """Get cute notification message for going back up to a layer."""
    messages = {
        0: "🔙 又回到最初的起点啦~",
        1: "🔙 跑回来看看你最爱的~",
        2: "🔙 超爱的那批，一个都没跑~",
        3: "🔙 舍不得放下的，都替你留着~",
    }
    if target_layer in messages:
        return messages[target_layer]
    return f"🔙 第 {target_layer} 轮了，心尖尖们都好好的~"


# ── filesystem helpers (the one source of truth) ──

def source_dir(layer):
    """Source directory for a layer: BASE_DIR for 0, layer{N}/ for N>0."""
    return BASE_DIR if layer == 0 else BASE_DIR / f"layer{layer}"


def images_of(layer):
    """Sorted list of jpg paths in a layer's source directory."""
    return sorted(str(p) for p in source_dir(layer).glob("*.jpg"))


def selected_of(layer):
    """Images in *layer* that have a corresponding entry in layer{N+1}/."""
    next_dir = BASE_DIR / f"layer{layer + 1}"
    if not next_dir.is_dir():
        return []
    selected = []
    for img in images_of(layer):
        if (next_dir / os.path.basename(img)).is_symlink():
            selected.append(img)
    return selected


SCOPE_UNIT = "pick_photo_helper.scope"


def kill_loupe():
    """Stop the loupe systemd scope unit — cleanly kills the whole process tree."""
    subprocess.run(
        ["systemctl", "--user", "stop", SCOPE_UNIT],
        check=False,
    )


def open_image(path, state):
    """Launch loupe via systemd-run --scope for clean lifecycle management.

    The scope wraps the D-Bus activated service, so killing the scope
    kills loupe cleanly without affecting other loupe instances.
    """
    try:
        subprocess.Popen(
            ["systemd-run", "--user", "--scope",
             "--unit=pick_photo_helper",
             VIEWER_BIN, path],
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
        )
    except Exception as e:
        print(f"  ✗ 无法启动 loupe: {e}")


def viewer_alive(state):
    """Check if the loupe systemd scope unit is still active."""
    try:
        result = subprocess.run(
            ["systemctl", "--user", "is-active", SCOPE_UNIT],
            capture_output=True, text=True,
            timeout=2,
        )
        return result.stdout.strip() == "active"
    except subprocess.TimeoutExpired:
        return False


def print_status(state):
    layer = state["current_layer"]
    images = images_of(layer)
    total = len(images)
    selected_count = len(selected_of(layer))
    idx = state["current_index"]

    if total == 0:
        fname = "(无图片)"
    elif idx < total:
        fname = os.path.basename(images[idx])
    else:
        fname = "(已看完)"

    print(f"\n{'=' * 50}")
    print(f"  层级 {layer} | 总数: {total} | 已选: {selected_count}")
    print(f"  当前: {fname}")
    print(f"{'─' * 50}")
    print(f"  Ctrl+Space 收藏/放回    Ctrl+A 全收藏    Ctrl+Down 往下筛    Ctrl+Up 回头看")


def get_loupe_filename():
    """Read loupe's window title via AT-SPI. Returns filename or None."""
    try:
        Atspi.init()
        desktop = Atspi.get_desktop(0)
        for i in range(desktop.get_child_count()):
            app = desktop.get_child_at_index(i)
            name = app.get_name()
            if name and 'loupe' in name.lower():
                # Loupe always has exactly 1 window, title = filename
                if app.get_child_count() > 0:
                    win = app.get_child_at_index(0)
                    title = win.get_name()
                    if title:
                        return title
                return None
        return None
    except Exception:
        return None


def resolve_filename_in_layer(filename, layer_images):
    """Match a bare filename to a full path in the current layer's image list."""
    for img in layer_images:
        if os.path.basename(img) == filename:
            return img
    return None


def do_toggle(state, image_path):
    """Like/dislike toggle: pure filesystem check — file in layer{N+1}/."""

    layer = state["current_layer"]
    basename = os.path.basename(image_path)
    images = images_of(layer)

    if image_path not in images:
        return state

    next_file = BASE_DIR / f"layer{layer + 1}" / basename
    if next_file.is_symlink():
        msg = f"💔 放回去了~ {basename}"
        print(f"  {msg}")
        notify(msg)
        next_file.unlink()
    else:
        msg = f"💝 收藏啦~ {basename}"
        print(f"  {msg}")
        notify(msg)
        next_dir = BASE_DIR / f"layer{layer + 1}"
        next_dir.mkdir(exist_ok=True)
        next_file.symlink_to(Path(image_path).resolve())

    state["current_index"] = images.index(image_path)
    print_status(state)
    return state


def do_like_all(state):
    """Like all images: delete layer{N+1}/, recreate, symlink all current images."""
    layer = state["current_layer"]
    images = images_of(layer)

    next_dir = BASE_DIR / f"layer{layer + 1}"
    if next_dir.exists():
        shutil.rmtree(next_dir)
    next_dir.mkdir()

    for img in images:
        dst = next_dir / os.path.basename(img)
        dst.symlink_to(Path(img).resolve())

    msg = f"💝 全都要！{len(images)} 张都收藏啦~"
    print(f"  {msg}")
    notify(msg)
    print_status(state)
    return state


def do_next_layer(state, notify_send=True):
    """Advance to next layer. If layer{N+1}/ exists with symlinks, switch to it."""
    layer = state["current_layer"]
    next_layer = layer + 1
    next_dir = BASE_DIR / f"layer{next_layer}"

    if not next_dir.is_dir():
        if notify_send:
            notify("还没挑到喜欢的呢，先选几张再往下走吧~")
        return state

    images = images_of(next_layer)
    if not images:
        if notify_send:
            notify("还没挑到喜欢的呢，先选几张再往下走吧~")
        return state

    state["current_layer"] = next_layer
    state["current_index"] = 0
    kill_loupe()
    state["waiting_for_loupe"] = True
    state["loupe_wait_cycles"] = 0
    open_image(images[0], state)
    notify(layer_msg(next_layer))
    print_status(state)
    return state


def do_prev_layer(state):
    """Go back to the previous layer."""
    if state["current_layer"] <= 0:
        return state

    target = state["current_layer"] - 1
    state["current_layer"] = target
    state["current_index"] = 0
    notify(prev_layer_msg(target))
    print_status(state)

    images = images_of(target)
    if images:
        kill_loupe()
        state["waiting_for_loupe"] = True
        state["loupe_wait_cycles"] = 0
        open_image(images[0], state)

    return state


def print_help():
    """Print help and exit."""
    help_text = f"""
{'=' * 60}
  📷 挑挑拣拣 — 照片多轮筛选助手 (Pick Photo Helper)
{'=' * 60}

  用法:
    python3 pick_photo_helper.py [-h | --help]

  启动后在当前目录扫描 .jpg 图片，自动打开 loupe 浏览。

  快捷键:
    Ctrl+Space    💝 收藏 / 💔 放回
    Ctrl+A        💝 一键全收藏
    Ctrl+Down     ✨ 筛完这批，往下走~
    Ctrl+Up       🔙 回头看看上一批~
    关闭 loupe     ✕ 自动退出程序

  工作原理:
    1. 在当前目录启动，所有 .jpg 列为第 0 轮
    2. 在 loupe 中浏览图片，按 Ctrl+Space 收藏喜欢的 → 桌面通知
    3. 按 Ctrl+Down → 收藏的图片复制到 layer1/ 作为第 1 轮
    4. 继续筛选直到满意，关闭 loupe 即退出
    5. 每一轮的结果保存在 layer<N>/ 子目录中

  依赖:
    loupe (图片查看器)、systemd (scope 进程管理)、AT-SPI (窗口标题读取)
{'=' * 60}
"""
    print(help_text.strip())


def find_terminal():
    """Find an available terminal emulator.  Returns (cmd, arg_to_run)."""
    for term, run_flag in [
        ("gnome-terminal", "--"),
        ("kgx", "--"),               # GNOME Console
        ("konsole", "-e"),
        ("xfce4-terminal", "-e"),
        ("lxterminal", "-e"),
        ("xterm", "-e"),
    ]:
        if shutil.which(term):
            return term, run_flag
    return None, None


def ensure_terminal():
    """
    If we are not running inside a terminal (double-click launch),
    re-launch ourselves in a terminal emulator and exit the original.
    Returns True if the original process should continue (already in terminal).
    Returns False after re-launching, so the caller returns immediately.
    """
    if sys.stdout.isatty():
        return True  # already in terminal, continue normally

    script = os.path.abspath(sys.argv[0])
    term, run_flag = find_terminal()
    if term is None:
        # Last resort: no terminal found — show a GUI error and exit
        subprocess.run(
            ["zenity", "--error",
             "--title=挑挑拣拣",
             "--text=未找到可用的终端模拟器，请在终端中手动运行：\n\npython3 " + script],
            check=False,
        )
        return False

    # Build command: terminal -e python3 <script> --from-desktop
    if term == "gnome-terminal":
        subprocess.Popen(
            [term, "--wait", "--", "python3", script, "--from-desktop"],
            stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
        )
    elif term == "kgx":
        subprocess.Popen(
            [term, "--", "python3", script, "--from-desktop"],
            stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
        )
    else:
        subprocess.Popen(
            [term, run_flag, "python3", script, "--from-desktop"],
            stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
        )
    return False


def send_fifo_command(code: str):
    """Write a single-char command code to the FIFO.

    Called from the dconf shortcut handler (python3 <script> --cmd <code>).
    """
    try:
        with open(CMD_FIFO, "w") as fifo:
            fifo.write(code)
    except Exception as e:
        print(f"  ⚠ FIFO 写入失败: {e}", file=sys.stderr)


def main():
    # Parse flags
    from_desktop = "--from-desktop" in sys.argv

    # Shortcut handler: write command code directly to FIFO, then exit
    if len(sys.argv) >= 3 and sys.argv[1] == "--cmd":
        send_fifo_command(sys.argv[2])
        return

    if len(sys.argv) > 1 and sys.argv[1] in ("-h", "--help"):
        print_help()
        return

    # Double-click: auto-open in terminal if not in one
    if not ensure_terminal():
        return  # parent process exits; child runs in terminal

    # Cleanup old FIFO
    if os.path.exists(CMD_FIFO):
        os.unlink(CMD_FIFO)
    os.mkfifo(CMD_FIFO)

    register_keybindings()

    # Scan current directory for .jpg images
    all_images = get_images_in_dir(BASE_DIR)
    if not all_images:
        print("❌ 当前目录没有 .jpg 图片")
        os.unlink(CMD_FIFO)
        unregister_keybindings()
        return

    state = {
        "current_layer": 0,
        "current_index": 0,
        "waiting_for_loupe": False,
        "loupe_wait_cycles": 0,
    }

    print()
    print("=" * 50)
    print("  📷 挑挑拣拣 — 照片多轮筛选助手")
    print("=" * 50)
    print(f"  目录: {BASE_DIR}")
    print(f"  源图片: {len(all_images)} 张 jpg")
    print("=" * 50)

    print_status(state)

    # Open first image
    if all_images:
        open_image(all_images[0], state)

    import select
    poll = select.poll()

    # Open FIFO non-blocking
    fifo_fd = os.open(CMD_FIFO, os.O_RDONLY | os.O_NONBLOCK)
    poll.register(fifo_fd, select.POLLIN)

    running = True
    while running:
        events = poll.poll(500)  # 500ms timeout

        for fd, _ in events:
            if fd == fifo_fd:
                try:
                    cmd = os.read(fifo_fd, 1).decode()
                    if cmd == "N":
                        state = do_next_layer(state)
                    elif cmd == "P":
                        state = do_prev_layer(state)
                    elif cmd == "T":
                        # Ctrl+Space: get loupe window title → toggle
                        fname = get_loupe_filename()
                        if fname:
                            layer_images = images_of(state["current_layer"])
                            img = resolve_filename_in_layer(fname, layer_images)
                            if img:
                                state = do_toggle(state, img)
                            else:
                                print(f"  ⚠ 警告: '{fname}' 不在当前层级图片列表中", file=sys.stderr)
                        else:
                            print("  ⚠ 警告: 无法获取 loupe 窗口标题", file=sys.stderr)
                    elif cmd == "A":
                        state = do_like_all(state)
                except Exception:
                    pass

        # Check if loupe is still alive.
        # If we just replaced loupe, wait for the new scope to become active
        # before enabling exit detection.
        if state.get("waiting_for_loupe"):
            if viewer_alive(state):
                # New loupe is up — resume normal exit detection
                state["waiting_for_loupe"] = False
                state["loupe_wait_cycles"] = 0
            else:
                state["loupe_wait_cycles"] += 1
                if state["loupe_wait_cycles"] > 30:  # 15s timeout
                    print("\n  loupe 启动超时，退出程序。")
                    running = False
        elif not viewer_alive(state):
            print("\n  loupe 已关闭，退出程序。")
            running = False

    # Cleanup
    os.close(fifo_fd)
    if os.path.exists(CMD_FIFO):
        os.unlink(CMD_FIFO)
    unregister_keybindings()

    # When double-click launched, keep terminal open so the user can read output
    if from_desktop:
        try:
            input("\n  按 Enter 关闭窗口...")
        except EOFError:
            pass


if __name__ == "__main__":
    main()
