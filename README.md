# mt7902-firmware-git

Firmware files for MediaTek MT7902 WiFi 6E and Bluetooth chipset.

## Description

This package provides the necessary firmware files for the MediaTek MT7902 chipset, which includes:
- WiFi 6E (802.11ax) support
- Bluetooth connectivity

## Installation

Install from AUR:
```bash
yay -S mt7902-firmware-git
```

Or build manually:
```bash
git clone https://aur.archlinux.org/mt7902-firmware-git.git
cd mt7902-firmware-git
makepkg -si
```

## Firmware Files

The package installs the following firmware files to `/usr/lib/firmware/mediatek/`:
- `WIFI_MT7902_patch_mcu_1_1_hdr.bin.zst`
- `WIFI_RAM_CODE_MT7902_1.bin.zst`
- `BT_RAM_CODE_MT7902_1_1_hdr.bin.zst`
- Additional MT7902 firmware files

## Usage

After installation, the firmware files will be automatically loaded by the kernel when needed.

For Bluetooth support, you may also want to install the `mt7902-bluetooth-dkms-git` package.

## Source

The firmware files are sourced from: https://github.com/OnlineLearningTutorials/mt7902_temp

## Maintainer

AnmiTaliDev <anmitali198@gmail.com>

## License

See LICENSE file in the package for details.
