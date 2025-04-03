# Web Blocker

A lightweight tool to block websites using `iptables` on Linux systems.

## Features
- Blocks websites by resolving their IP addresses and applying `iptables` rules.
- Supports custom site lists via `/etc/web-blocker/sites.conf`.
- Persistent rules saved to `/etc/iptables/rules.v4`.

## Installation
1. Build and install the package on Arch Linux:
   ```bash
   makepkg -si