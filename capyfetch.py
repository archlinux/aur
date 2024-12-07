#!/usr/bin/env python
import os
import platform
import psutil
import time
from datetime import timedelta
from colorama import Fore, Style
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
        "os": distro.name(),  # Получаем название дистрибутива
        "kernel": uname.release,
        "shell": os.environ.get("SHELL", "Unknown"),
        "uptime": uptime,
        "memory": f"{memory.used // (1024 ** 2)}MB / {memory.total // (1024 ** 2)}MB",
    }

def print_info():
    system_info = get_system_info()
    
    username = os.getlogin()
    pcname = platform.node() 
    
    print(Fore.YELLOW + f"    ⠀⠀⢀⣀⠤⠿⢤⢖⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀      {username}@{pcname}")
    print(Fore.YELLOW + "    ⡔⢩⠂⠀⠒⠗⠈⠀⠉⠢⠄⣀⠠⠤⠄⠒⢖⡒⢒⠂⠤⢄⠀⠀⠀⠀      ━━━━━━━━━━━━━━━━")
    print(Fore.YELLOW + "    ⠇⠤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠈⠀⠈⠈⡨⢀⠡⡪⠢⡀⠀      ▪ " + Fore.WHITE + "os      " + system_info["os"])
    print(Fore.YELLOW + "    ⠈⠒⠀⠤⠤⣄⡆⡂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠢⠀⢕⠱⠀      ▪ " + Fore.WHITE + "kernel  " + system_info["kernel"])
    print(Fore.YELLOW + "    ⠀⠀⠀⠀⠀⠈⢳⣐⡐⠐⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠁⠇      ▪ " + Fore.WHITE + "shell   " + system_info["shell"])
    print(Fore.YELLOW + "    ⠀⠀⠀⠀⠀⠀⠀⠑⢤⢁⠀⠆⠀⠀⠀⠀⠀⢀⢰⠀⠀⠀⡀⢄⡜⠀      ▪ " + Fore.WHITE + "uptime  " + system_info["uptime"])
    print(Fore.YELLOW + "    ⠀⠀⠀⠀⠀⠀⠀⠀⠘⡦⠄⡷⠢⠤⠤⠤⠤⢬⢈⡇⢠⣈⣰⠎⠀⠀      ▪ " + Fore.WHITE + "memory  " + system_info["memory"])
    print(Fore.YELLOW + "    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⣃⢸⡇⠀⠀⠀⠀⠀⠈⢪⢀⣺⡅⢈⠆⠀⠀")
    print(Fore.YELLOW + "    ⠀⠀⠀⠀⠀⠀⠀⠶⡿⠤⠚⠁⠀⠀⠀⢀⣠⡤⢺⣥⠟⢡⠃⠀⠀⠀") 
    print(Fore.YELLOW + "    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀")
    print(Style.RESET_ALL)

if __name__ == "__main__":
    print_info()

