import os
import platform
import psutil
import time
import requests
import sys
from colorama import Fore
import distro

def get_system_info():
    uname = platform.uname()

    boot_time = psutil.boot_time()
    current_time = time.time()

    uptime_seconds = current_time - boot_time
    uptime_hrs = int(uptime_seconds // 3600)
    uptime_min = int((uptime_seconds % 3600) // 60)

    uptime = f"{uptime_hrs} hours, {uptime_min} mins"

    memory = psutil.virtual_memory()

    return {
        "os": distro.name(pretty=True),
        "kernel": uname.release,
        "shell": os.environ.get("SHELL", "Unknown"),
        "uptime": uptime,
        "memory": f"{memory.used // (1024 ** 2)}MB / {memory.total // (1024 ** 2)}MB",
    }

def get_artwork(art_name):
    url = f'http://p.senyaaa.ru/anyfetch/artworks/{art_name}.txt'
    try:
        response = requests.get(url)
        response.raise_for_status()
        response.encoding = 'utf-8'
        return response.text.splitlines()
    except requests.exceptions.RequestException as e:
        print(Fore.RED + f"Ошибка при загрузке арта: {e}")
        return []

def print_info():
    system_info = get_system_info()

    username = os.environ.get('USER', 'unknown')
    pcname = platform.node()

    if len(sys.argv) > 1:
        art_name = sys.argv[1]
    else:
        art_name = 'default'

    artwork = get_artwork(art_name)

    additional_text = [
        Fore.BLUE + f"{username}@{pcname}",
        Fore.BLUE + "━━━━━━━━━━━━━━━━",
        Fore.BLUE + f"▪ os      {system_info['os']}",
        Fore.BLUE + f"▪ kernel  {system_info['kernel']}",
        Fore.BLUE + f"▪ shell   {system_info['shell']}",
        Fore.BLUE + f"▪ uptime  {system_info['uptime']}",
        Fore.BLUE + f"▪ memory  {system_info['memory']}",
    ]

    max_length_content = max((len(line) for line in artwork), default=0)

    for i in range(max(len(artwork), len(additional_text))):
        artwork_line = artwork[i] if i < len(artwork) else ""
        add_line = additional_text[i] if i < len(additional_text) else ""
        print(Fore.WHITE + "   " + artwork_line.ljust(max_length_content) + "    " + add_line)

if __name__ == "__main__":
    print_info()

