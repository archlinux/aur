import os
import platform
import psutil

# American 256-color ANSI codes (Catppuccin Mocha theme setup)
BLUE = "\033[38;5;111m"
CYAN = "\033[38;5;117m"
WHITE = "\033[38;5;255m"
RESET = "\033[0m"

# 1. Collect real operating system data
user = os.getlogin()
host = platform.node()
os_name = "Arch Linux x86_64"
kernel = platform.release()
shell = os.environ.get("SHELL", "").split("/")[-1]

# Calculate real RAM info using psutil library
ram = psutil.virtual_memory()
ram_used = round(ram.used / (1024**3), 2)
ram_total = round(ram.total / (1024**3), 2)

# 2. Arch Linux ASCII Logo (Line by line string array)
logo = [
    r"       /\       ",
    r"      /  \      ",
    r"     /\   \     ",
    r"    /      \    ",
    r"   /   _    \   ",
    r"  /   _     _\  ",
    r" /_  /  _  /  \_",
    r"/_ _/  /_ _/  /_"
]

# 3. System Info array matching your custom Catppuccin specs
info = [
    f"{BLUE}{user}{WHITE}@{CYAN}{host}{RESET}",
    f"{WHITE}-------------------------{RESET}",
    f"{BLUE}OS:{RESET} {os_name}",
    f"{BLUE}Kernel:{RESET} {kernel}",
    f"{BLUE}Shell:{RESET} {shell}",
    f"{BLUE}Memory:{RESET} {ram_used} GiB / {ram_total} GiB"
]

# 4. Print Logic (Merges Logo and Info perfectly side-by-side)
def display_fetch():
    print()  # Top margin padding
    max_lines = max(len(logo), len(info))
    
    for i in range(max_lines):
        line_logo = logo[i] if i < len(logo) else " " * 16
        line_info = info[i] if i < len(info) else ""
        # Forces Kitty to render the entire logo in solid Cyan and stitches info right next to it
        print(f"{CYAN}{line_logo}{RESET}   {line_info}")
    print()  # Bottom margin padding

if __name__ == "__main__":
    display_fetch()

