"""
ryzen.py - backend for ryzenadj-gtk
Handles: parsing ryzenadj -i output, applying settings, config persistence
"""
import subprocess
import json
import os
import re
import logging

CONFIG_FILE = os.path.expanduser("~/.config/ryzenadj-gtk/settings.json")
PROFILES_FILE = os.path.expanduser("~/.config/ryzenadj-gtk/profiles.json")
SYSTEM_CONFIG_DIR = "/etc/ryzenadj-gtk"
SYSTEM_CONFIG_FILE = "/etc/ryzenadj-gtk/settings.json"
SUDOERS_DROP_IN = "/etc/sudoers.d/ryzenadj-gtk"

log = logging.getLogger(__name__)

import threading
import shutil

_hardware_lock = threading.Lock()

def is_ryzenadj_installed() -> bool:
    """Check if the ryzenadj binary exists in the system PATH."""
    return shutil.which("ryzenadj") is not None

def _run_elevated(cmd: list[str], **kwargs) -> subprocess.CompletedProcess:
    """Run elevated with sudo -n (requires passwordless sudo configuration)."""
    sudo_cmd = ["sudo", "-n"] + cmd
    with _hardware_lock:
        return subprocess.run(sudo_cmd, **kwargs)

# Mapping from ryzenadj -i output Name -> parameter name used in CLI
# Also includes unit and display metadata
METRIC_MAP = {
    "STAPM LIMIT":         {"param": "stapm-limit",        "unit": "mW",  "scale": 1000, "category": "power"},
    "STAPM VALUE":         {"param": None,                  "unit": "W",   "scale": 1,    "category": "power"},
    "PPT LIMIT FAST":      {"param": "fast-limit",         "unit": "mW",  "scale": 1000, "category": "power"},
    "PPT VALUE FAST":      {"param": None,                  "unit": "W",   "scale": 1,    "category": "power"},
    "PPT LIMIT SLOW":      {"param": "slow-limit",         "unit": "mW",  "scale": 1000, "category": "power"},
    "PPT VALUE SLOW":      {"param": None,                  "unit": "W",   "scale": 1,    "category": "power"},
    "PPT LIMIT APU":       {"param": "apu-slow-limit",     "unit": "mW",  "scale": 1000, "category": "power"},
    "PPT VALUE APU":       {"param": None,                  "unit": "W",   "scale": 1,    "category": "power"},
    "TDC LIMIT VDD":       {"param": "vrm-current",        "unit": "A",   "scale": 1000, "category": "current"},
    "TDC VALUE VDD":       {"param": None,                  "unit": "A",   "scale": 1,    "category": "current"},
    "TDC LIMIT SOC":       {"param": "vrmsoc-current",     "unit": "A",   "scale": 1000, "category": "current"},
    "TDC VALUE SOC":       {"param": None,                  "unit": "A",   "scale": 1,    "category": "current"},
    "EDC LIMIT VDD":       {"param": "vrmmax-current",     "unit": "A",   "scale": 1000, "category": "current"},
    "EDC VALUE VDD":       {"param": None,                  "unit": "A",   "scale": 1,    "category": "current"},
    "EDC LIMIT SOC":       {"param": "vrmsocmax-current",  "unit": "A",   "scale": 1000, "category": "current"},
    "EDC VALUE SOC":       {"param": None,                  "unit": "A",   "scale": 1,    "category": "current"},
    "THM LIMIT CORE":      {"param": "tctl-temp",          "unit": "°C",  "scale": 1,    "category": "thermal"},
    "THM VALUE CORE":      {"param": None,                  "unit": "°C",  "scale": 1,    "category": "thermal"},
    "STT LIMIT APU":       {"param": "apu-skin-temp",      "unit": "°C",  "scale": 1,    "category": "thermal"},
    "STT VALUE APU":       {"param": None,                  "unit": "°C",  "scale": 1,    "category": "thermal"},
    "STT LIMIT dGPU":      {"param": "dgpu-skin-temp",     "unit": "°C",  "scale": 1,    "category": "thermal"},
    "STT VALUE dGPU":      {"param": None,                  "unit": "°C",  "scale": 1,    "category": "thermal"},
    "StapmTimeConst":      {"param": "stapm-time",         "unit": "s",   "scale": 1,    "category": "timing"},
    "SlowPPTTimeConst":    {"param": "slow-time",          "unit": "s",   "scale": 1,    "category": "timing"},
    "CCLK Boost SETPOINT": {"param": None,                  "unit": "",    "scale": 1,    "category": "info"},
    "CCLK BUSY VALUE":     {"param": None,                  "unit": "",    "scale": 1,    "category": "info"},
}

# Settable parameters with UI metadata
SETTINGS_PARAMS = [
    # Power limits (values from ryzenadj -i are in W; CLI takes mW)
    {
        "param": "stapm-limit",
        "label": "STAPM Limit",
        "desc": "Sustained Power Limit (STAPM)",
        "min": 5000, "max": 130000, "step": 1000,
        "unit": "mW", "display_divisor": 1000, "display_unit": "W",
        "category": "power",
        "value_key": "STAPM LIMIT",
    },
    {
        "param": "fast-limit",
        "label": "PPT Fast Limit",
        "desc": "Actual Power Limit (PPT FAST)",
        "min": 5000, "max": 130000, "step": 1000,
        "unit": "mW", "display_divisor": 1000, "display_unit": "W",
        "category": "power",
        "value_key": "PPT LIMIT FAST",
    },
    {
        "param": "slow-limit",
        "label": "PPT Slow Limit",
        "desc": "Average Power Limit (PPT SLOW)",
        "min": 5000, "max": 130000, "step": 1000,
        "unit": "mW", "display_divisor": 1000, "display_unit": "W",
        "category": "power",
        "value_key": "PPT LIMIT SLOW",
    },
    {
        "param": "apu-slow-limit",
        "label": "APU PPT Slow Limit",
        "desc": "APU PPT Slow limit (A+A dGPU platforms)",
        "min": 5000, "max": 130000, "step": 1000,
        "unit": "mW", "display_divisor": 1000, "display_unit": "W",
        "category": "power",
        "value_key": "PPT LIMIT APU",
    },
    # Current limits (values from ryzenadj -i are in A; CLI takes mA)
    {
        "param": "vrm-current",
        "label": "VRM VDD Current (TDC)",
        "desc": "TDC Limit VDD - VRM Current",
        "min": 10000, "max": 300000, "step": 1000,
        "unit": "mA", "display_divisor": 1000, "display_unit": "A",
        "category": "current",
        "value_key": "TDC LIMIT VDD",
    },
    {
        "param": "vrmsoc-current",
        "label": "VRM SoC Current (TDC)",
        "desc": "TDC Limit SoC - VRM SoC Current",
        "min": 10000, "max": 100000, "step": 1000,
        "unit": "mA", "display_divisor": 1000, "display_unit": "A",
        "category": "current",
        "value_key": "TDC LIMIT SOC",
    },
    {
        "param": "vrmmax-current",
        "label": "VRM VDD Max Current (EDC)",
        "desc": "EDC Limit VDD - VRM Maximum Current",
        "min": 10000, "max": 300000, "step": 1000,
        "unit": "mA", "display_divisor": 1000, "display_unit": "A",
        "category": "current",
        "value_key": "EDC LIMIT VDD",
    },
    {
        "param": "vrmsocmax-current",
        "label": "VRM SoC Max Current (EDC)",
        "desc": "EDC Limit SoC - VRM SoC Maximum Current",
        "min": 10000, "max": 100000, "step": 1000,
        "unit": "mA", "display_divisor": 1000, "display_unit": "A",
        "category": "current",
        "value_key": "EDC LIMIT SOC",
    },
    # Thermal limits
    {
        "param": "tctl-temp",
        "label": "Tctl Temperature Limit",
        "desc": "CPU die temperature ceiling",
        "min": 40, "max": 105, "step": 1,
        "unit": "°C", "display_divisor": 1, "display_unit": "°C",
        "category": "thermal",
        "value_key": "THM LIMIT CORE",
    },
    {
        "param": "apu-skin-temp",
        "label": "APU Skin Temp Limit",
        "desc": "STT Limit APU - skin temperature",
        "min": 20, "max": 100, "step": 1,
        "unit": "°C", "display_divisor": 1, "display_unit": "°C",
        "category": "thermal",
        "value_key": "STT LIMIT APU",
    },
    {
        "param": "dgpu-skin-temp",
        "label": "dGPU Skin Temp Limit",
        "desc": "STT Limit dGPU - discrete GPU skin temperature",
        "min": 0, "max": 100, "step": 1,
        "unit": "°C", "display_divisor": 1, "display_unit": "°C",
        "category": "thermal",
        "value_key": "STT LIMIT dGPU",
    },
    {
        "param": "skin-temp-limit",
        "label": "Skin Temp Power Limit",
        "desc": "Skin Temperature Power Limit (controls power envelope when skin threshold reached)",
        "min": 5000, "max": 130000, "step": 1000,
        "unit": "mW", "display_divisor": 1000, "display_unit": "W",
        "category": "thermal",
        "value_key": "SkinTempLimit",
    },
    # Timing
    {
        "param": "stapm-time",
        "label": "STAPM Constant Time",
        "desc": "STAPM time constant (seconds)",
        "min": 0, "max": 1000, "step": 10,
        "unit": "s", "display_divisor": 1, "display_unit": "s",
        "category": "timing",
        "value_key": "StapmTimeConst",
    },
    {
        "param": "slow-time",
        "label": "Slow PPT Time Constant",
        "desc": "Slow PPT time constant (seconds)",
        "min": 0, "max": 1000, "step": 10,
        "unit": "s", "display_divisor": 1, "display_unit": "s",
        "category": "timing",
        "value_key": "SlowPPTTimeConst",
    },
    # GPU Options
    {
        "param": "max-gfxclk",
        "label": "Max iGPU Clock",
        "desc": "Maximum graphics core clock frequency ceiling",
        "min": 400, "max": 3500, "step": 50,
        "unit": "MHz", "display_divisor": 1, "display_unit": "MHz",
        "category": "clocks",
        "value_key": "GFX CLK LIMIT (MAX)",
        "is_gpu": True,
    },
    {
        "param": "min-gfxclk",
        "label": "Min iGPU Clock",
        "desc": "Minimum graphics core clock frequency floor",
        "min": 400, "max": 3500, "step": 50,
        "unit": "MHz", "display_divisor": 1, "display_unit": "MHz",
        "category": "clocks",
        "value_key": "GFX CLK LIMIT (MIN)",
        "is_gpu": True,
    },
    {
        "param": "vrmgfx-current",
        "label": "VRM iGPU Current (TDC)",
        "desc": "TDC Limit GFX - graphics VRM current limit",
        "min": 10000, "max": 150000, "step": 1000,
        "unit": "mA", "display_divisor": 1000, "display_unit": "A",
        "category": "current",
        "value_key": "TDC LIMIT GFX",
        "is_gpu": True,
    },
    {
        "param": "vrmgfxmax-current",
        "label": "VRM iGPU Max Current (EDC)",
        "desc": "EDC Limit GFX - graphics VRM maximum peak current",
        "min": 10000, "max": 180000, "step": 1000,
        "unit": "mA", "display_divisor": 1000, "display_unit": "A",
        "category": "current",
        "value_key": "EDC LIMIT GFX",
        "is_gpu": True,
    },
    # CPU Options
    {
        "param": "oc-clk",
        "label": "CPU Manual Overclock Clock",
        "desc": "Forced manual CPU core frequency (Enables OC mode)",
        "min": 1000, "max": 6000, "step": 25,
        "unit": "MHz", "display_divisor": 1, "display_unit": "MHz",
        "category": "clocks",
        "value_key": "CPU OC CLK",
        "is_cpu": True,
    },
    {
        "param": "oc-volt",
        "label": "CPU Manual Overclock Voltage",
        "desc": "Forced manual CPU core voltage (Enables OC mode)",
        "min": 700, "max": 1500, "step": 5,
        "unit": "mV", "display_divisor": 1, "display_unit": "mV",
        "category": "current",
        "value_key": "CPU OC VOLT",
        "is_cpu": True,
    },

    # GFX Forced Clock
    {
        "param": "gfx-clk",
        "label": "Forced iGPU Clock",
        "desc": "Force graphics core clock speed (Renoir Only)",
        "min": 400, "max": 3000, "step": 25,
        "unit": "MHz", "display_divisor": 1, "display_unit": "MHz",
        "category": "clocks",
        "value_key": "GFX FORCED CLK",
        "is_gpu": True,
    },
    # SoC Clock Limits
    {
        "param": "max-socclk-frequency",
        "label": "Max SoC Clock",
        "desc": "Maximum System-on-Chip (SoC) clock speed",
        "min": 400, "max": 2000, "step": 33,
        "unit": "MHz", "display_divisor": 1, "display_unit": "MHz",
        "category": "clocks",
        "value_key": "SOCCLK LIMIT (MAX)",
        "is_cpu": True,
    },
    {
        "param": "min-socclk-frequency",
        "label": "Min SoC Clock",
        "desc": "Minimum System-on-Chip (SoC) clock speed",
        "min": 400, "max": 2000, "step": 33,
        "unit": "MHz", "display_divisor": 1, "display_unit": "MHz",
        "category": "clocks",
        "value_key": "SOCCLK LIMIT (MIN)",
        "is_cpu": True,
    },

    # VRM CVIP Current Limit
    {
        "param": "vrmcvip-current",
        "label": "VRM CVIP Current (TDC)",
        "desc": "TDC Limit CVIP - processor fabric current limit",
        "min": 5000, "max": 100000, "step": 1000,
        "unit": "mA", "display_divisor": 1000, "display_unit": "A",
        "category": "current",
        "value_key": "TDC LIMIT CVIP",
        "is_cpu": True,
    },
    # PROCHOT Ramp Time
    {
        "param": "prochot-deassertion-ramp",
        "label": "PROCHOT Deassertion Ramp",
        "desc": "Ramp time after processor hot signal is deasserted",
        "min": 0, "max": 5000, "step": 100,
        "unit": "ms", "display_divisor": 1, "display_unit": "ms",
        "category": "timing",
        "value_key": "PROCHOT Ramp",
    },
]

# ── Dynamic Curve Optimizer Parameters ───────────────────────────────────────
def _get_physical_core_count() -> int:
    """Detect the number of physical CPU cores."""
    try:
        # Count unique physical cores using core_cpus_list to handle multi-CCD setups
        cores = set()
        for i in range(os.cpu_count() or 1):
            path = f'/sys/devices/system/cpu/cpu{i}/topology/core_cpus_list'
            if os.path.exists(path):
                with open(path) as f:
                    cores.add(f.read().strip())
        if cores:
            return len(cores)
    except Exception:
        pass
    count = os.cpu_count()
    return (count // 2) if count else 8


def is_on_ac_power() -> bool:
    """Check if the system is currently connected to AC power."""
    try:
        for name in os.listdir("/sys/class/power_supply"):
            if name.startswith("AC") or "ad" in name.lower() or "charger" in name.lower():
                path = f"/sys/class/power_supply/{name}/online"
                if os.path.exists(path):
                    with open(path, "r") as f:
                        return f.read().strip() == "1"
    except Exception as e:
        log.debug("Failed to check AC power supply: %s", e)
    return True  # Default to AC power if check fails or on desktop


def check_system_lockdown_status() -> dict:
    """Detect if Secure Boot, Kernel Lockdown, or missing kernel flags are blocking ryzenadj."""
    status = {
        "secure_boot": False,
        "lockdown_active": False,
        "lockdown_mode": "none",
        "iomem_relaxed": True,
        "ryzen_smu_loaded": False
    }

    # 1. Check Secure Boot state
    for path in [
        "/sys/firmware/efi/efivars/SecureBoot-8be4df61-93ca-11d2-aa0d-00e098032b8c/data",
        "/sys/firmware/efi/vars/SecureBoot-8be4df61-93ca-11d2-aa0d-00e098032b8c/data"
    ]:
        if os.path.exists(path):
            try:
                with open(path, "rb") as f:
                    data = f.read()
                    if data:
                        status["secure_boot"] = (data[-1] == 1)
                    break
            except Exception:
                pass

    # 2. Check Kernel Lockdown status
    lockdown_path = "/sys/kernel/security/lockdown"
    if os.path.exists(lockdown_path):
        try:
            with open(lockdown_path, "r") as f:
                content = f.read().strip()
                match = re.search(r"\[(.*?)\]", content)
                if match:
                    mode = match.group(1)
                    status["lockdown_mode"] = mode
                    if mode != "none":
                        status["lockdown_active"] = True
        except Exception:
            pass

    # 3. Check if iomem=relaxed is active
    try:
        if os.path.exists("/proc/cmdline"):
            with open("/proc/cmdline", "r") as f:
                cmdline = f.read()
                status["iomem_relaxed"] = "iomem=relaxed" in cmdline
    except Exception:
        pass

    # 4. Check if ryzen_smu module is loaded (bypass driver)
    status["ryzen_smu_loaded"] = os.path.exists("/sys/module/ryzen_smu")

    return status


SETTINGS_PARAMS.append({
    "param": "set-coall",
    "label": "All Cores Offset",
    "desc": "Curve Optimizer offset applied to all CPU cores",
    "min": -30, "max": 30, "step": 1,
    "unit": "", "display_divisor": 1, "display_unit": "",
    "category": "undervolt",
    "value_key": "COALL",
    "default": 0,
    "is_cpu": True
})

SETTINGS_PARAMS.append({
    "param": "set-cogfx",
    "label": "iGPU Offset",
    "desc": "Curve Optimizer offset applied to the graphics core",
    "min": -30, "max": 30, "step": 1,
    "unit": "", "display_divisor": 1, "display_unit": "",
    "category": "undervolt",
    "value_key": "COGFX",
    "default": 0,
    "is_gpu": True
})

for i in range(_get_physical_core_count()):
    SETTINGS_PARAMS.append({
        "param": f"set-coper-{i}",
        "label": f"Core {i} Offset",
        "desc": f"Curve Optimizer offset for Core {i}",
        "min": -30, "max": 30, "step": 1,
        "unit": "", "display_divisor": 1, "display_unit": "",
        "category": "undervolt",
        "value_key": f"COPER_{i}",
        "default": 0,
        "is_cpu": True
    })


# Read-only monitoring metrics (name in -i output -> display label)
MONITOR_METRICS = [
    ("STAPM VALUE",   "STAPM Usage",    "W"),
    ("PPT VALUE FAST","PPT Fast Usage", "W"),
    ("PPT VALUE SLOW","PPT Slow Usage", "W"),
    ("PPT VALUE APU", "APU PPT Usage",  "W"),
    ("TDC VALUE VDD", "TDC VDD",        "A"),
    ("TDC VALUE SOC", "TDC SoC",        "A"),
    ("EDC VALUE VDD", "EDC VDD",        "A"),
    ("EDC VALUE SOC", "EDC SoC",        "A"),
    ("THM VALUE CORE","CPU Temp",       "°C"),
    ("STT VALUE APU", "APU Skin Temp",  "°C"),
]


def get_live_gpu_clock() -> float | None:
    """Read the live GPU core clock (in MHz) from sysfs."""
    try:
        # Search under card0 and card1 for hwmon/freq1_input
        for card in ("card0", "card1"):
            base_dir = f"/sys/class/drm/{card}/device/hwmon"
            if os.path.exists(base_dir):
                for hwmon in os.listdir(base_dir):
                    freq_path = f"{base_dir}/{hwmon}/freq1_input"
                    if os.path.exists(freq_path):
                        with open(freq_path, "r") as f:
                            hz = float(f.read().strip())
                            return hz / 1_000_000.0  # convert Hz to MHz
    except Exception:
        pass

    # Fallback to pp_dpm_sclk
    try:
        for card in ("card0", "card1"):
            path = f"/sys/class/drm/{card}/device/pp_dpm_sclk"
            if os.path.exists(path):
                with open(path, "r") as f:
                    for line in f:
                        if "*" in line:
                            # Match P-states e.g. "1: 700Mhz *" or "S: 19Mhz *"
                            match = re.search(r"(\d+)\s*[mM]hz", line)
                            if match:
                                return float(match.group(1))
    except Exception:
        pass
    return None


def get_live_cpu_clock() -> float | None:
    """Read the live average CPU core clock (in MHz) from sysfs cpufreq."""
    try:
        freqs = []
        base_dir = "/sys/devices/system/cpu"
        if os.path.exists(base_dir):
            for cpu in os.listdir(base_dir):
                if re.match(r"^cpu\d+$", cpu):
                    path = f"{base_dir}/{cpu}/cpufreq/scaling_cur_freq"
                    if os.path.exists(path):
                        with open(path, "r") as f:
                            khz = float(f.read().strip())
                            freqs.append(khz / 1000.0)  # convert kHz to MHz
        if freqs:
            return sum(freqs) / len(freqs)
    except Exception:
        pass

    # Fallback to /proc/cpuinfo
    try:
        freqs = []
        with open("/proc/cpuinfo", "r") as f:
            for line in f:
                if line.strip().startswith("cpu MHz"):
                    mhz = float(line.split(":", 1)[1].strip())
                    freqs.append(mhz)
        if freqs:
            return sum(freqs) / len(freqs)
    except Exception:
        pass
    return None


def get_current_info() -> dict:
    """Run ryzenadj -i and return a dict: display_name -> float value.

    Runs sudo -n (fast, no prompt since passwordless sudoers is configured).
    """
    metrics = {}
    try:
        res = _run_elevated(
            ["ryzenadj", "-i"],
            capture_output=True, text=True, timeout=10
        )
        if res.returncode == 0:
            metrics = _parse_info_output(res.stdout)
        else:
            log.debug("ryzenadj -i (refresh) failed: %s", res.stderr)
    except Exception as e:
        log.debug("Error running ryzenadj -i (refresh): %s", e)

    # Inject other live monitoring stats from sysfs/procfs
    gpu_clk = get_live_gpu_clock()
    if gpu_clk is not None:
        metrics["GFX FORCED CLK"] = gpu_clk
        # If the limits are not in metrics, fallback to current clock or approximate
        if "GFX CLK LIMIT (MAX)" not in metrics:
            metrics["GFX CLK LIMIT (MAX)"] = gpu_clk
        if "GFX CLK LIMIT (MIN)" not in metrics:
            metrics["GFX CLK LIMIT (MIN)"] = gpu_clk

    cpu_clk = get_live_cpu_clock()
    if cpu_clk is not None:
        metrics["CPU OC CLK"] = cpu_clk

    return metrics


def _parse_info_output(output: str) -> dict:
    """Parse the table from ryzenadj -i output."""
    metrics = {}
    # Line format: | Name | value | param |
    pattern = re.compile(
        r"\|\s*(.+?)\s*\|\s*([\d\.\-]+)\s*\|\s*(.*?)\s*\|"
    )
    for line in output.splitlines():
        m = pattern.match(line.strip())
        if m:
            name = m.group(1).strip()
            try:
                value = float(m.group(2).strip())
            except ValueError:
                continue
            metrics[name] = value
    return metrics


def get_cpu_family() -> str:
    """Return the CPU family string from ryzenadj -i (sudo -n only, no polkit)."""
    try:
        res = _run_elevated(
            ["ryzenadj", "-i"],
            capture_output=True, text=True, timeout=10
        )
        for line in res.stdout.splitlines():
            if line.startswith("CPU Family:"):
                return line.split(":", 1)[1].strip()
    except Exception:
        pass
    return "Unknown"


def get_supported_parameters() -> set[str]:
    """Parse the supported CLI parameter names from ryzenadj -i (sudo -n only, no polkit)."""
    supported = set()
    try:
        res = _run_elevated(
            ["ryzenadj", "-i"],
            capture_output=True, text=True, timeout=10
        )
        if res.returncode == 0:
            pattern = re.compile(
                r"\|\s*(.+?)\s*\|\s*([\d\.\-]+)\s*\|\s*(.*?)\s*\|"
            )
            for line in res.stdout.splitlines():
                m = pattern.match(line.strip())
                if m:
                    param = m.group(3).strip()
                    if param:
                        for p in re.split(r"\s*/\s*|\s+", param):
                            supported.add(p)
    except Exception as e:
        log.error("Error getting supported parameters: %s", e)
    return supported


def get_initial_data() -> tuple[str, dict, set, bool]:
    """Run ryzenadj -i once and return (cpu_family, info_dict, supported_params, auth_ok).

    Runs sudo -n. Requires passwordless sudo rules to be set up.
    """
    try:
        res = _run_elevated(["ryzenadj", "-i"], capture_output=True, text=True, timeout=15)
        auth_ok = (res.returncode == 0)
        if not auth_ok:
            log.error("Authentication failed: ryzenadj requires root access.")
            return "Unknown", {}, set(), False

        # Parse CPU family from the header line
        cpu_family = "Unknown"
        for line in res.stdout.splitlines():
            if line.startswith("CPU Family:"):
                cpu_family = line.split(":", 1)[1].strip()
                break

        # Parse live metric values
        info_dict = _parse_info_output(res.stdout)

        # Parse supported settable parameter names from the 3rd column
        supported: set[str] = set()
        pattern = re.compile(
            r"\|\s*(.+?)\s*\|\s*([\d\.\-]+)\s*\|\s*(.*?)\s*\|"
        )
        for line in res.stdout.splitlines():
            m = pattern.match(line.strip())
            if m:
                param = m.group(3).strip()
                if param:
                    for p in re.split(r"\s*/\s*|\s+", param):
                        supported.add(p)

        return cpu_family, info_dict, supported, True
    except Exception as e:
        log.error("Error getting initial data: %s", e)
        return "Unknown", {}, set(), False


def is_parameter_supported(param: str, cpu_family: str, supported_params: set[str]) -> bool:
    """Determine if a parameter is supported on the current CPU.

    Consolidates ryzenadj reported capabilities with dynamic fallbacks/safeguards
    for APU/mobile graphics clocks and locked CPU overclocking parameters.
    """
    # Curve optimizer parameters are always supported in ryzenadj if supported_params is not empty,
    # as ryzenadj supports them on all Zen 3 and newer platforms, but they aren't always in the info table.
    if param.startswith("set-co"):
        return True

    # If ryzenadj's parsed supported set explicitly has it, it is supported.
    if supported_params and param in supported_params:
        return True

    # Safeguards for CPU Overclocking parameters (oc-clk, oc-volt)
    # They should only be enabled on unlocked HX / HK desktop-derived mobile processors,
    # but NOT on standard U/HS APUs or the monolithic Ryzen AI series (e.g. AI HX 370).
    if param in ("oc-clk", "oc-volt"):
        fam_lower = cpu_family.lower()
        is_unlocked_hx = False
        try:
            with open("/proc/cpuinfo", "r") as f:
                for line in f:
                    if line.strip().startswith("model name"):
                        model_name = line.split(":", 1)[1].strip().lower()
                        # Must contain "hx" or "hk" but NOT "ai hx" or "ai 9 hx" (Ryzen AI HX monolithic)
                        if ("hx" in model_name or "hk" in model_name) and "ai " not in model_name:
                            is_unlocked_hx = True
                            break
        except Exception:
            pass
        return is_unlocked_hx

    # Smart fallbacks for GFX/iGPU clock forcing (gfx-clk) which is write-only or not in ryzenadj info table.
    if param == "gfx-clk":
        # 1. Check if any other iGPU indicators exist in supported_params
        igpu_indicators = {"gfx-clk", "gfx-clock", "max-gfxclk", "min-gfxclk", "vrmgfx-current", "vrmgfxmax-current"}
        if supported_params and any(ind in supported_params for ind in igpu_indicators):
            return True

        # 2. Check CPU family or CPU model string from ryzenadj
        fam_lower = cpu_family.lower()
        apu_families = {
            "strix", "phoenix", "hawk", "rembrandt", "barcelo", "cezanne", 
            "lucienne", "renoir", "picasso", "raven", "mendocino", "sabin", 
            "kraken", "krackan", "sonoma", "dragon", "fire", "dali", "pollock", 
            "vangogh", "aerith", "sephiroth"
        }
        if any(fam in fam_lower for fam in apu_families):
            return True
            
        # 3. Check /proc/cpuinfo for mobile CPU suffixes or Ryzen AI processors
        try:
            with open("/proc/cpuinfo", "r") as f:
                for line in f:
                    if line.strip().startswith("model name"):
                        model_name = line.split(":", 1)[1].strip().lower()
                        if "ryzen" in model_name:
                            if (
                                " ai " in model_name or 
                                " z1 " in model_name or 
                                " z1 extreme" in model_name or
                                any(suffix in model_name for suffix in ["370", "365", "375"])
                            ):
                                return True
                            import re
                            if re.search(r"\b\d{3,4}(u|h|hs|hx|g|ge)\b", model_name):
                                return True
        except Exception:
            pass

    return False





def _build_ryzenadj_args(settings: dict) -> list[str]:
    """Build the command-line arguments for ryzenadj based on settings dict with CO support.

    Curve Optimizer values are clamped to [-30, +30] before encoding to prevent
    out-of-range values (e.g. from a corrupt settings file) reaching hardware.
    """
    args = []
    # Automatically prepend --enable-oc if manual CPU overclocking is requested
    enable_oc = False
    for param in settings:
        if param in ("oc-clk", "oc-volt"):
            enable_oc = True
            break
    if enable_oc:
        args.append("--enable-oc")

    for param, value in settings.items():
        val_int = int(value)
        if param == "set-coall":
            val_int = max(-30, min(30, val_int))  # clamp to valid CO range
            encoded = (0x100000 - abs(val_int)) if val_int < 0 else val_int
            args.append(f"--set-coall={encoded}")
        elif param == "set-cogfx":
            val_int = max(-30, min(30, val_int))  # clamp to valid CO range
            encoded = (0x100000 - abs(val_int)) if val_int < 0 else val_int
            args.append(f"--set-cogfx={encoded}")
        elif param.startswith("set-coper-"):
            core_idx = int(param.split("-")[-1])
            val_int = max(-30, min(30, val_int))  # clamp to valid CO range
            if val_int < 0:
                encoded = (core_idx << 20) | (0x10000 - abs(val_int))
            else:
                encoded = (core_idx << 20) | val_int
            args.append(f"--set-coper={encoded}")
        elif param == "oc-volt":
            # Convert millivolts (e.g. 1200) to forced core VID:
            # (1.55 - [voltage in V]) / 0.00625
            volts = val_int / 1000.0
            vid = max(0, min(127, int((1.55 - volts) / 0.00625)))
            args.append(f"--oc-volt={vid}")
        else:
            args.append(f"--{param}={val_int}")
    return args


def apply_settings(settings: dict, supported_params: set[str] = None, cpu_family: str = None) -> tuple[bool, str]:
    """
    Apply settings via ryzenadj. settings is {param: value_in_native_unit}.
    Returns (success, message).

    Unknown or unsupported parameter names are filtered out before any hardware write is attempted.
    """
    if not settings:
        return False, "No settings to apply."

    # Validate: only allow params declared in SETTINGS_PARAMS
    valid_param_names = {m["param"] for m in SETTINGS_PARAMS}
    unknown = [p for p in settings if p not in valid_param_names]
    if unknown:
        log.warning("apply_settings: ignoring unknown/unexpected params: %s", unknown)
        settings = {k: v for k, v in settings.items() if k in valid_param_names}

    if supported_params is None:
        supported_params = get_supported_parameters()

    if cpu_family is None:
        cpu_family = get_cpu_family()

    # Filter by what the CPU actually supports using unified capability checks
    unsupported = [p for p in settings if not is_parameter_supported(p, cpu_family, supported_params)]
    if unsupported:
        log.info("apply_settings: filtering out unsupported params: %s", unsupported)
        settings = {k: v for k, v in settings.items() if is_parameter_supported(k, cpu_family, supported_params)}

    if not settings:
        return False, "No valid settings to apply after filtering unsupported params."

    cmd = ["ryzenadj"] + _build_ryzenadj_args(settings)
    print(f"\n[Ryzenadj-gtk] Executing hardware write command:\n  {' '.join(cmd)}\n", flush=True)
    try:
        res = _run_elevated(cmd, capture_output=True, text=True, timeout=15)
        if res.returncode != 0:
            err = (res.stderr or "") + "\n" + (res.stdout or "")
            # Strip out "detected compatible ryzen_smu kernel module" and debugging logs to avoid toast clutter
            lines = [l for l in err.splitlines() if "ryzen_smu" not in l and "Ryzen SMU" not in l and "Executing" not in l and "PrepareForSleep" not in l]
            cleaned_err = "\n".join(lines).strip()
            return False, cleaned_err or "ryzenadj returned error"
            
        # Merge into existing saved settings instead of overwriting entirely
        current_saved = load_settings()
        current_saved.update(settings)
        save_settings(current_saved)
        
        if is_service_enabled():
            sync_system_settings(current_saved)
        return True, "Settings applied successfully."
    except Exception as e:
        return False, str(e)


def apply_preset(preset_name: str) -> tuple[bool, str]:
    """Apply a built-in ryzenadj preset."""
    if preset_name == "power-saving":
        cmd = ["ryzenadj", "--power-saving"]
    elif preset_name == "max-performance":
        cmd = ["ryzenadj", "--max-performance"]
    else:
        return False, f"Unknown preset: {preset_name}"
    print(f"\n[Ryzenadj-gtk] Executing preset command:\n  {' '.join(cmd)}\n", flush=True)
    try:
        res = _run_elevated(cmd, capture_output=True, text=True, timeout=15)
        if res.returncode != 0:
            err = res.stderr or ""
            # Strip out "detected compatible ryzen_smu kernel module" warnings to avoid toast clutter
            lines = [l for l in err.splitlines() if "ryzen_smu" not in l and "Ryzen SMU" not in l]
            cleaned_err = "\n".join(lines).strip()
            return False, cleaned_err or "ryzenadj returned error"
        return True, f"Preset '{preset_name}' applied."
    except Exception as e:
        return False, str(e)


def load_settings() -> dict:
    """Load saved settings from config file."""
    if os.path.exists(CONFIG_FILE):
        try:
            with open(CONFIG_FILE, "r") as f:
                return json.load(f)
        except Exception as e:
            log.error("Failed to load settings: %s", e)
    return {}


def save_settings(settings: dict) -> None:
    """Persist settings to config file."""
    os.makedirs(os.path.dirname(CONFIG_FILE), exist_ok=True)
    try:
        with open(CONFIG_FILE, "w") as f:
            json.dump(settings, f, indent=2)
    except Exception as e:
        log.error("Failed to save settings: %s", e)


def is_service_enabled() -> bool:
    """Check if the systemd boot service is enabled."""
    try:
        res = subprocess.run(
            ["systemctl", "is-enabled", "ryzenadj-gtk-apply.service"],
            capture_output=True, text=True
        )
        return res.stdout.strip() == "enabled"
    except Exception:
        return False


def set_service_enabled(enabled: bool) -> tuple[bool, str]:
    """Enable or disable the systemd boot service."""
    # Check if the service file actually exists on the system
    if not os.path.exists("/usr/lib/systemd/system/ryzenadj-gtk-apply.service") and \
       not os.path.exists("/etc/systemd/system/ryzenadj-gtk-apply.service"):
        return False, "Startup service is not installed. Please install the application first (via makepkg -si, sudo ./install.sh, etc.)."

    action = "enable" if enabled else "disable"
    try:
        # Enable/disable systemd service
        cmd = ["systemctl", action, "--now", "ryzenadj-gtk-apply.service"]
        print(f"\n[Ryzenadj-gtk] Executing service command:\n  {' '.join(cmd)}\n", flush=True)
        res = _run_elevated(
            cmd,
            capture_output=True, text=True, timeout=10
        )
        if res.returncode != 0:
            return False, res.stderr.strip() or f"Failed to {action} service"
            
        if enabled:
            # Sync settings to /etc
            settings = load_settings()
            if settings:
                sync_system_settings(settings)
        else:
            # Remove /etc settings
            _run_elevated(["rm", "-f", SYSTEM_CONFIG_FILE])
            
        return True, f"Startup service {'enabled' if enabled else 'disabled'} successfully."
    except Exception as e:
        return False, str(e)


def sync_system_settings(settings: dict) -> bool:
    """Write settings directly to the system config file (needs write permission on directory)."""
    try:
        os.makedirs(SYSTEM_CONFIG_DIR, exist_ok=True)
        with open(SYSTEM_CONFIG_FILE, "w") as f:
            json.dump(settings, f, indent=2)
        return True
    except Exception as e:
        log.error("Failed to sync system settings: %s", e)
        return False


def factory_reset() -> tuple[bool, str]:
    """Wipe all saved settings and disable the startup service."""
    try:
        # 1. Delete user config
        if os.path.exists(CONFIG_FILE):
            os.remove(CONFIG_FILE)
        
        # 2. Disable service and delete system config
        set_service_enabled(False)
        
        return True, "All settings cleared and startup service disabled."
    except Exception as e:
        log.error("Factory reset failed: %s", e)
        return False, str(e)

def load_profiles() -> dict:
    """Load custom profiles from JSON file."""
    if os.path.exists(PROFILES_FILE):
        try:
            with open(PROFILES_FILE, "r") as f:
                return json.load(f)
        except Exception as e:
            log.error("Failed to load profiles: %s", e)
    return {}


def save_profiles(profiles: dict) -> None:
    """Save custom profiles to JSON file."""
    os.makedirs(os.path.dirname(PROFILES_FILE), exist_ok=True)
    try:
        with open(PROFILES_FILE, "w") as f:
            json.dump(profiles, f, indent=2)
    except Exception as e:
        log.error("Failed to save profiles: %s", e)


if __name__ == "__main__":
    import sys
    if len(sys.argv) > 1 and sys.argv[1] == "--apply-saved":
        if os.path.exists(SYSTEM_CONFIG_FILE):
            try:
                with open(SYSTEM_CONFIG_FILE, "r") as f:
                    settings = json.load(f)
                if settings:
                    import shutil
                    ryzenadj_path = shutil.which("ryzenadj") or "/usr/bin/ryzenadj"
                    # Apply directly (since this runs as root in systemd, no sudo needed)
                    cmd = [ryzenadj_path] + _build_ryzenadj_args(settings)
                    
                    # Robust retry loop for boot persistence (handles slow driver loading at startup)
                    max_retries = 5
                    for attempt in range(1, max_retries + 1):
                        res = subprocess.run(cmd, capture_output=True, text=True, timeout=15)
                        if res.returncode == 0:
                            print(f"Successfully applied ryzenadj settings from system config (attempt {attempt}).")
                            sys.exit(0)
                        else:
                            print(f"Attempt {attempt} failed: {res.stderr.strip()}")
                            if attempt < max_retries:
                                import time
                                time.sleep(3)
                            else:
                                print("All boot apply attempts failed.")
                                sys.exit(res.returncode)
            except Exception as e:
                print(f"Failed to apply system settings: {e}")
                sys.exit(1)
        else:
            print("No system settings file found at " + SYSTEM_CONFIG_FILE)
            sys.exit(0)
