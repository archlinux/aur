# system76-power-GUI

![header](https://gitea.dockservices.co/G34RZ/system76-power-GUI/raw/branch/main/screen-shot.png "(By BG)")

This GUI is built on system76-power application that is used in their GUI implementations. Thus the name. I built this GUI to use with Arch on a window manager running wayland. 

## Features
- View current power profile
- Switch between Battery, Balanced, and Turbo modes
## Coming Soon
- Automatic profile persistence
- System tray integration

## Dependencies
- system76-power
- polkit (for privilege escalation)

## Dependency Interference
- upower: uninstall or if needed mask using systemd otherwise system76-power will not work, therefore neither will this application. 

## Installation

### Make Source Linux
```bash
# Build and install the package
makepkg -si
```

## Usage
Launch the application from your desktop environment's application menu or run:
```bash
system76-power-gui
```
