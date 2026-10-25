#!/usr/bin/env python3
"""
nouveau-dynclockd — Dynamic GPU Frequency & P-State Governor for Nouveau Fermi (v2.2.0)
Efficient, event-driven detection using kernel DRM client tracking, hardware interrupt rates,
120 Hz display-aware idle floor clamping, per-application profiles, and PowerMizer hold-down hysteresis.

Features:
- Clamps idle floor to P-State 07 (202/324 MHz) when a high-refresh display (>135 MHz pixel clock,
  e.g. 1920x1080 @ 120 Hz) is active, eliminating display FIFO starvation and screen flicker.
  Drops to P-State 03 (50/324 MHz) only at 60 Hz or when display is DPMS blanked.
- Per-application profile drop-ins (/etc/nouveau-dynclockd.d/*.conf) to automatically scale
  games, emulators, and media players to designated performance states.
- Bidirectional manual override coordination (/run/nouveau/mode) with nouveau-ctrl and nouveau-tui:
  manual locks are respected while thermal protection remains fully active.
- Publishes world-readable snapshots (/run/nouveau/pstate, /run/nouveau/clients, /run/nouveau/vram,
  /run/nouveau/status) allowing non-root tools to monitor and control without sudo delays.
- Tracks GPU hardware interrupt rates (/proc/interrupts nvkm) for instant load detection.
- PowerMizer hold-down timers (8s on 0f -> 07, 5s on 07 -> idle) prevent rapid clock oscillation.
- Thermal protection: caps highest clock to P-State 07 when temperature exceeds threshold (default 80°C).
- Runtime configurable via /etc/nouveau-dynclockd.conf and SIGHUP.
"""
import ctypes
import glob
import os
import signal
import sys
import time

CONFIG_PATH = "/etc/nouveau-dynclockd.conf"

POWER_SUPPLY_BASE = "/sys/class/power_supply"
SNAPSHOT_DIR = "/run/nouveau"
VRAM_SNAPSHOT = os.path.join(SNAPSHOT_DIR, "vram")
PSTATE_SNAPSHOT = os.path.join(SNAPSHOT_DIR, "pstate")
CLIENTS_SNAPSHOT = os.path.join(SNAPSHOT_DIR, "clients")
STATUS_SNAPSHOT = os.path.join(SNAPSHOT_DIR, "status")
MODE_PATH = os.path.join(SNAPSHOT_DIR, "mode")

GPUVA_CANDIDATES = [
    "/sys/kernel/debug/dri/0/gpuva",
    "/sys/kernel/debug/dri/0000:01:00.0/gpuva",
]

PSTATE_CANDIDATES = [
    "/sys/kernel/debug/dri/0/pstate",
    "/sys/kernel/debug/dri/0000:01:00.0/pstate",
    "/sys/kernel/debug/dri/128/pstate",
]
CLIENTS_CANDIDATES = [
    "/sys/kernel/debug/dri/0/clients",
    "/sys/kernel/debug/dri/0000:01:00.0/clients",
    "/sys/kernel/debug/dri/128/clients",
]
HWMON_TEMP_GLOB = "/sys/class/drm/card0/device/hwmon/hwmon*/temp1_input"

# Desktop compositors, browsers, IDEs, terminals, media players, GTK4/Qt6 desktop apps,
# and background daemons that hold /dev/dri open without needing 900 MHz DDR3 (0f).
# These scale smoothly between 03 (50/324 MHz) and 07 (202/324 MHz) with zero MCLK reclock.
DESKTOP_CLIENTS = {
    # Display servers & compositors
    "Xorg", "Xwayland", "kwin_wayland", "kwin_x11", "plasmashell", "kded6", "ksmserver",
    "gnome-shell", "mutter", "cinnamon", "muffin", "marco", "mate-panel", "xfwm4",
    "xfce4-panel", "sway", "wayfire", "Hyprland", "hyprland", "weston", "qtile",
    "openbox", "i3", "picom", "compton", "swayosd-server", "gamescope-wl",
    # Web browsers & Electron / WebKit / QtWebEngine processes
    "vivaldi", "vivaldi-bin", "firefox", "firefox-bin", "firefox-esr", "librewolf",
    "waterfox", "zen-bin", "chromium", "chrome", "google-chrome", "brave", "brave-bin",
    "opera", "thorium", "microsoft-edge", "electron", "WebKitWebProces", "WebKitGPUProces",
    "WPEWebProcess", "QtWebEngineProc", "RDD Process", "GPU Process", "Utility Process",
    # Communication & media desktop apps
    "discord", "vesktop", "slack", "spotify", "telegram-deskto", "signal-desktop",
    "thunderbird", "betterbird", "xconnect", "kdeconnectd",
    # IDEs & code editors
    "code", "code-oss", "codium", "cursor", "antigravity", "agy", "pycharm", "idea",
    "clion", "webstorm", "goland", "rustrover", "java", "jcef_helper", "zed", "zed-editor",
    # Terminals
    "wezterm-gui", "alacritty", "kitty", "foot", "ghostty", "ptyxis", "konsole",
    "gnome-terminal-", "xfce4-terminal", "tilix", "terminator", "guake", "yakuake",
    # File managers, desktop utilities & GTK4/Libadwaita apps
    "nemo", "nemo-desktop", "nautilus", "dolphin", "thunar", "pcmanfm", "pcmanfm-qt",
    "loupe", "eog", "gthumb", "gwenview", "okular", "evince", "papers", "pavucontrol",
    "blueman-manager", "blueman-applet", "nm-applet", " nm-connection-", "rofi", "wofi",
    "dunst", "polybar", "waybar", "conky", "plank", "dockx", "variety", " Nitrogen",
    # Video players & GStreamer / FFmpeg probes (PureVideo VP4 / 2D compositing runs at 07)
    "mpv", "vlc", "totem", "celluloid", "clapper", "showtime", "kodi", "kodi.bin",
    "kodi-x11", "kodi-wayland", "bino", "ffmpeg", "ffprobe", "gst-plugin-scan",
    "gst-launch-1.0",
    # Diagnostic, telemetry & background services
    "glxinfo", "eglinfo", "vainfo", "vdpauinfo", "vulkaninfo", "clinfo",
    "nvtop", "btop", "htop", "MissionCenter", "missioncenter", "resources",
    "gnome-system-mo", "nouveau-tui", "nouveau-ctrl", "python3", "ollama",
    "systemd-logind", "xdg-desktop-por",
}

DESKTOP_CLIENT_PREFIXES = (
    "csd-", "gsd-", "systemd", "xdg-", "dconf-", "wireplumber", "pipewire",
    "polkit", "gvfs", "at-spi", "ibus-", "fcitx", "cinnamon-", "gnome-",
    "plasma-", "kde", "xfce4-", "mate-", "lxqt-", "vivaldi", "firefox",
    "chrom", "brave", "electron", "webkit", "qtwebengine", "gst-",
    "nouveau-", "pycharm", "jetbrains",
)

# Explicit 3D benchmarks, games, emulators, and GPU compute runners that should
# scale to 0f without waiting for high CPU tick thresholds.
KNOWN_3D_APPS = {
    "glxgears", "es2gears", "vkcube", "vkcubepp", "eglgears", "furmark",
    "heaven", "valley", "superposition", "glmark2", " glmark2",
    "wine-preloader", "wine64-preloade", "wineserver", "proton", "reaper",
    "gamescope", "retroarch", "flycast", "pcsx2", "pcsx2-qt", "dolphin-emu",
    "rpcs3", "ppsspp", "PPSSPPQt", "PPSSPPSDL", "duckstation-qt", "cemu",
    "yuzu", "ryujinx", "citra", "citra-qt", "melonDS", "mupen64plus",
    "blender", "godot", "llama-cli", "llama-server", "llama-bench",
    "ollama_llama_se",
}

# Processes to monitor for active CPU/GPU rendering load (WebGL, Canvas, video decoding -> State 07)
MONITORED_APPS = {
    "cinnamon", "Xorg", "Xwayland", "qtile", "gnome-shell", "kwin_wayland", "mutter",
    "vivaldi", "vivaldi-bin", "firefox", "firefox-bin", "chromium", "chrome",
    "brave", "brave-bin", "code", "electron", "mpv", "vlc", "kodi", "kodi.bin",
    "pycharm", "java", "xdg-desktop-por",
}

DEFAULT_CONFIG = {
    "THROTTLE_TEMP": 80,
    "THROTTLE_HYST": 5,
    "POLL_INTERVAL": 1.0,
    "LOAD_TICK_THRESHOLD": 40,
    "CLIENT_3D_TICK_THRESHOLD": 20,
    "UPCLOCK_3D_CONFIRM_POLLS": 2,
    "HOLD_0F_SECONDS": 8,
    "HOLD_07_SECONDS": 5,
    "IDLE_STATE": "03",
    "BATTERY_CAP": True,
    "DISPLAY_120HZ_FLOOR": True,
    "ALLOW_OC_10": False,
    "INTERRUPT_THRESHOLD": 100,
    "PROFILES_DIR": "/etc/nouveau-dynclockd.d",
}

config = dict(DEFAULT_CONFIG)
config_mtime = 0
app_profiles = {}
prev_app_ticks = 0
prev_client_ticks = {}
prev_irq_count = 0
prev_irq_time = 0.0
active_pstate_path = None
active_clients_path = None
thermal_throttled = False


def is_desktop_client(cmd_name):
    """Returns True if cmd_name is a known 2D desktop, browser, IDE, media, or system client."""
    if not cmd_name or cmd_name == "<unset>":
        return True
    if cmd_name in DESKTOP_CLIENTS:
        return True
    low = cmd_name.lower()
    if low in DESKTOP_CLIENTS or low.startswith(DESKTOP_CLIENT_PREFIXES):
        return True
    if low.endswith("-bin") and low[:-4] in DESKTOP_CLIENTS:
        return True
    return False


def load_app_profiles():
    """Loads custom per-application P-State overrides from /etc/nouveau-dynclockd.d/*.conf."""
    profiles = {
        "steam": "0f",
        "wine64-preloade": "0f",
        "wine-preloader": "0f",
        "wineserver": "0f",
        "proton": "0f",
        "glmark2": "0f",
        "mpv": "07",
        "vlc": "07",
        "kodi.bin": "07",
        "bino": "07",
        "blender": "10",
        "godot": "0f",
    }
    pdir = config.get("PROFILES_DIR", "/etc/nouveau-dynclockd.d")
    if os.path.isdir(pdir):
        for fname in sorted(os.listdir(pdir)):
            if fname.endswith(".conf"):
                fpath = os.path.join(pdir, fname)
                try:
                    with open(fpath, "r") as f:
                        in_apps = False
                        for line in f:
                            line = line.strip()
                            if not line or line.startswith("#"):
                                continue
                            if line.startswith("[") and line.endswith("]"):
                                sec = line[1:-1].strip().lower()
                                in_apps = (sec == "apps")
                                continue
                            if in_apps and "=" in line:
                                app, st = line.split("=", 1)
                                app = app.strip()
                                st = st.strip().lower()
                                if st in ("03", "07", "08", "0a", "0f", "10"):
                                    profiles[app] = st
                except Exception:
                    pass
    return profiles


def load_config():
    global config, config_mtime, app_profiles
    new_cfg = dict(DEFAULT_CONFIG)
    if os.path.exists(CONFIG_PATH):
        try:
            config_mtime = os.path.getmtime(CONFIG_PATH)
            with open(CONFIG_PATH, "r") as f:
                for line in f:
                    line = line.strip()
                    if not line or line.startswith("#"):
                        continue
                    if "=" in line:
                        k, v = line.split("=", 1)
                        k = k.strip().upper()
                        v = v.strip()
                        if k in (
                            "THROTTLE_TEMP",
                            "THROTTLE_HYST",
                            "LOAD_TICK_THRESHOLD",
                            "CLIENT_3D_TICK_THRESHOLD",
                            "UPCLOCK_3D_CONFIRM_POLLS",
                            "HOLD_0F_SECONDS",
                            "HOLD_07_SECONDS",
                            "INTERRUPT_THRESHOLD",
                        ):
                            try:
                                new_cfg[k] = int(v)
                            except ValueError:
                                pass
                        elif k == "POLL_INTERVAL":
                            try:
                                new_cfg[k] = max(0.2, float(v))
                            except ValueError:
                                pass
                        elif k == "IDLE_STATE":
                            if v in ("03", "07", "08"):
                                new_cfg[k] = v
                        elif k in ("BATTERY_CAP", "DISPLAY_120HZ_FLOOR", "ALLOW_OC_10"):
                            new_cfg[k] = v.lower() not in ("0", "false", "no", "off")
                        elif k == "PROFILES_DIR":
                            new_cfg[k] = v
        except Exception as e:
            print(f"Warning: Could not read {CONFIG_PATH}: {e}", file=sys.stderr)
    config = new_cfg
    app_profiles = load_app_profiles()
    return config


def check_config_reload():
    global config_mtime
    if os.path.exists(CONFIG_PATH):
        try:
            mtime = os.path.getmtime(CONFIG_PATH)
            if mtime > config_mtime:
                load_config()
                print(
                    f"[*] Configuration auto-reloaded from {CONFIG_PATH}: "
                    f"THROTTLE_TEMP={config['THROTTLE_TEMP']}°C, 120HZ_FLOOR={config['DISPLAY_120HZ_FLOOR']}, "
                    f"HOLD_0F={config['HOLD_0F_SECONDS']}s"
                )
                sys.stdout.flush()
        except Exception:
            pass


def handle_sighup(signum, frame):
    load_config()
    print(
        f"[*] SIGHUP received: Configuration reloaded: "
        f"THROTTLE_TEMP={config['THROTTLE_TEMP']}°C, IDLE_STATE={config['IDLE_STATE']}, "
        f"120HZ_FLOOR={config['DISPLAY_120HZ_FLOOR']}, BATTERY_CAP={config['BATTERY_CAP']}"
    )
    sys.stdout.flush()


def find_active_node(candidates):
    for p in candidates:
        if os.path.exists(p):
            return p
    return candidates[0]


def wait_for_pstate_node(timeout=15):
    """Wait for the debugfs pstate file to become available during early boot."""
    global active_pstate_path, active_clients_path
    start_time = time.time()
    while time.time() - start_time < timeout:
        for p in PSTATE_CANDIDATES:
            if os.path.exists(p):
                active_pstate_path = p
                active_clients_path = find_active_node(CLIENTS_CANDIDATES)
                return True
        time.sleep(0.5)
    return False


def get_current_pstate():
    """Reads the active hardware pstate from debugfs."""
    if not active_pstate_path:
        return None
    try:
        with open(active_pstate_path, "r") as f:
            for line in f:
                if "*" in line:
                    return line.split(":")[0].strip()
    except Exception:
        pass
    return None


def get_gpu_temp():
    """Reads real-time GPU core temperature in degrees Celsius."""
    for p in glob.glob(HWMON_TEMP_GLOB):
        try:
            with open(p, "r") as f:
                val = f.read().strip()
                if val.isdigit():
                    return float(val) / 1000.0
        except Exception:
            pass
    return None


def get_power_source():
    """Returns 'AC', 'BAT', or 'UNKNOWN' from /sys/class/power_supply/."""
    try:
        if not os.path.isdir(POWER_SUPPLY_BASE):
            return "UNKNOWN"
        ac_online = None
        bat_status = None
        for name in os.listdir(POWER_SUPPLY_BASE):
            node = os.path.join(POWER_SUPPLY_BASE, name)
            ptype = ""
            try:
                with open(os.path.join(node, "type"), "r") as f:
                    ptype = f.read().strip()
            except Exception:
                pass
            upper = name.upper()
            if upper.startswith(("ADP", "AC")) or ptype == "Mains":
                try:
                    with open(os.path.join(node, "online"), "r") as f:
                        ac_online = (f.read().strip() == "1")
                except Exception:
                    pass
            if upper.startswith("BAT") or ptype == "Battery":
                try:
                    with open(os.path.join(node, "status"), "r") as f:
                        bat_status = f.read().strip()
                except Exception:
                    pass
        if ac_online is True:
            return "AC"
        if ac_online is False:
            return "BAT"
        if bat_status == "Discharging":
            return "BAT"
        if bat_status in ("Charging", "Full", "Not charging"):
            return "AC"
        return "AC" if bat_status is None else "UNKNOWN"
    except Exception:
        return "UNKNOWN"


def get_active_display_info():
    """
    Queries active DRM CRTC modes and connector DPMS states.
    Returns (max_clock_khz, max_refresh_hz, is_display_active).
    """
    max_clock_khz = 0
    max_refresh_hz = 0
    display_active = False

    # Check DPMS status across card0 connectors
    for p in glob.glob("/sys/class/drm/card0-*/dpms"):
        try:
            with open(p, "r") as f:
                if f.read().strip() == "On":
                    display_active = True
                    break
        except Exception:
            pass

    # Query active CRTC modes via libdrm
    try:
        class drmModeRes(ctypes.Structure):
            _fields_ = [
                ('count_fbs', ctypes.c_int), ('fbs', ctypes.c_void_p),
                ('count_crtcs', ctypes.c_int), ('crtcs', ctypes.POINTER(ctypes.c_uint32)),
                ('count_connectors', ctypes.c_int), ('connectors', ctypes.c_void_p),
                ('count_encoders', ctypes.c_int), ('encoders', ctypes.c_void_p),
                ('min_width', ctypes.c_uint32), ('max_width', ctypes.c_uint32),
                ('min_height', ctypes.c_uint32), ('max_height', ctypes.c_uint32),
            ]

        class drmModeModeInfo(ctypes.Structure):
            _fields_ = [
                ('clock', ctypes.c_uint32),
                ('hdisplay', ctypes.c_uint16), ('hsync_start', ctypes.c_uint16),
                ('hsync_end', ctypes.c_uint16), ('htotal', ctypes.c_uint16),
                ('hskew', ctypes.c_uint16),
                ('vdisplay', ctypes.c_uint16), ('vsync_start', ctypes.c_uint16),
                ('vsync_end', ctypes.c_uint16), ('vtotal', ctypes.c_uint16),
                ('vscan', ctypes.c_uint16),
                ('vrefresh', ctypes.c_uint32),
                ('flags', ctypes.c_uint32), ('type', ctypes.c_uint32),
                ('name', ctypes.c_char * 32)
            ]

        class drmModeCrtc(ctypes.Structure):
            _fields_ = [
                ('crtc_id', ctypes.c_uint32),
                ('buffer_id', ctypes.c_uint32),
                ('x', ctypes.c_uint32), ('y', ctypes.c_uint32),
                ('width', ctypes.c_uint32), ('height', ctypes.c_uint32),
                ('mode_valid', ctypes.c_int),
                ('mode', drmModeModeInfo),
                ('gamma_size', ctypes.c_int)
            ]

        drm = ctypes.CDLL('libdrm.so.2')
        drm.drmModeGetResources.restype = ctypes.POINTER(drmModeRes)
        drm.drmModeGetCrtc.restype = ctypes.POINTER(drmModeCrtc)

        card_path = '/dev/dri/card0'
        if os.path.exists(card_path):
            fd = os.open(card_path, os.O_RDONLY)
            res = drm.drmModeGetResources(fd)
            if res:
                r = res.contents
                for i in range(r.count_crtcs):
                    crtc_id = r.crtcs[i]
                    crtc = drm.drmModeGetCrtc(fd, crtc_id)
                    if crtc:
                        c = crtc.contents
                        if c.mode_valid and c.mode.clock > 0:
                            if c.mode.clock > max_clock_khz:
                                max_clock_khz = c.mode.clock
                            if c.mode.vrefresh > max_refresh_hz:
                                max_refresh_hz = c.mode.vrefresh
                        drm.drmModeFreeCrtc(crtc)
                drm.drmModeFreeResources(res)
            os.close(fd)
    except Exception:
        pass

    return max_clock_khz, max_refresh_hz, display_active


def get_effective_idle_state(display_info=None):
    """
    Computes effective idle state based on display refresh rate, dot clock, and DPMS.
    Clamps to P-State 07 if display pixel clock > 135 MHz (or refresh >= 100 Hz),
    dropping to configured IDLE_STATE (03) only if at <=60 Hz / <=135 MHz or DPMS off.
    """
    configured_idle = config.get("IDLE_STATE", "03")
    if not config.get("DISPLAY_120HZ_FLOOR", True):
        return configured_idle

    if display_info is None:
        display_info = get_active_display_info()
    clk_khz, ref_hz, is_active = display_info

    # High-pixel-clock / 120 Hz floor clamp (matching NVIDIA 390.157 IMP check _nv002187kms)
    if is_active and (clk_khz > 135000 or ref_hz >= 100):
        return "07"
    return configured_idle


def get_gpu_interrupt_rate(now):
    """
    Computes GPU hardware interrupts per second from /proc/interrupts for 'nvkm'.
    Reflects hardware command processing and buffer swaps with zero directory-walking overhead.
    """
    global prev_irq_count, prev_irq_time
    irq_rate = 0.0
    try:
        with open("/proc/interrupts", "r") as f:
            for line in f:
                if "nvkm" in line or "0000:01:00.0" in line:
                    parts = line.split(":")[1].split()
                    total_counts = 0
                    for p in parts:
                        if p.isdigit():
                            total_counts += int(p)
                        else:
                            break
                    if prev_irq_time > 0 and (now - prev_irq_time) > 0.05:
                        delta = max(0, total_counts - prev_irq_count)
                        irq_rate = delta / (now - prev_irq_time)
                    prev_irq_count = total_counts
                    prev_irq_time = now
                    break
    except Exception:
        pass
    return irq_rate


def read_pid_ticks(pid_str):
    """Reads utime + stime ticks for a given PID string from /proc/<pid>/stat."""
    try:
        with open(f"/proc/{pid_str}/stat", "r") as f:
            raw = f.read()
        rparen = raw.rfind(")")
        if rparen == -1:
            return None
        fields = raw[rparen + 2 :].split()
        return int(fields[11]) + int(fields[12])
    except Exception:
        return None


def get_monitored_app_ticks():
    """Sums CPU user+sys ticks for browser and desktop rendering processes."""
    total_ticks = 0
    try:
        for pid_dir in glob.glob("/proc/[0-9]*"):
            try:
                comm_path = os.path.join(pid_dir, "comm")
                with open(comm_path, "r") as f:
                    comm = f.read().strip()
                if comm in MONITORED_APPS or is_desktop_client(comm):
                    pid_str = os.path.basename(pid_dir)
                    t = read_pid_ticks(pid_str)
                    if t is not None:
                        total_ticks += t
            except (FileNotFoundError, ProcessLookupError, PermissionError):
                continue
    except Exception:
        pass
    return total_ticks


def detect_dedicated_3d_client(irq_rate=0.0, power="AC"):
    """
    Checks if a dedicated 3D application (game, emulator, benchmark, 3D/compute app) is actively running.
    Returns (is_3d_active: bool, client_desc: str or None, desired_pstate: str).
    """
    global prev_client_ticks
    current_client_ticks = {}
    active_3d_client = None
    target_state = "0f"
    threshold = config.get("CLIENT_3D_TICK_THRESHOLD", 20)

    try:
        for client_node in [active_clients_path] + CLIENTS_CANDIDATES:
            if client_node and os.path.exists(client_node):
                try:
                    with open(client_node, "r") as f:
                        lines = f.readlines()[1:]  # skip header
                    seen_candidates = {}
                    for line in lines:
                        parts = line.split()
                        if len(parts) < 2:
                            continue
                        cmd_name = parts[0]
                        tgid = parts[1]
                        if is_desktop_client(cmd_name):
                            continue
                        seen_candidates[tgid] = cmd_name

                    for tgid, cmd_name in seen_candidates.items():
                        ticks = read_pid_ticks(tgid)
                        if ticks is None:
                            continue
                        current_client_ticks[tgid] = ticks

                        # 1. Check custom per-app profiles
                        if cmd_name in app_profiles or cmd_name.lower() in app_profiles:
                            target_state = app_profiles.get(cmd_name) or app_profiles.get(cmd_name.lower())
                            active_3d_client = f"{cmd_name}[{tgid}] (profile {target_state})"
                            break

                        # 2. Check known 3D benchmarks & games
                        if cmd_name in KNOWN_3D_APPS or cmd_name.lower() in KNOWN_3D_APPS:
                            if config.get("ALLOW_OC_10", False) and power == "AC":
                                target_state = "10"
                            else:
                                target_state = "0f"
                            active_3d_client = f"{cmd_name}[{tgid}]"
                            break

                        # 3. Check active CPU ticks on unknown DRM client
                        prev_t = prev_client_ticks.get(tgid)
                        if prev_t is not None and (ticks - prev_t) >= threshold:
                            target_state = "0f"
                            active_3d_client = f"{cmd_name}[{tgid}]"
                            break

                    prev_client_ticks = current_client_ticks
                    if active_3d_client:
                        return True, active_3d_client, target_state
                except Exception:
                    pass
    except Exception:
        pass

    prev_client_ticks = current_client_ticks

    # 4. Check hardware interrupt rate threshold
    irq_thresh = config.get("INTERRUPT_THRESHOLD", 100)
    if irq_rate >= irq_thresh and len(current_client_ticks) > 0:
        return True, f"Hardware GPU Load ({int(irq_rate)} IRQs/s)", "0f"

    return False, None, "07"


def read_manual_lock():
    """Reads /run/nouveau/mode for manual lock state ('locked:<pstate>' or 'auto')."""
    try:
        if os.path.exists(MODE_PATH):
            with open(MODE_PATH, "r") as f:
                val = f.read().strip().lower()
            if val.startswith("locked:"):
                st = val.split(":", 1)[1].strip()
                if st in ("03", "07", "08", "0a", "0f", "10"):
                    return st
            elif val == "auto":
                return None
    except Exception:
        pass
    return None


def set_pstate(target_state, reason=None):
    """Writes target pstate with explicit newline to avoid driver parsing hangs."""
    if not active_pstate_path:
        return False
    try:
        with open(active_pstate_path, "w") as f:
            f.write(f"{target_state}\n")
        if reason:
            print(f"Changed GPU clock state to: {target_state} ({reason})")
        else:
            print(f"Changed GPU clock state to: {target_state}")
        sys.stdout.flush()
        return True
    except Exception as e:
        print(f"Failed to set pstate to {target_state}: {e}", file=sys.stderr)
        return False


def read_gpuva_mapped_mib():
    """Sums mapped GPU-VA ranges from debugfs (root-only). Returns MiB or None."""
    import re as _re
    for node in GPUVA_CANDIDATES:
        try:
            with open(node, "r") as f:
                raw = f.read()
        except Exception:
            continue
        total_bytes = 0
        for line in raw.splitlines():
            if "|" not in line or "start" in line.lower():
                continue
            parts = [p.strip() for p in line.split("|")]
            hexes = [p for p in parts if _re.fullmatch(r"0x[0-9a-fA-F]+", p)]
            if len(hexes) >= 2:
                try:
                    total_bytes += int(hexes[1], 16)
                except ValueError:
                    continue
        if total_bytes > 0:
            return total_bytes / (1024.0 * 1024.0)
    return None


def read_pstate_vram():
    """Parses the kernel VRAM: line from pstate (exact TTM accounting)."""
    import re as _re
    if not active_pstate_path:
        return None, None
    try:
        with open(active_pstate_path, "r") as f:
            for line in f:
                m = _re.match(r"VRAM:\s*(\d+)\s*MiB\s*/\s*(\d+)\s*MiB", line.strip())
                if m:
                    return float(m.group(1)), int(m.group(2))
    except Exception:
        pass
    return None, None


def publish_runtime_telemetry(status_dict):
    """
    Publishes world-readable snapshots of debugfs pstate, clients, vram, and governor status
    into /run/nouveau/ so unprivileged CLI/TUI tools never freeze or block on sudo.
    """
    try:
        os.makedirs(SNAPSHOT_DIR, mode=0o755, exist_ok=True)
        try:
            os.chmod(SNAPSHOT_DIR, 0o755)
        except Exception:
            pass

        # 1. Mirror pstate
        if active_pstate_path and os.path.exists(active_pstate_path):
            try:
                with open(active_pstate_path, "r") as src:
                    content = src.read()
                tmp = PSTATE_SNAPSHOT + ".tmp"
                with open(tmp, "w") as dst:
                    dst.write(content)
                os.chmod(tmp, 0o644)
                os.replace(tmp, PSTATE_SNAPSHOT)
            except Exception:
                pass

        # 2. Mirror clients
        if active_clients_path and os.path.exists(active_clients_path):
            try:
                with open(active_clients_path, "r") as src:
                    content = src.read()
                tmp = CLIENTS_SNAPSHOT + ".tmp"
                with open(tmp, "w") as dst:
                    dst.write(content)
                os.chmod(tmp, 0o644)
                os.replace(tmp, CLIENTS_SNAPSHOT)
            except Exception:
                pass

        # 3. Mode file permissions (ensure world-writable so non-root can lock/unlock)
        if not os.path.exists(MODE_PATH):
            try:
                with open(MODE_PATH, "w") as f:
                    f.write("auto\n")
                os.chmod(MODE_PATH, 0o666)
            except Exception:
                pass
        else:
            try:
                os.chmod(MODE_PATH, 0o666)
            except Exception:
                pass

        # 4. VRAM snapshot
        used, total, source = None, None, None
        pused, ptotal = read_pstate_vram()
        if pused is not None:
            used, total, source = pused, ptotal, "pstate"
        else:
            gu = read_gpuva_mapped_mib()
            if gu is not None:
                used, source = gu, "gpuva"
        if used is not None:
            tmp = VRAM_SNAPSHOT + ".tmp"
            with open(tmp, "w") as f:
                f.write(f"used_mib={used:.1f}\n")
                if total is not None:
                    f.write(f"total_mib={total}\n")
                f.write(f"source={source}\nupdated={int(time.time())}\n")
            os.chmod(tmp, 0o644)
            os.replace(tmp, VRAM_SNAPSHOT)

        # 5. Status file
        tmp = STATUS_SNAPSHOT + ".tmp"
        with open(tmp, "w") as f:
            for k, v in status_dict.items():
                f.write(f"{k}={v}\n")
            f.write(f"updated={int(time.time())}\n")
        os.chmod(tmp, 0o644)
        os.replace(tmp, STATUS_SNAPSHOT)
    except Exception:
        pass


def sleep_interruptible(duration, last_mode_mtime):
    """Sleeps up to duration seconds, waking early if /run/nouveau/mode is modified."""
    end_time = time.monotonic() + duration
    while time.monotonic() < end_time:
        try:
            if os.path.exists(MODE_PATH) and os.path.getmtime(MODE_PATH) != last_mode_mtime:
                break
        except Exception:
            pass
        time.sleep(min(0.02, max(0.005, end_time - time.monotonic())))
def handle_signal(signum, frame):
    print(f"Received signal {signum}. Reverting to safe clock state 07 before exit...")
    sys.stdout.flush()
    set_pstate("07", "daemon shutdown")
    sys.exit(0)


def main():
    global prev_app_ticks, thermal_throttled
    signal.signal(signal.SIGTERM, handle_signal)
    signal.signal(signal.SIGINT, handle_signal)
    signal.signal(signal.SIGHUP, handle_sighup)

    load_config()
    battery_throttled = False

    disp_clk, disp_ref, disp_active = get_active_display_info()
    init_idle = get_effective_idle_state((disp_clk, disp_ref, disp_active))

    print("================================================================================")
    print(" 🚀 Nouveau Dynamic Frequency & P-State Governor (v2.2.0)")
    print(f" • Configured Idle:    {config['IDLE_STATE']}")
    print(f" • Effective Floor:    {init_idle} (Display: {disp_clk/1000:.1f} MHz dot clk, {disp_ref} Hz)")
    print(f" • 120 Hz Floor Guard: {'Enabled (clamps to 07)' if config['DISPLAY_120HZ_FLOOR'] else 'Disabled'}")
    print(f" • Thermal Cap Limit:  {config['THROTTLE_TEMP']} °C (Hysteresis: {config['THROTTLE_HYST']} °C)")
    print(f" • Battery Cap:        {'07 (P8) on DC' if config['BATTERY_CAP'] else 'disabled'} (Power: {get_power_source()})")
    print(f" • Hold-Down Timers:   0f->07: {config['HOLD_0F_SECONDS']}s | 07->idle: {config['HOLD_07_SECONDS']}s")
    print(f" • Poll Interval:      {config['POLL_INTERVAL']} s")
    print(f" • App Profiles:       {len(app_profiles)} custom mappings loaded from {config['PROFILES_DIR']}")
    print("================================================================================")
    sys.stdout.flush()

    if not wait_for_pstate_node(15):
        print("Error: pstate node did not appear within 15s. Nouveau driver not loaded or debugfs not mounted?", file=sys.stderr)
        sys.exit(1)

    # Force initial idle floor immediately at boot/startup
    print(f"[*] Initializing GPU to low-power state: {init_idle}...")
    sys.stdout.flush()
    set_pstate(init_idle, "initial boot idle")

    prev_app_ticks = get_monitored_app_ticks()
    confirm_3d_polls = 0
    last_3d_time = 0.0
    last_activity_time = 0.0
    last_3d_client = None
    desired_3d_state = "0f"

    while True:
        now = time.monotonic()

        # Check for config file changes
        check_config_reload()

        # Track display resolution & refresh rate
        disp_info = get_active_display_info()
        effective_idle = get_effective_idle_state(disp_info)

        # Track hardware interrupt rate
        irq_rate = get_gpu_interrupt_rate(now)

        # 1. Thermal protection check
        gpu_temp = get_gpu_temp()
        if gpu_temp is not None:
            if not thermal_throttled and gpu_temp >= config["THROTTLE_TEMP"]:
                thermal_throttled = True
                print(f"[!] Thermal threshold reached: GPU temp {gpu_temp:.1f}°C >= {config['THROTTLE_TEMP']}°C. Throttling cap to state 07.")
                sys.stdout.flush()
            elif thermal_throttled and gpu_temp <= (config["THROTTLE_TEMP"] - config["THROTTLE_HYST"]):
                thermal_throttled = False
                print(f"[✓] Thermal threshold cleared: GPU temp {gpu_temp:.1f}°C <= {config['THROTTLE_TEMP'] - config['THROTTLE_HYST']}°C. Restoring full capability.")
                sys.stdout.flush()

        # 2. Power-source check (AC vs battery, matches proprietary 390.157:
        #    cap to P8/07 on DC, allow P0/0f on AC)
        power = get_power_source()
        on_battery = config["BATTERY_CAP"] and power == "BAT"
        if on_battery and not battery_throttled:
            battery_throttled = True
            print("[!] On battery power (DC): capping max clock to state 07.")
            sys.stdout.flush()
        elif not on_battery and battery_throttled:
            battery_throttled = False
            print("[✓] AC power restored: full capability unlocked.")
            sys.stdout.flush()

        # 3. Check manual lock override (/run/nouveau/mode)
        mode_mtime = os.path.getmtime(MODE_PATH) if os.path.exists(MODE_PATH) else 0
        manual_state = read_manual_lock()
        if manual_state:
            target_state = "07" if (thermal_throttled and manual_state in ("0f", "10")) else manual_state
            current_hardware_state = get_current_pstate()
            if current_hardware_state and current_hardware_state != target_state:
                set_pstate(target_state, f"manual lock {manual_state}")
                current_hardware_state = get_current_pstate()

            status_dict = {
                "mode": f"locked:{manual_state}",
                "active_pstate": current_hardware_state or target_state,
                "target_pstate": target_state,
                "idle_floor": effective_idle,
                "display_clock_khz": disp_info[0],
                "display_refresh_hz": disp_info[1],
                "gpu_temp": f"{gpu_temp:.1f}" if gpu_temp else "N/A",
                "thermal_throttled": str(thermal_throttled).lower(),
                "power_source": power,
                "battery_throttled": str(battery_throttled).lower(),
                "interrupts_per_sec": f"{irq_rate:.1f}",
            }
            publish_runtime_telemetry(status_dict)
            sleep_interruptible(config["POLL_INTERVAL"], mode_mtime)
            continue

        # 4. Check for dedicated 3D apps (games, emulators, benchmarks)
        raw_3d, client_desc, client_target_state = detect_dedicated_3d_client(irq_rate, power)
        if raw_3d:
            confirm_3d_polls += 1
            last_3d_client = client_desc
            desired_3d_state = client_target_state
        else:
            confirm_3d_polls = 0

        # Known 3D apps and profile matches scale on first poll; unknown active DRM clients require confirmation
        is_immediate = client_desc and (
            client_desc.split("[")[0] in KNOWN_3D_APPS
            or client_desc.split("[")[0] in app_profiles
            or "profile" in client_desc
        )
        required_polls = 1 if is_immediate else max(1, config.get("UPCLOCK_3D_CONFIRM_POLLS", 2))
        dedicated_3d = raw_3d and (confirm_3d_polls >= required_polls)

        if dedicated_3d:
            last_3d_time = now
            last_activity_time = now

        # 5. Check for active WebGL / 3D Canvas / video load in browsers or compositors
        current_ticks = get_monitored_app_ticks()
        tick_delta = max(0, current_ticks - prev_app_ticks)
        prev_app_ticks = current_ticks

        browser_active = (tick_delta > config["LOAD_TICK_THRESHOLD"])
        if browser_active:
            last_activity_time = now

        # 6. Determine target state with PowerMizer hold-down hysteresis
        capped = thermal_throttled or battery_throttled
        hold_0f_sec = max(1, config.get("HOLD_0F_SECONDS", 8))
        hold_07_sec = max(1, config.get("HOLD_07_SECONDS", 5))
        reason = None

        if dedicated_3d or (last_3d_time > 0 and (now - last_3d_time) < hold_0f_sec):
            if capped:
                target_state = "07"
                reason = "3D active (capped)"
            else:
                target_state = desired_3d_state
                reason = f"3D client: {last_3d_client}" if dedicated_3d else f"{desired_3d_state} hold-down"
        elif browser_active or (last_activity_time > 0 and (now - last_activity_time) < hold_07_sec):
            # Desktop/browser/video load or stepping down from 0f: hold at 07 (zero memory reclock!)
            target_state = "07"
            reason = f"2D/browser load ({tick_delta} ticks)" if browser_active else "07 hold-down"
        else:
            target_state = effective_idle
            reason = f"idle ({'120Hz floor' if effective_idle == '07' else 'standard'})"

        if target_state:
            current_hardware_state = get_current_pstate()
            if current_hardware_state and current_hardware_state != target_state:
                set_pstate(target_state, reason)
                current_hardware_state = get_current_pstate()

        # Publish world-readable snapshots
        status_dict = {
            "mode": "auto",
            "active_pstate": current_hardware_state or target_state,
            "target_pstate": target_state,
            "idle_floor": effective_idle,
            "display_clock_khz": disp_info[0],
            "display_refresh_hz": disp_info[1],
            "gpu_temp": f"{gpu_temp:.1f}" if gpu_temp else "N/A",
            "thermal_throttled": str(thermal_throttled).lower(),
            "power_source": power,
            "battery_throttled": str(battery_throttled).lower(),
            "interrupts_per_sec": f"{irq_rate:.1f}",
        }
        publish_runtime_telemetry(status_dict)

        sleep_interruptible(config["POLL_INTERVAL"], mode_mtime)


if __name__ == "__main__":
    main()
