# vtlock

Block VT switching at the kernel level while your screen is locked.

## What it does

`vtlock` sets the current VT into `VT_PROCESS` mode before running your screen locker, which prevents `Ctrl+Alt+Fx` from switching to another virtual console. When the locker exits, VT switching is restored.

This closes the common physical attack where someone presses `Ctrl+Alt+F3` and kills your screen locker from another TTY.

## Installation

### From AUR

    yay -S vtlock

After installation, set the setuid bit so vtlock can lock VTs:

    sudo chmod u+s /usr/bin/vtlock

### Manual

Clone the repository and build with make:

    darcs clone https://hub.darcs.net/stef204/vtlock
    cd vtlock
    make
    sudo make install
    sudo chmod u+s /usr/local/bin/vtlock

To install to /usr/bin instead, override PREFIX:

    sudo make install PREFIX=/usr
    sudo chmod u+s /usr/bin/vtlock

## Usage

    vtlock "i3lock -n -c 000000"

Replace the command with your preferred screen locker. The `-n` or `--nofork` flag (or equivalent for your screen locker) is important so vtlock knows when the child process exits and can restore VT switching.

## Wrapper examples

`vtlock` is designed for standalone screen lockers used with window managers (i3, Sway, dwm, bspwm, Hyprland, etc.). Desktop environments (GNOME, KDE, Xfce) typically handle VT locking through their display manager and do not need `vtlock`. Adapt to your own needs.

### 1. i3lock (X11)

    #!/bin/sh
    pgrep -x i3lock >/dev/null && exit 0
    vtlock "i3lock -n -c 000000"

### 2. swaylock (Wayland/Sway)

    #!/bin/sh
    pgrep -x swaylock >/dev/null && exit 0
    vtlock "swaylock -f"

### 3. hyprlock (Wayland/Hyprland)

    #!/bin/sh
    pgrep -x hyprlock >/dev/null && exit 0
    vtlock "hyprlock --no-fork"

### 4. slock (X11, suckless)

    #!/bin/sh
    pgrep -x slock >/dev/null && exit 0
    vtlock "slock"

Note: slock may fork depending on build options. If your build forks, wrap with a loop that waits for the slock process to exit.

### 5. gtklock (Wayland)

    #!/bin/sh
    pgrep -x gtklock >/dev/null && exit 0
    vtlock "gtklock"

## How it works

`vtlock` uses the Linux VT ioctl to switch the console to `VT_PROCESS` mode, where X/Wayland owns it exclusively and keyboard-initiated VT switching is disabled at the kernel level. When the child process exits, the original mode is restored via `atexit` and signal handlers.

## Requirements

- Linux with VT support
- Screen locker that supports a no-fork flag or runs in the foreground

## License

MIT
