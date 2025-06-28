# routekit

**routekit** is a powerful, colorful, and user-friendly command-line utility for visualizing and managing Linux routing tables, rules, and network interfaces. It provides human-readable output with enhanced formatting, ideal for both sysadmins and power users.

![License](https://img.shields.io/github/license/hanashiko/routekit)
![AUR](https://img.shields.io/aur/version/routekit?color=blue)
![Platform](https://img.shields.io/badge/platform-Linux-green)
![Python](https://img.shields.io/badge/python-3.6%2B-blue)

## Features

- View routing tables (including custom ones).
- how advanced routing rules.
- Get detailed route resolution to a specific destination.
- Add and ➖ remove routes (requires root).
- List available network interfaces and IP addresses.
- Terminal colorized output for readability.
- Packaged as a full CLI tool.
- Available on the AUR: [`routekit`](https://aur.archlinux.org/packages/routekit)

---

## Installation

### From AUR (Recommended for Arch Linux users)

```bash
yay -S routekit
```

### Manual Installation

Clone the repository and install manually:
```bash
git clone https://github.com/hanashiko/routekit.git
cd routekit
chmod +x install.sh
sudo ./install.sh
```

---

## Requirements

- Python 3.6+
- `iproute2` package (`ip` command must be available)
- Linux system

---

## Usage

```bash
routekit [commmand] [arguments...]
```

### Examples

```bash
routekit show     # Show main routing table
routekit show table local     # Show custom 'local' routing table
routekit rules     # List routing rules
routekit get 8.8.8.8     # Resolve route for 8.8.8.8
routekit add default via 192.168.0.1 dev wlan0     # Add a default route
routekit del default     # Delete the default route
routekit interfaces     # List network interfaces
```

---

## Available Commands

| Command | Description |
|---------|-------------|
| `show [table]` | Display the routing table (default: main) |
| `rules` | Show routing rules (`ip rule show`) | 
| `get <IP>` | Show how a specific destination is routed |
| `add <ARGS>` | Add a route (e.g., `routekit add default via 1.1.1.1 dev eth0) |
| `del <ARGS>` | Delete a route |
| `interfaces` | Show all network interfaces and their IPs |

---

## License

This project is licensed under the MIT License.

---

### Author

Hanashiko