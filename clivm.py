#!/usr/bin/env python3
import os
import curses
import subprocess
import time

BASE_PATH = "/usr/share/clivm"
CLIVM_CHROOT = os.path.join(BASE_PATH, "clivm-chroot")
ARCH_CHROOT = os.path.join(BASE_PATH, "clivm-chroot-arch")
INSTALLERS_PATH = os.path.join(BASE_PATH, "installers")
HOME_DIR = os.path.expanduser("~")


def get_distro_path(distro):
    return os.path.join(HOME_DIR, "CLIVM", f".{distro}")


def draw_menu(stdscr, selected, title, options):
    stdscr.clear()
    h, w = stdscr.getmaxyx()
    stdscr.addstr(1, w // 2 - len(title) // 2, title, curses.A_BOLD | curses.A_UNDERLINE)

    for i, option in enumerate(options):
        x = w // 2 - len(option) // 2
        y = 3 + i
        if i == selected:
            stdscr.attron(curses.A_REVERSE)
            stdscr.addstr(y, x, option)
            stdscr.attroff(curses.A_REVERSE)
        else:
            stdscr.addstr(y, x, option)
    stdscr.refresh()


def show_spinner(message, duration=0.2):
    spinner = ['|', '/', '-', '\\']
    print(message, end='', flush=True)
    for _ in range(5):
        for char in spinner:
            print(f'\r{message} {char}', end='', flush=True)
            time.sleep(duration)
    print('\r' + ' ' * (len(message) + 2), end='\r')


def launch_chroot(distro):
    path = get_distro_path(distro)
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
    script = os.path.join(INSTALLERS_PATH, f"install-{distro}.sh")
    if not os.path.isfile(script):
        input("\nInstaller not found.\nPress Enter to return...")
        return

    curses.def_prog_mode()
    curses.endwin()

    print(f"\nStarting installer for {distro}...\n")
    subprocess.run(["bash", script])

    input("\nInstaller finished.\nPress Enter to return to launcher...")
    curses.reset_prog_mode()


def uninstall_distro(distro):
    path = get_distro_path(distro)
    if not os.path.isdir(path):
        input("\nDistro not installed.\nPress Enter to return...")
        return

    curses.def_prog_mode()
    curses.endwin()

    print(f"\nUninstalling {distro}...")

    try:
        subprocess.run(["sudo", "rm", "-rf", path])
        print("Uninstall complete.")
    except Exception as e:
        print(f"Uninstall failed: {e}")

    input("\nPress Enter to return to launcher...")
    curses.reset_prog_mode()


def install_menu(stdscr):
    options = ["Debian", "Arch", "Alpine", "Back"]
    selected = 0

    while True:
        draw_menu(stdscr, selected, "Install a Distro", options)
        key = stdscr.getch()

        if key == curses.KEY_UP:
            selected = (selected - 1) % len(options)
        elif key == curses.KEY_DOWN:
            selected = (selected + 1) % len(options)
        elif key in [curses.KEY_ENTER, 10, 13]:
            if selected == len(options) - 1:
                break
            run_installer(options[selected].lower())


def uninstall_menu(stdscr):
    options = ["Debian", "Arch", "Alpine", "Back"]
    selected = 0

    while True:
        draw_menu(stdscr, selected, "Uninstall a Distro", options)
        key = stdscr.getch()

        if key == curses.KEY_UP:
            selected = (selected - 1) % len(options)
        elif key == curses.KEY_DOWN:
            selected = (selected + 1) % len(options)
        elif key in [curses.KEY_ENTER, 10, 13]:
            if selected == len(options) - 1:
                break
            uninstall_distro(options[selected].lower())


def main(stdscr):
    curses.curs_set(0)
    options = ["Debian", "Arch", "Alpine", "Install", "Uninstall", "Quit"]
    selected = 0

    while True:
        draw_menu(stdscr, selected, "CLIvm Launcher", options)
        key = stdscr.getch()

        if key == curses.KEY_UP:
            selected = (selected - 1) % len(options)
        elif key == curses.KEY_DOWN:
            selected = (selected + 1) % len(options)
        elif key in [curses.KEY_ENTER, 10, 13]:
            if selected == 0:
                launch_chroot("debian")
            elif selected == 1:
                launch_chroot("arch")
            elif selected == 2:
                launch_chroot("alpine")
            elif selected == 3:
                install_menu(stdscr)
            elif selected == 4:
                uninstall_menu(stdscr)
            elif selected == 5:
                break


if __name__ == "__main__":
    curses.wrapper(main)
