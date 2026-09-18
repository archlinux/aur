#!/usr/bin/env python3
"""
nouveau-dynclockd — Dynamic GPU Frequency & P-State Governor for Nouveau Fermi
Efficient, event-driven detection using kernel DRM client tracking (<0.3ms latency)
and load-aware CPU/GPU tick sampling for browser/WebGL workloads.
Features:
- Forces P-State 03 (50 MHz / 324 MHz) immediately at boot/startup and during idle
- High sensitivity to 3D apps and browser rendering workloads (<1.0s response)
- Thermal protection: caps highest clock to P-State 07 when temperature exceeds threshold (default 80°C)
- Runtime configurable via /etc/nouveau-dynclockd.conf and SIGHUP
"""
import glob
import os
import signal
import subprocess
import sys
import time

CONFIG_PATH = "/etc/nouveau-dynclockd.conf"

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

# Desktop compositors, terminals, and idle system components that stay open permanently
DESKTOP_CLIENTS = {
    "kwin_wayland", "Xwayland", "plasmashell", "systemd-logind", "kded6", "ksmserver",
    "gnome-shell", "mutter", "xfwm4", "xfce4-panel", "cinnamon", "marco", "mate-panel",
    "sway", "wayfire", "Hyprland", "qtile", "openbox", "i3", "picom", "compton", "Xorg",
    "swayosd-server", "wezterm-gui", "alacritty", "kitty", "foot",
    "vivaldi-bin", "firefox", "chromium", "chrome", "brave", "brave-bin", "code", "electron", "xdg-desktop-por"
}

# Processes to monitor for active CPU/GPU rendering load (WebGL, Canvas, video decoding)
MONITORED_APPS = {
    "cinnamon", "Xorg", "qtile", "vivaldi-bin", "firefox", "chromium", "chrome", "brave", "brave-bin", "code", "electron", "xdg-desktop-por"
}

DEFAULT_CONFIG = {
    "THROTTLE_TEMP": 80,
    "THROTTLE_HYST": 5,
    "POLL_INTERVAL": 1.0,
    "LOAD_TICK_THRESHOLD": 40,
    "IDLE_STATE": "03",
}

config = dict(DEFAULT_CONFIG)
config_mtime = 0
prev_app_ticks = 0
active_pstate_path = None
active_clients_path = None
thermal_throttled = False


def load_config():
    global config, config_mtime
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
                        if k in ("THROTTLE_TEMP", "THROTTLE_HYST", "LOAD_TICK_THRESHOLD"):
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
        except Exception as e:
            print(f"Warning: Could not read {CONFIG_PATH}: {e}", file=sys.stderr)
    config = new_cfg
    return config


def check_config_reload():
    global config_mtime
    if os.path.exists(CONFIG_PATH):
        try:
            mtime = os.path.getmtime(CONFIG_PATH)
            if mtime > config_mtime:
                load_config()
                print(f"[*] Configuration auto-reloaded from {CONFIG_PATH}: THROTTLE_TEMP={config['THROTTLE_TEMP']}°C")
                sys.stdout.flush()
        except Exception:
            pass


def handle_sighup(signum, frame):
    load_config()
    print(f"[*] SIGHUP received: Configuration reloaded: THROTTLE_TEMP={config['THROTTLE_TEMP']}°C, IDLE_STATE={config['IDLE_STATE']}")
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


def get_monitored_app_ticks():
    """Sums CPU user+sys ticks for browser and desktop rendering processes."""
    total_ticks = 0
    try:
        for pid_dir in glob.glob("/proc/[0-9]*"):
            try:
                comm_path = os.path.join(pid_dir, "comm")
                with open(comm_path, "r") as f:
                    comm = f.read().strip()
                if comm in MONITORED_APPS:
                    stat_path = os.path.join(pid_dir, "stat")
                    with open(stat_path, "r") as f:
                        fields = f.read().split()
                        total_ticks += int(fields[13]) + int(fields[14])
            except (FileNotFoundError, ProcessLookupError, PermissionError):
                continue
    except Exception:
        pass
    return total_ticks


def has_dedicated_3d_apps():
    """
    Checks if dedicated 3D applications (games, emulators, benchmarks, 3D apps) are running.
    Uses ultra-fast (<0.3ms) direct kernel DRM client table, with an fd fallback only if debugfs is missing.
    """
    try:
        # Fast Path 1: Check direct DRM clients registered in the kernel (< 0.3 ms)
        for client_node in [active_clients_path] + CLIENTS_CANDIDATES:
            if client_node and os.path.exists(client_node):
                try:
                    with open(client_node, "r") as f:
                        lines = f.readlines()[1:]  # skip header
                    for line in lines:
                        parts = line.split()
                        if not parts:
                            continue
                        cmd_name = parts[0]
                        if (cmd_name in DESKTOP_CLIENTS or 
                            cmd_name.startswith(("csd-", "gsd-", "systemd", "xdg-", "dconf-", "wireplumber", "pipewire", "polkit")) or 
                            cmd_name.startswith("gsd-") or 
                            cmd_name.startswith("systemd") or
                            cmd_name == "<unset>"):
                            continue
                        return True
                    # Debugfs client table was parsed cleanly
                    return False
                except Exception:
                    pass

        # Lightweight Fallback: Only executed if debugfs client nodes are unmounted/inaccessible.
        for pid_dir in glob.glob("/proc/[0-9]*/fd"):
            try:
                comm_path = os.path.join(os.path.dirname(pid_dir), "comm")
                with open(comm_path, "r") as f:
                    comm = f.read().strip()
                if (comm in DESKTOP_CLIENTS or 
                    comm.startswith(("csd-", "gsd-", "systemd", "xdg-", "dconf-", "wireplumber", "pipewire", "polkit"))):
                    continue
                for fd_entry in os.scandir(pid_dir):
                    try:
                        target = os.readlink(fd_entry.path)
                        if target.startswith("/dev/dri/renderD") or target.startswith("/dev/dri/card"):
                            return True
                    except (FileNotFoundError, OSError):
                        continue
            except (FileNotFoundError, ProcessLookupError, PermissionError):
                continue
    except Exception:
        pass
    return False


def set_pstate(target_state):
    """Writes target pstate with explicit newline to avoid driver parsing hangs."""
    if not active_pstate_path:
        return False
    try:
        with open(active_pstate_path, "w") as f:
            f.write(f"{target_state}\n")
        print(f"Changed GPU clock state to: {target_state}")
        sys.stdout.flush()
        return True
    except Exception as e:
        print(f"Failed to set pstate to {target_state}: {e}", file=sys.stderr)
        return False


def handle_signal(signum, frame):
    print(f"Received signal {signum}. Reverting to safe clock state 07 before exit...")
    sys.stdout.flush()
    set_pstate("07")
    sys.exit(0)


def main():
    global prev_app_ticks, thermal_throttled
    signal.signal(signal.SIGTERM, handle_signal)
    signal.signal(signal.SIGINT, handle_signal)
    signal.signal(signal.SIGHUP, handle_sighup)

    load_config()

    print("================================================================================")
    print(" 🚀 Nouveau Dynamic Frequency & P-State Governor")
    print(f" • Idle P-State:       {config['IDLE_STATE']}")
    print(f" • Thermal Cap Limit: {config['THROTTLE_TEMP']} °C (Hysteresis: {config['THROTTLE_HYST']} °C)")
    print(f" • Poll Interval:     {config['POLL_INTERVAL']} s")
    print("================================================================================")
    sys.stdout.flush()

    if not wait_for_pstate_node(15):
        print("Error: pstate node did not appear within 15s. Nouveau driver not loaded or debugfs not mounted?", file=sys.stderr)
        sys.exit(1)

    # Force initial idle state (P-State 03: 50 MHz core / 324 MHz mem / 0.820 V) immediately at boot/startup
    print(f"[*] Initializing GPU to low-power idle state: {config['IDLE_STATE']}...")
    sys.stdout.flush()
    set_pstate(config["IDLE_STATE"])

    prev_app_ticks = get_monitored_app_ticks()
    idle_cycles = 5  # Start in idle state

    while True:
        # Check for config file changes
        check_config_reload()

        # 1. Thermal protection check
        gpu_temp = get_gpu_temp()
        if gpu_temp is not None:
            if not thermal_throttled and gpu_temp >= config["THROTTLE_TEMP"]:
                thermal_throttled = True
                print(f"[!] Thermal threshold reached: GPU temp {gpu_temp:.1f}°C >= {config['THROTTLE_TEMP']}°C. Throttling cap to state 07.")
                sys.stdout.flush()
            elif thermal_throttled and gpu_temp <= (config["THROTTLE_TEMP"] - config["THROTTLE_HYST"]):
                thermal_throttled = False
                print(f"[✓] Thermal threshold cleared: GPU temp {gpu_temp:.1f}°C <= {config['THROTTLE_TEMP'] - config['THROTTLE_HYST']}°C. Restoring full 0f capability.")
                sys.stdout.flush()

        # 2. Check for dedicated 3D apps (games, emulators, benchmarks)
        dedicated_3d = has_dedicated_3d_apps()

        # 3. Check for active WebGL / 3D Canvas / video load in browsers or compositors
        current_ticks = get_monitored_app_ticks()
        tick_delta = current_ticks - prev_app_ticks
        prev_app_ticks = current_ticks

        browser_active = (tick_delta > config["LOAD_TICK_THRESHOLD"])

        # Determine target state: Two-stage load-aware scaling
        if dedicated_3d:
            idle_cycles = 0
            # Dedicated 3D games/benchmarks: scale to 0f (or cap to 07 if throttled)
            target_state = "07" if thermal_throttled else "0f"
        elif browser_active:
            idle_cycles = 0
            # Desktop/browser/video load: scale to 07 (zero memory reclock flash!)
            target_state = "07"
        else:
            idle_cycles += 1
            # Step down to configured idle state (03) after 2 consecutive idle samples (~2s)
            target_state = config["IDLE_STATE"] if idle_cycles >= 2 else None

        if target_state:
            current_hardware_state = get_current_pstate()
            if current_hardware_state and current_hardware_state != target_state:
                set_pstate(target_state)

        time.sleep(config["POLL_INTERVAL"])


if __name__ == "__main__":
    main()
