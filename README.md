# mt7902-bluetooth-dkms-git

DKMS Bluetooth driver for MediaTek MT7902 chipset.

## Description

This package provides a DKMS-enabled Bluetooth driver for the MediaTek MT7902 chipset. The driver is automatically compiled for your current kernel and will be recompiled when you update your kernel.

## Prerequisites

Before installing this package, make sure you have:
- `dkms` package installed
- Linux kernel headers for your current kernel (`linux-headers`)
- `mt7902-firmware-git` package installed

## Installation

Install from AUR:
```bash
yay -S mt7902-bluetooth-dkms-git
```

Or build manually:
```bash
git clone https://aur.archlinux.org/mt7902-bluetooth-dkms-git.git
cd mt7902-bluetooth-dkms-git
makepkg -si
```

## Usage

After installation, enable the driver:

```bash
# Remove the default btusb and btmtk modules
sudo rmmod btusb btmtk 2>/dev/null || true

# Load the MT7902 Bluetooth modules
sudo modprobe btmtk
sudo modprobe btusb
```

To make the changes persistent across reboots, you can create a systemd service or add the commands to your startup scripts.

## Automatic Module Loading

To automatically load the modules on boot, create a file `/etc/modules-load.d/mt7902-bluetooth.conf`:

```
btmtk
btusb
```

## Troubleshooting

If Bluetooth is not working:

1. Make sure the `mt7902-firmware-git` package is installed
2. Check if the modules are loaded:
   ```bash
   lsmod | grep bt
   ```
3. Check kernel logs for errors:
   ```bash
   sudo dmesg | grep -i bluetooth
   ```

## Known Issues

If the Bluetooth driver conflicts with the `gen4-mt7902` driver, you may need to remove the conflicting firmware:
```bash
sudo rm /lib/firmware/mediatek/mt7902/BT_RAM_CODE_MT7902_1_1_hdr.bin.zst
```

## Source

The driver is sourced from: https://github.com/OnlineLearningTutorials/mt7902_temp

## Maintainer

AnmiTaliDev <anmitali198@gmail.com>

## License

GPL2 - See LICENSE file in the package for details.
