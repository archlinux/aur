#!/usr/bin/env python3

import platform
import os
import shutil
import subprocess

def colorize(text, color_code):
    return f"\033[{color_code}m{text}\033[0m"

def get_ascii_art():
    python_art = [
        "⠀⠀⠀⠀⠀⠀⠀⣠⣤⣤⣤⣤⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⢰⡿⠋⠁⠀⠀⠈⠉⠙⠻⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⢀⣿⠇⠀⢀⣴⣶⡾⠿⠿⠿⢿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⣀⣀⣸⡿⠀⠀⢸⣿⣇⠀⠀⠀⠀⠀⠀⠙⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⣾⡟⠛⣿⡇⠀⠀⢸⣿⣿⣷⣤⣤⣤⣤⣶⣶⣿⠇⠀⠀⠀⠀⠀⠀⠀⣀⠀⠀",
        "⢀⣿⠀⢀⣿⡇⠀⠀⠀⠻⢿⣿⣿⣿⣿⣿⠿⣿⡏⠀⠀⠀⠀⢴⣶⣶⣿⣿⣿⣆",
        "⢸⣿⠀⢸⣿⡇⠀⠀⠀⠀⠀⠈⠉⠁⠀⠀⠀⣿⡇⣀⣠⣴⣾⣮⣝⠿⠿⠿⣻⡟",
        "⢸⣿⠀⠘⣿⡇⠀⠀⠀⠀⠀⠀⠀⣠⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠉⠀",
        "⠸⣿⠀⠀⣿⡇⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠉⠀⠀⠀⠀",
        "⠀⠻⣷⣶⣿⣇⠀⠀⠀⢠⣼⣿⣿⣿⣿⣿⣿⣿⣛⣛⣻⠉⠁⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⢸⣿⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⢸⣿⣀⣀⣀⣼⡿⢿⣿⣿⣿⣿⣿⡿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠙⠛⠛⠛⠋⠁⠀⠙⠻⠿⠟⠋⠑⠛⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    ]
    return [colorize(line, 31) for line in python_art]

def is_android():
    return os.path.exists('/system/build.prop') or 'ANDROID_ROOT' in os.environ

def get_host():
    try:
        if is_android():
            model = subprocess.getoutput('getprop ro.product.model')
            if model.strip(): return model
            with open('/proc/device-tree/model', 'r') as f:
                return f.read().strip('\x00').strip()
        elif platform.system() == "Linux":
            with open("/sys/devices/virtual/dmi/id/product_name", "r") as f:
                return f.read().strip()
        elif platform.system() == "Darwin":
            return subprocess.getoutput("sysctl -n hw.model").strip()
        elif platform.system() == "Windows":
            return subprocess.getoutput("wmic computersystem get model").split()[-2]
    except:
        return "Unknown"

def get_os():
    if is_android():
        version = subprocess.getoutput('getprop ro.build.version.release')
        sdk = subprocess.getoutput('getprop ro.build.version.sdk')
        return f"Android {version} (SDK {sdk})"
    return f"{platform.system()} {platform.release()}"

def get_cpu():
    try:
        if is_android():
            return subprocess.getoutput('getprop ro.hardware').strip()
        elif platform.system() == "Linux":
            with open("/proc/cpuinfo", "r") as f:
                for line in f:
                    if "model name" in line:
                        return line.split(":")[1].strip()
        elif platform.system() == "Darwin":
            return subprocess.getoutput("sysctl -n machdep.cpu.brand_string")
        elif platform.system() == "Windows":
            return subprocess.getoutput("wmic cpu get name").split("\n")[1].strip()
        return platform.processor()
    except:
        return "Unknown"

def get_ram():
    try:
        if platform.system() in ["Linux", "Android"]:
            with open("/proc/meminfo", "r") as f:
                mem = f.read()
                total = int(next(line for line in mem.split('\n') if "MemTotal" in line).split()[1])
                available = int(next(line for line in mem.split('\n') if "MemAvailable" in line).split()[1])
                used = total - available
                used_percent = (used / total) * 100
                total_gb = total // 1048576
                used_gb = used // 1048576
        elif platform.system() == "Darwin":
            total = int(subprocess.getoutput("sysctl -n hw.memsize"))
            stats = subprocess.getoutput("vm_stat").split()
            free = int(stats[stats.index("free:")+1].strip('.')) * 4096
            used = total - free
            used_percent = (used / total) * 100
            total_gb = total // (1024**3)
            used_gb = used // (1024**3)
        elif platform.system() == "Windows":
            total = int(subprocess.getoutput("wmic ComputerSystem get TotalPhysicalMemory").split()[1])
            free = int(subprocess.getoutput("wmic OS get FreePhysicalMemory").split()[1]) * 1024
            used = total - free
            used_percent = (used / total) * 100
            total_gb = total // (1024**3)
            used_gb = used // (1024**3)
        else:
            return "N/A"
        
        used_percent = round(used_percent)
        color = 32 if used_percent <= 49 else 33 if 50 <= used_percent <= 89 else 31
        return f"{used_gb} GB / {total_gb} GB ({colorize(f'{used_percent}%', color)})"
    except:
        return "N/A"

def get_swap():
    try:
        if platform.system() in ["Linux", "Android"]:
            with open("/proc/meminfo", "r") as f:
                mem = f.read()
                swap_total = int(next(line for line in mem.split('\n') if "SwapTotal" in line).split()[1])
                swap_free = int(next(line for line in mem.split('\n') if "SwapFree" in line).split()[1])
                swap_used = swap_total - swap_free
                swap_percent = (swap_used / swap_total) * 100 if swap_total > 0 else 0
                swap_total_gb = swap_total // 1048576
                swap_used_gb = swap_used // 1048576
        elif platform.system() == "Darwin":
            swap_info = subprocess.getoutput("sysctl vm.swapusage").split()
            total = float(swap_info[2].replace('M', '')) * 1024**2
            used = float(swap_info[5].replace('M', '')) * 1024**2
            swap_percent = (used / total) * 100 if total > 0 else 0
            swap_total_gb = int(total // 1024**3)
            swap_used_gb = int(used // 1024**3)
        elif platform.system() == "Windows":
            total = int(subprocess.getoutput("wmic pagefile get CurrentUsage").split()[1])
            used = int(subprocess.getoutput("wmic pagefile get AllocatedBaseSize").split()[1])
            swap_percent = (used / total) * 100 if total > 0 else 0
            swap_total_gb = total // (1024**3)
            swap_used_gb = used // (1024**3)
        else:
            return "N/A"
        
        swap_percent = round(swap_percent)
        color = 32 if swap_percent <= 49 else 33 if 50 <= swap_percent <= 89 else 31
        return f"{swap_used_gb} GB / {swap_total_gb} GB ({colorize(f'{swap_percent}%', color)})"
    except:
        return "N/A"

def get_disk():
    try:
        if is_android():
            path = os.getenv('EXTERNAL_STORAGE', '/storage/emulated/0')
        else:
            path = "/"
        usage = shutil.disk_usage(path)
        used_percent = (usage.used / usage.total) * 100
        used_gb = usage.used // (1024**3)
        total_gb = usage.total // (1024**3)
        used_percent = round(used_percent)
        color = 32 if used_percent <= 49 else 33 if 50 <= used_percent <= 89 else 31
        return f"{used_gb} GB / {total_gb} GB ({colorize(f'{used_percent}%', color)})"
    except:
        return "N/A"

def get_shell():
    if is_android():
        return os.getenv('SHELL', 'sh').split('/')[-1]
    return os.path.basename(os.getenv("SHELL", "Unknown"))

def main():
    ascii_art = get_ascii_art()
    sys_info = [
        f"{colorize('Host:', 31)} {get_host()}",
        f"{colorize('OS:', 31)} {get_os()}",
        f"{colorize('CPU:', 31)} {get_cpu()}",
        f"{colorize('RAM:', 31)} {get_ram()}",
        f"{colorize('Swap:', 31)} {get_swap()}",
        f"{colorize('Disk:', 31)} {get_disk()}",
        f"{colorize('Shell:', 31)} {get_shell()}"
    ]
    
    for i in range(max(len(ascii_art), len(sys_info))):
        left = ascii_art[i] if i < len(ascii_art) else ""
        right = sys_info[i] if i < len(sys_info) else ""
        print(f"{left}  {right}")

if __name__ == "__main__":
    main()
