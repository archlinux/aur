#!/usr/bin/env python3
import glob
import os
import signal
import subprocess
import sys
import time

PSTATE_PATH = "/sys/kernel/debug/dri/0/pstate"
CLIENTS_PATH = "/sys/kernel/debug/dri/0/clients"

# Desktop and browser clients that stay open permanently and need load-aware monitoring
DESKTOP_CLIENTS = {
    "kwin_wayland", "Xwayland", "plasmashell", "systemd-logind", "kded6", "ksmserver",
    "gnome-shell", "mutter", "xfwm4", "xfce4-panel", "cinnamon", "marco", "mate-panel",
    "sway", "wayfire", "Hyprland", "openbox", "i3", "picom", "compton", "Xorg",
    "vivaldi-bin", "firefox", "chromium", "chrome", "brave", "brave-bin", "code", "electron"
}

# Processes to monitor for active CPU/GPU rendering load (WebGL, Canvas, video decoding)
MONITORED_APPS = {
    "cinnamon", "Xorg", "vivaldi-bin", "firefox", "chromium", "chrome", "brave", "brave-bin", "code", "electron"
}

# Tick delta threshold over a 2.0s period (> 15% CPU utilization indicates active WebGL / 3D / video work)
LOAD_TICK_THRESHOLD = 30

prev_app_ticks = 0


def wait_for_pstate_node(timeout=15):
    """Wait for the debugfs pstate file to become available during early boot."""
    start_time = time.time()
    while time.time() - start_time < timeout:
        if os.path.exists(PSTATE_PATH):
            return True
        time.sleep(0.5)
    return False


def get_current_pstate():
    """Reads the true active hardware pstate marked with * in debugfs."""
    try:
        with open(PSTATE_PATH, "r") as f:
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
    """Checks if dedicated 3D applications (games, emulators, benchmarks, Wayland clients) are running."""
    try:
        # 1. Check direct DRM clients
        if os.path.exists(CLIENTS_PATH):
            with open(CLIENTS_PATH, "r") as f:
                lines = f.readlines()[1:]
            for line in lines:
                parts = line.split()
                if not parts:
                    continue
                cmd_name = parts[0]
                if (cmd_name in DESKTOP_CLIENTS or 
                    cmd_name.startswith("csd-") or 
                    cmd_name.startswith("gsd-") or 
                    cmd_name.startswith("systemd")):
                    continue
                return True

        # 2. Check Wayland / EGL / OpenGL process memory maps
        for pid_dir in glob.glob("/proc/[0-9]*"):
            try:
                comm_path = os.path.join(pid_dir, "comm")
                with open(comm_path, "r") as f:
                    comm = f.read().strip()
                if (comm in DESKTOP_CLIENTS or 
                    comm.startswith("csd-") or 
                    comm.startswith("gsd-") or 
                    comm.startswith("systemd")):
                    continue
                maps_path = os.path.join(pid_dir, "maps")
                with open(maps_path, "r") as f:
                    maps_content = f.read()
                if ("nouveau_dri.so" in maps_content or 
                    "libGLX_mesa.so" in maps_content or 
                    "libEGL_mesa.so" in maps_content or 
                    "libvulkan.so" in maps_content):
                    return True
            except (FileNotFoundError, ProcessLookupError, PermissionError):
                continue
        return False
    except Exception:
        pass
    return False


def set_pstate(target_state):
    """Writes target pstate with explicit newline to avoid driver parsing hangs."""
    try:
        with open(PSTATE_PATH, "w") as f:
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
        print(f"Error: {PSTATE_PATH} did not appear within 15s. Nouveau driver not loaded or debugfs not mounted?", file=sys.stderr)
        sys.exit(1)

    prev_app_ticks = get_monitored_app_ticks()
    idle_cycles = 0

    while True:
        # 1. Check for dedicated 3D apps (e.g. glxgears, games, emulators)
        dedicated_3d = has_dedicated_3d_apps()

        # 2. Check for active WebGL / 3D Canvas / video load in browsers or compositors
        current_ticks = get_monitored_app_ticks()
        tick_delta = current_ticks - prev_app_ticks
        prev_app_ticks = current_ticks

        browser_active = (tick_delta > LOAD_TICK_THRESHOLD)

        # Determine target state with 1-cycle hysteresis to prevent jitter
        if dedicated_3d or browser_active:
            idle_cycles = 0
            target_state = "0f"
        else:
            idle_cycles += 1
            target_state = "07" if idle_cycles >= 1 else "0f"

        current_hardware_state = get_current_pstate()
        if current_hardware_state != target_state:
            set_pstate(target_state)

        time.sleep(2.0)


if __name__ == "__main__":
    main()
