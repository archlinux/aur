# DDH: Dynamic Display Handler
DDH is a Bash script for Arch Linux systems that automatically manages external displays and optimizes refresh rate when running on battery power.

## Dependencies
These scripts require:

- Xorg
- systemd
- Standard utilities: awk, grep, sed

Ensure all these are installed before running the scripts.

## Installation
1. Clone this repository:

```bash
git clone https://github.com/RiddlerXenon/DynamicDisplayHandler
```

2. Navigate to the repository directory:

```bash
cd DynamicDisplayHandler
```

3. Make install.sh executable:

```bash
sudo chmod +x install.sh
```

4. Run install.sh for automatic setup and installation of DDH:

```bash
sudo ./install.sh
```

## Uninstallation
To uninstall DDH, follow these steps:

1. Navigate to the repository directory:

```bash
cd <repository name>    
```

2. Make uninstall.sh executable:

```bash
sudo chmod +x uninstall.sh
```

3. Run uninstall.sh to uninstall DDH:

```bash
sudo ./uninstall.sh
```

This will remove DDH and its configuration files from your system.

## Usage
DDH runs in the background, automatically detecting connected displays and managing their settings. It also automatically optimizes the display refresh rate when the system is running on battery power to save energy.

## Configuration
DDH uses a configuration file that is created during installation. You can modify this file to customize DDH's behavior. The configuration file is located at `~/.config/ddh/config.ini`.

## License
DDH is distributed under the GNU General Public License v3.0. See the LICENSE file for additional information.

## Support

If you find this project helpful, consider supporting it by sending some Ether. It's like buying me a coffee!

[![Buy me a coffee](https://cdn.buymeacoffee.com/buttons/default-orange.png)](#)

Ethereum Address: `0xb51A27fF50e0E61E7626d2f99255A65Bc9B92e22`
