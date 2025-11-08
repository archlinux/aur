#!/usr/bin/env python3
import os
import sys

# Colors
RED = "\033[1;31m"
CYAN = "\033[36m"
PURPLE = "\033[35m"
BOLD = "\033[1m"
RESET = "\033[0m"

# Units
UNITS = ["B", "KiB", "MiB", "GiB", "TiB"]

SPACE = "       "

# Convert bytes to chosen or best unit (binary base)
def convert(size_bytes, forced_unit=None):
    if forced_unit:
        idx = UNITS.index(forced_unit)
        return size_bytes / (1024 ** idx), forced_unit
    v = float(size_bytes)
    idx = 0
    while v >= 1024 and idx < len(UNITS) - 1:
        v /= 1024
        idx += 1
    return v, UNITS[idx]

# Accurate size on disk (clusters * 4096)
def size_on_disk(path):
    if os.path.isdir(path):
        total = 0
        for root, _, files in os.walk(path):
            for f in files:
                try:
                    fp = os.path.join(root, f)
                    st = os.stat(fp)
                    total += st.st_blocks * 512 if hasattr(st, 'st_blocks') else st.st_size
                except:
                    pass
        return total
    else:
        st = os.stat(path)
        return st.st_blocks * 512 if hasattr(st, 'st_blocks') else st.st_size

# Calculate directory total size recursively
def dir_size(path):
    total = 0
    for root, _, files in os.walk(path):
        for f in files:
            try:
                fp = os.path.join(root, f)
                total += os.path.getsize(fp)
            except:
                pass
    return total

# Choose best recommendation unit
def best_unit(size_bytes):
    v = float(size_bytes)
    idx = 0
    while v >= 1024 and idx < len(UNITS) - 1:
        v /= 1024
        idx += 1
    return UNITS[idx]

def show_help():
    print(f"""{BOLD}Usage:{RESET}
  fs [files] [unit] [options]

{BOLD}Examples:{RESET}
  fs [file.txt file2.png] MiB -sort -total
  fs [dir1 dir2 file.txt] KiB -tunit:GiB
  fs -help

{BOLD}Options:{RESET}
  -sort           Sort files/directories from largest to smallest
  -total          Show total size at the end
  -tunit:<unit>   Show total size in another unit (forces total even if -total not used)
  -help           Show this help menu

{BOLD}Units:{RESET}
  B, KiB, MiB, GiB, TiB
""")

def main():
    if len(sys.argv) < 2:
        print(f"{RED}Use 'fs -help' to learn more.{RESET}\n")
        sys.exit(0)

    args = sys.argv[1:]
    if "-help" in args or "--help" in args:
        show_help()
        return

    sort_flag = "-sort" in args
    total_flag = "-total" in args
    tunit = None
    for a in args:
        if a.startswith("-tunit:"):
            tunit = a.split(":")[1]
            total_flag = True

    files = []
    inside_bracket = False
    for a in args:
        if a.startswith("["):
            inside_bracket = True
            a = a[1:]
        if a.endswith("]"):
            inside_bracket = False
            a = a[:-1]
        if not a.startswith("-"):
            files.append(a)
        elif inside_bracket:
            files.append(a)

    if not files:
        print(f"{RED}Syntax error: no files specified. Use brackets [file1 file2].{RESET}\n")
        sys.exit(1)

    forced_unit = None
    if files[-1] in UNITS:
        forced_unit = files[-1]
        files = files[:-1]

    info = []
    total_size = 0
    total_disk = 0

    print(f"File{SPACE}|{SPACE}Size{SPACE}|{SPACE}Size on Disk{SPACE}|{SPACE}Path")
    print("-" * 130)

    for f in files:
        if not os.path.exists(f):
            print(f"{RED}{BOLD}Error: '{f}' not found{RESET}")
            continue

        if os.path.isdir(f):
            size = dir_size(f)
            disk = size_on_disk(f)
            dir_note = f"   {PURPLE}This is a directory{RESET}"
        else:
            size = os.path.getsize(f)
            disk = size_on_disk(f)
            dir_note = ""

        total_size += size
        total_disk += disk
        info.append((f, size, disk, dir_note))

    if sort_flag:
        info.sort(key=lambda x: x[1], reverse=True)

    for f, size, disk, note in info:
        v, u = convert(size, forced_unit)
        vd, ud = convert(disk, forced_unit)
        v = round(v, 10)
        vd = round(vd, 10)
        v_str = f"{v}" if v % 1 != 0 else f"{int(v)}"
        vd_str = f"{vd}" if vd % 1 != 0 else f"{int(vd)}"
        print(f"{os.path.basename(f)}{SPACE}|{SPACE}{v_str} {u}{SPACE}|{SPACE}{vd_str} {ud}{SPACE}|{SPACE}{os.path.abspath(f)}{note}")

    if total_flag:
        print("-" * 130)
        t_val, t_unit = convert(total_size, tunit if tunit else forced_unit)
        t_val = round(t_val, 10)
        t_str = f"{t_val}" if t_val % 1 != 0 else f"{int(t_val)}"
        print(f"{CYAN}Total size: {t_str} {t_unit}{RESET}")

    if forced_unit:
        recommended = best_unit(total_size)
        if recommended != forced_unit:
            print(f"\n{RED}{BOLD}Recommendation: use {recommended} for these files{RESET}\n")

if __name__ == "__main__":
    main()
