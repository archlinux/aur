#!/usr/bin/env python3
import os
import shutil
import platform
import socket
import subprocess
import psutil

# Получаем ширину терминала
term_width = shutil.get_terminal_size().columns

# ANSI-коды для цветов
RESET = "\033[0m"
BOLD = "\033[1m"
BLUE = "\033[1;34m"
CYAN = "\033[1;36m"
GREEN = "\033[1;32m"
YELLOW = "\033[1;33m"
RED = "\033[1;31m"
MAGENTA = "\033[1;35m"

# Получаем путь к папке со скриптом
script_dir = os.path.dirname(os.path.abspath(__file__))
logo_path = os.path.join(script_dir, "logo.txt")

# Читаем ASCII-арт
if os.path.exists(logo_path):
    with open(logo_path, "r") as f:
        logo_lines = [BOLD + line.rstrip() + RESET for line in f.readlines()]
else:
    logo_lines = []

# Вычисляем максимальную ширину ASCII-арта
logo_width = max(len(line) for line in logo_lines) if logo_lines else 0

# Минимальная ширина для отображения ASCII-арта
MIN_WIDTH_FOR_LOGO = 20  # Можно настроить

# Получение системной информации
user = os.getenv("USER") or os.getenv("USERNAME")
host = socket.gethostname()
os_info = platform.system() + " " + platform.release()
uptime = subprocess.getoutput("uptime -p")
kernel = platform.release()
arch = platform.machine()
python_ver = platform.python_version()

gpu_driver = subprocess.getoutput("lspci -k | grep -A 2 VGA | grep 'Kernel driver' | cut -d ':' -f2").strip()
if not gpu_driver:
    gpu_driver = "Неизвестно"

if shutil.which("pacman"):
    packages = subprocess.getoutput("pacman -Q | wc -l")
elif shutil.which("dpkg"):
    packages = subprocess.getoutput("dpkg --list | wc -l")
elif shutil.which("rpm"):
    packages = subprocess.getoutput("rpm -qa | wc -l")
else:
    packages = "Неизвестно"

shell = os.getenv("SHELL") or "Неизвестно"

try:
    resolutions = ", ".join(subprocess.getoutput("xrandr | grep '*' | awk '{print $1}' | sort -u").split("\n"))
except:
    resolutions = "Неизвестно"

mem = psutil.virtual_memory()
mem_info = f"{round((mem.total - mem.available) / (1024 ** 2))}MiB / {round(mem.total / (1024 ** 2))}MiB"

try:
    with open("/proc/cpuinfo", "r") as f:
        cpu_info = [line.strip() for line in f if "model name" in line]
        cpu = " ".join(cpu_info[0].split()[2:]) if cpu_info else "Неизвестно"
    cpu_threads = os.cpu_count()
except:
    cpu = "Неизвестно"
    cpu_threads = "Неизвестно"

try:
    gpu = subprocess.getoutput("lspci | grep VGA | cut -d ':' -f3").strip()
except:
    gpu = "Неизвестно"

# Палитра цветов терминала
colors = ["\033[97m●", "\033[93m●", "\033[91m●", "\033[92m●", "\033[94m●", "\033[95m●", "\033[90m●"]
colors.reverse()  # Разворачиваем список

color_row = " ".join(colors)

# Список информации
system_info = [
    " ",
    " ",
    f"{BOLD}{user}@{host}{RESET}",
    f"------------------------------",
    f"{BLUE}OS:{RESET} {os_info}",
    f"{CYAN}Uptime:{RESET} {uptime}",
    f"{GREEN}Kernel:{RESET} {kernel}",
    f"{YELLOW}Architecture:{RESET} {arch}",
    f"{MAGENTA}Python:{RESET} {python_ver}",
    f"{RED}Packages:{RESET} {packages}",
    f"{CYAN}Shell:{RESET} {shell}",
    f"{GREEN}Resolution:{RESET} {resolutions}",
    f"{YELLOW}Memory:{RESET} {mem_info}",
    f"{MAGENTA}CPU:{RESET} {cpu} ({cpu_threads} Threads)",
    f"{RED}GPU:{RESET} {gpu}",
    f"{BLUE}GPU Driver:{RESET} {gpu_driver}",
    " ",
    f"{color_row}",
    " "
]

# Выравнивание
max_info_width = max(len(line) for line in system_info)
padding = " " * 2

# Вывод с ASCII-артом
if term_width >= MIN_WIDTH_FOR_LOGO + max_info_width + len(padding):
    for i in range(max(len(logo_lines), len(system_info))):
        logo_part = logo_lines[i] if i < len(logo_lines) else " " * logo_width
        info_part = system_info[i] if i < len(system_info) else ""
        print(logo_part + padding + info_part)
else:
    for line in system_info:
        print(line)

