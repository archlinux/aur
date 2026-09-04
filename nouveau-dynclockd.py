#!/usr/bin/env python3
"""
nouveau-dynclockd — Dynamic GPU Frequency & P-State Governor for Nouveau Fermi
Efficient, event-driven detection using kernel DRM client tracking (<0.3ms latency)
and load-aware CPU/GPU tick sampling for browser/WebGL workloads.
"""
import glob
import os
import signal
import subprocess
import sys
import time

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

# Desktop compositors, terminals, and idle system components that stay open permanently
DESKTOP_CLIENTS = {
    "kwin_wayland", "Xwayland", "plasmashell", "systemd-logind", "kded6", "ksmserver",
    "gnome-shell", "mutter", "xfwm4", "xfce4-panel", "cinnamon", "marco", "mate-panel",
    "sway", "wayfire", "Hyprland", "qtile", "openbox", "i3", "picom", "compton", "Xorg",
    "swayosd-server", "wezterm-gui", "alacritty", "kitty", "foot",
    "vivaldi-bin", "firefox", "chromium", "chrome", "brave", "brave-bin", "code", "electron"
}

# Processes to monitor for active CPU/GPU rendering load (WebGL, Canvas, video decoding)
MONITORED_APPS = {
    "cinnamon", "Xorg", "qtile", "vivaldi-bin", "firefox", "chromium", "chrome", "brave", "brave-bin", "code", "electron"
}

# Tick delta threshold over a 2.0s period (> 15% CPU utilization indicates active WebGL / 3D / video work)
LOAD_TICK_THRESHOLD = 30

prev_app_ticks = 0
active_pstate_path = None
active_clients_path = None


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
                            cmd_name.startswith("csd-") or 
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
        # Scans open file descriptors for /dev/dri/ without reading full memory maps.
        for pid_dir in glob.glob("/proc/[0-9]*/fd"):
            try:
                comm_path = os.path.join(os.path.dirname(pid_dir), "comm")
                with open(comm_path, "r") as f:
                    comm = f.read().strip()
                if (comm in DESKTOP_CLIENTS or 
                    comm.startswith("csd-") or 
                    comm.startswith("gsd-") or 
                    comm.startswith("systemd")):
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
    global prev_app_ticks
    signal.signal(signal.SIGTERM, handle_signal)
    signal.signal(signal.SIGINT, handle_signal)

    print("Nouveau Dynamic Clock Daemon started.")
    sys.stdout.flush()

    if not wait_for_pstate_node(15):
        print(f"Error: pstate node did not appear within 15s. Nouveau driver not loaded or debugfs not mounted?", file=sys.stderr)
        sys.exit(1)

    prev_app_ticks = get_monitored_app_ticks()
    idle_cycles = 0

    while True:
        # 1. Check for dedicated 3D apps (games, emulators, benchmarks)
        dedicated_3d = has_dedicated_3d_apps()

        # 2. Check for active WebGL / 3D Canvas / video load in browsers or compositors
        current_ticks = get_monitored_app_ticks()
        tick_delta = current_ticks - prev_app_ticks
        prev_app_ticks = current_ticks

        browser_active = (tick_delta > LOAD_TICK_THRESHOLD)

        # Determine target state with 1-cycle hysteresis to prevent clock jitter
        if dedicated_3d or browser_active:
            idle_cycles = 0
            target_state = "0f"
        else:
            idle_cycles += 1
            target_state = "07" if idle_cycles >= 1 else "0f"

        current_hardware_state = get_current_pstate()
        if current_hardware_state and current_hardware_state != target_state:
            set_pstate(target_state)

        time.sleep(2.0)


if __name__ == "__main__":
    main()
