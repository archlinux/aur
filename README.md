# Vivobook RGB

RGB keyboard control for ASUS Vivobook laptops using the HID LampArray protocol.

## Description

This tool allows you to control the RGB lighting of ASUS Vivobook keyboards that use the ITE5570 HID LampArray controller. Unlike `asusctl` which uses WMI, this tool communicates directly with the keyboard controller through the HID subsystem.

## Supported Hardware

- ASUS Vivobook S 16 (M5606KA)
- ASUS Vivobook S 14 (S5406SA)
- Any ASUS laptop with ITE5570 keyboard controller

## Installation

### From AUR (when available)

```bash
yay -S vivobook-rgb
# or
paru -S vivobook-rgb
```

### Manual Installation

```bash
git clone https://github.com/matcraft94/vivobook-rgb.git
cd vivobook-rgb
makepkg -si
```

## Usage

```bash
# Show keyboard information
vrgb info

# Set solid color (hex RGB)
vrgb color ff0000    # Red
vrgb color 00ff00    # Green
vrgb color 0000ff    # Blue
vrgb color ff00ff    # Magenta
vrgb color 00ffff    # Cyan
vrgb color ffff00    # Yellow
vrgb color ff5500    # Orange
vrgb color 100900    # Warm white (good for night)

# Turn off keyboard lighting
vrgb off

# Enable rainbow mode (firmware controlled)
vrgb auto
```

## Post-Installation

After installation, reload udev rules or reboot:

```bash
sudo udevadm control --reload-rules
sudo udevadm trigger
```

### Optional: Set default color on boot

```bash
sudo systemctl enable --now vrgb-default.service
```

Edit `/usr/lib/systemd/system/vrgb-default.service` to change the default color.

## Why this exists

ASUS Vivobook keyboards use the HID LampArray protocol (Windows Dynamic Lighting standard) instead of the WMI interface used by ROG and TUF laptops. This means `asusctl` cannot control the RGB colors on these laptops, only brightness.

This tool bridges that gap by communicating directly with the ITE5570 controller via hidraw.

## Requirements

- Python 3
- Linux kernel with hidraw support
- Access to `/dev/hidraw*` (configured via udev rules)

## Author

Lucy E. Arias (@matcraft94)

## License

MIT License - see LICENSE file for details
