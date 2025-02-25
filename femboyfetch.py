#!/usr/bin/env python3
import os
import platform
import socket
import subprocess
import psutil
import shutil

# Получение имени пользователя и хоста
user = os.getenv("USER") or os.getenv("USERNAME")
host = socket.gethostname()

# Операционная система
os_info = platform.system() + " " + platform.release()

# Аптайм
uptime = subprocess.getoutput("uptime -p")

# Ядро
kernel = platform.release()

# Количество установленных пакетов (для разных дистрибутивов)
if shutil.which("pacman"):
    packages = subprocess.getoutput("pacman -Q | wc -l")
elif shutil.which("dpkg"):
    packages = subprocess.getoutput("dpkg --list | wc -l")
elif shutil.which("rpm"):
    packages = subprocess.getoutput("rpm -qa | wc -l")
else:
    packages = "Неизвестно"

# Используемый шелл
shell = os.getenv("SHELL") or "Неизвестно"

# Разрешение экрана без дубликатов
try:
    resolutions = subprocess.getoutput("xrandr | grep '*' | awk '{print $1}' | sort | uniq")
except:
    resolutions = "Неизвестно"

# Оперативная память
mem = psutil.virtual_memory()
mem_info = f"{round((mem.total - mem.available) / (1024 ** 2))}MiB / {round(mem.total / (1024 ** 2))}MiB"

# Процессор через /proc/cpuinfo
try:
    with open("/proc/cpuinfo", "r") as f:
        cpu_info = [line.strip() for line in f if "model name" in line]
        cpu = cpu_info[0].split(":")[1].strip() if cpu_info else "Неизвестно"
except:
    cpu = "Неизвестно"

# Видеокарта
try:
    gpu = subprocess.getoutput("lspci | grep VGA | cut -d ':' -f3").strip()
except:
    gpu = "Неизвестно"

# Вывод информации
info = f"""
{user}@{host}
------------------------------
OS: {os_info}
Uptime: {uptime}
Kernel: {kernel}
Packages: {packages}
Shell: {shell}
Resolution: {resolutions}
Memory: {mem_info}
CPU: {cpu}
GPU: {gpu}
"""

print(info)

