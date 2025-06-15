#!/usr/bin/env python3

import curses
import subprocess
import os
import sys
import time

DISTROS = ["debian", "arch", "alpine", "gentoo", "ubuntu"]
HOME_DIR = os.path.expanduser("~")
BASE_PATH = os.path.join(HOME_DIR, "clivm")
CLIVM_CHROOT = os.path.join(BASE_PATH, "binaries", "clivm-chroot")
ARCH_CHROOT = os.path.join(BASE_PATH, "binaries", "arch-chroot")
INSTALLERS_PATH = os.path.join(BASE_PATH, "installers")
BRAILLE_FRAMES = ["⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏"]

def bottom_message(stdscr, message):
    height, width = stdscr.getmaxyx()
    stdscr.move(height - 1, 0)
    stdscr.clrtoeol()
    stdscr.attron(curses.color_pair(2))
    stdscr.addstr(height - 1, 2, message[:width - 4])
    stdscr.attroff(curses.color_pair(2))
    stdscr.refresh()

def show_spinner(message):
    spinner = BRAILLE_FRAMES
    sys.stdout.write(f"\n{message} ")
    sys.stdout.flush()

    start = time.time()
    i = 0
    while time.time() - start < 1.5:
        sys.stdout.write(f"\r{message} {spinner[i % len(spinner)]}")
        sys.stdout.flush()
        time.sleep(0.1)
        i += 1

    sys.stdout.write(f"\r{message} done.\n")
    sys.stdout.flush()

def launch_chroot(distro):
    path = os.path.join(BASE_PATH, f".{distro}")
    if not os.path.isdir(path):
        input("\nPress Enter to return to launcher...")
        return

    curses.def_prog_mode()
    curses.endwin()

    show_spinner(f"Entering {distro} chroot...")

    try:
        if distro == "arch":
            subprocess.run(["sudo", ARCH_CHROOT, path, "/bin/bash"])
        elif distro == "alpine":
            subprocess.run(["sudo", CLIVM_CHROOT, path, "/bin/sh", "-l"])
        else:
            subprocess.run(["sudo", CLIVM_CHROOT, path, "/bin/bash"])
    except Exception as e:
        print(f"\nChroot failed: {e}")
    finally:
        input("\nPress Enter to return to launcher...")
        curses.reset_prog_mode()

def run_installer(distro):
    installer_script = os.path.join(INSTALLERS_PATH, f"{distro}.sh")
    if not os.path.isfile(installer_script) or not os.access(installer_script, os.X_OK):
        input(f"\nInstaller for {distro} not found or not executable. Press Enter to continue...")
        return

    curses.def_prog_mode()
    curses.endwin()

    show_spinner(f"Running installer for {distro}...")

    try:
        subprocess.run(["bash", installer_script])
    except Exception as e:
        print(f"\nInstaller failed: {e}")
    finally:
        print("\nReturning to launcher...")
        time.sleep(1)
        curses.reset_prog_mode()

def uninstall_distro(distro):
    path = os.path.join(BASE_PATH, f".{distro}")
    if not os.path.isdir(path):
        input(f"\n{distro} is not installed. Press Enter to continue...")
        return

    curses.def_prog_mode()
    curses.endwin()

    confirm = input(f"\nAre you sure you want to uninstall {distro}? [y/N]: ")
    if confirm.lower() != 'y':
        print("\nUninstall canceled.")
        time.sleep(1)
        curses.reset_prog_mode()
        return

    show_spinner(f"Uninstalling {distro}...")

    try:
        subprocess.run(["sudo", "rm", "-rf", path])
    except Exception as e:
        print(f"\nUninstall failed: {e}")
    finally:
        print("\nReturning to launcher...")
        time.sleep(1)
        curses.reset_prog_mode()

def install_menu(stdscr):
    missing_distros = [d for d in DISTROS if not os.path.isdir(os.path.join(BASE_PATH, f".{d}"))]
    if not missing_distros:
        bottom_message(stdscr, "All distros installed. Press any key to return.")
        stdscr.getch()
        return

    selected = 0
    while True:
        stdscr.clear()
        height, width = stdscr.getmaxyx()
        title = "-- Install New Distro --"
        stdscr.attron(curses.color_pair(2))
        stdscr.addstr(1, (width - len(title)) // 2, title)
        stdscr.attroff(curses.color_pair(2))

        for idx, distro in enumerate(missing_distros):
            y = 3 + idx
            x = 4
            marker = "▶" if idx == selected else " "
            stdscr.attron(curses.color_pair(1) if idx == selected else curses.color_pair(2))
            stdscr.addstr(y, x, f"{marker} {distro.capitalize()}")
            stdscr.attroff(curses.color_pair(1) if idx == selected else curses.color_pair(2))

        stdscr.attron(curses.color_pair(2))
        stdscr.addstr(height - 2, 2, "Use ↑↓ to select, Enter to install, ESC to return.")
        stdscr.attroff(curses.color_pair(2))
        stdscr.refresh()

        key = stdscr.getch()
        if key in [curses.KEY_UP, ord('k')]:
            selected = (selected - 1) % len(missing_distros)
        elif key in [curses.KEY_DOWN, ord('j')]:
            selected = (selected + 1) % len(missing_distros)
        elif key in [10, 13]:
            run_installer(missing_distros[selected])
            break
        elif key == 27:
            break

def uninstall_menu(stdscr):
    installed = [d for d in DISTROS if os.path.isdir(os.path.join(BASE_PATH, f".{d}"))]
    if not installed:
        bottom_message(stdscr, "No distros to uninstall. Press any key to return.")
        stdscr.getch()
        return

    selected = 0
    while True:
        stdscr.clear()
        height, width = stdscr.getmaxyx()
        title = "-- Uninstall Distro --"
        stdscr.attron(curses.color_pair(2))
        stdscr.addstr(1, (width - len(title)) // 2, title)
        stdscr.attroff(curses.color_pair(2))

        for idx, distro in enumerate(installed):
            y = 3 + idx
            x = 4
            marker = "▶" if idx == selected else " "
            stdscr.attron(curses.color_pair(1) if idx == selected else curses.color_pair(2))
            stdscr.addstr(y, x, f"{marker} {distro.capitalize()}")
            stdscr.attroff(curses.color_pair(1) if idx == selected else curses.color_pair(2))

        stdscr.attron(curses.color_pair(2))
        stdscr.addstr(height - 2, 2, "Use ↑↓ to select, Enter to uninstall, ESC to return.")
        stdscr.attroff(curses.color_pair(2))
        stdscr.refresh()

        key = stdscr.getch()
        if key in [curses.KEY_UP, ord('k')]:
            selected = (selected - 1) % len(installed)
        elif key in [curses.KEY_DOWN, ord('j')]:
            selected = (selected + 1) % len(installed)
        elif key in [10, 13]:
            uninstall_distro(installed[selected])
            break
        elif key == 27:
            break

def main(stdscr):
    curses.curs_set(0)
    curses.start_color()
    curses.use_default_colors()
    curses.init_pair(1, curses.COLOR_BLACK, curses.COLOR_WHITE)
    curses.init_pair(2, curses.COLOR_WHITE, -1)

    selected = 0
    menu_items = DISTROS + ["Install new distro", "Uninstall distro"]

    while True:
        stdscr.clear()
        height, width = stdscr.getmaxyx()

        title = "-- clivm launcher --"
        stdscr.attron(curses.color_pair(2))
        stdscr.addstr(1, (width - len(title)) // 2, title)
        stdscr.attroff(curses.color_pair(2))

        for idx, item in enumerate(menu_items):
            y = 3 + idx
            x = 4
            marker = "▶" if idx == selected else " "

            if item in ["Install new distro", "Uninstall distro"]:
                stdscr.attron(curses.color_pair(1) if idx == selected else curses.color_pair(2))
                stdscr.addstr(y, x, f"{marker} {item}")
                stdscr.attroff(curses.color_pair(1) if idx == selected else curses.color_pair(2))
                continue

            path = os.path.join(BASE_PATH, f".{item}")
            exists = os.path.isdir(path)
            status = "(found)" if exists else "(missing)"

            stdscr.attron(curses.color_pair(1) if idx == selected else curses.color_pair(2))
            stdscr.addstr(y, x, f"{marker} {item.capitalize():<8} {status}")
            stdscr.attroff(curses.color_pair(1) if idx == selected else curses.color_pair(2))

        stdscr.attron(curses.color_pair(2))
        stdscr.addstr(height - 2, 2, "Use ↑↓ arrows to navigate, Enter to launch/install, q or ESC to quit.")
        stdscr.attroff(curses.color_pair(2))
        stdscr.refresh()

        key = stdscr.getch()
        if key in [curses.KEY_UP, ord('k')]:
            selected = (selected - 1) % len(menu_items)
        elif key in [curses.KEY_DOWN, ord('j')]:
            selected = (selected + 1) % len(menu_items)
        elif key in [10, 13]:
            if menu_items[selected] == "Install new distro":
                install_menu(stdscr)
            elif menu_items[selected] == "Uninstall distro":
                uninstall_menu(stdscr)
            else:
                distro = menu_items[selected]
                path = os.path.join(BASE_PATH, f".{distro}")
                if os.path.isdir(path):
                    launch_chroot(distro)
                else:
                    bottom_message(stdscr, f"{distro} not installed.")
                    stdscr.getch()
        elif key in [27, ord('q')]:
            break

if __name__ == "__main__":
    try:
        curses.wrapper(main)
    except KeyboardInterrupt:
        print("\nExiting launcher...")
        sys.exit(0)
