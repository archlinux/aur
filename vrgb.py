#!/usr/bin/env python3
"""
RGB keyboard control for ASUS Vivobook via HID LampArray protocol.

This tool controls RGB lighting on ASUS Vivobook laptops that use
the ITE5570 HID LampArray controller (e.g., M5606KA, S5406SA).

Author: Lucy E. Arias <matcraft94@github.com>
License: MIT
"""

import sys
import os
import struct
import fcntl
import array
import glob

VENDOR_ID = "0B05"
PRODUCT_ID = "5570"


def find_device():
    """Auto-detect hidraw device for ASUS ITE5570 keyboard controller."""
    for uevent_path in glob.glob("/sys/class/hidraw/hidraw*/device/uevent"):
        with open(uevent_path) as f:
            content = f.read()
        if f"0000{VENDOR_ID}:0000{PRODUCT_ID}" in content.upper():
            name = uevent_path.split("/")[4]
            return f"/dev/{name}"
    print("Error: ASUS keyboard RGB controller (ITE5570) not found", file=sys.stderr)
    print("Make sure you have an ASUS Vivobook with RGB keyboard", file=sys.stderr)
    sys.exit(1)


def _IOWR(type_char, nr, size):
    return 0xC0000000 | (size << 16) | (ord(type_char) << 8) | nr


def get_feature_report(fd, report_id, size):
    buf = array.array('B', [report_id] + [0] * (size - 1))
    fcntl.ioctl(fd, _IOWR('H', 0x07, size), buf)
    return buf


def set_feature_report(fd, data):
    buf = array.array('B', data)
    fcntl.ioctl(fd, _IOWR('H', 0x06, len(data)), buf)
    return buf


def get_lamp_array_attributes(fd):
    """Get lamp array information from the keyboard."""
    try:
        report = get_feature_report(fd, 0x41, 23)
        lamp_count = struct.unpack_from('<H', report, 1)[0]
        bbox_w, bbox_h, bbox_d, kind, min_interval = struct.unpack_from('<IIIII', report, 3)
        return {
            'lamp_count': lamp_count,
            'bbox_width': bbox_w,
            'bbox_height': bbox_h,
            'bbox_depth': bbox_d,
            'kind': kind,
            'min_update_interval': min_interval
        }
    except Exception as e:
        print(f"Error getting lamp attributes: {e}")
        return None


def set_autonomous_mode(fd, enabled):
    """Enable/disable firmware autonomous (rainbow) mode."""
    set_feature_report(fd, [0x46, 1 if enabled else 0])


def set_color_range(fd, start, end, r, g, b, intensity=255):
    """Set color for a range of keys."""
    data = [0x45, 0x01]
    data += list(struct.pack('<H', start))
    data += list(struct.pack('<H', end))
    data += [r, g, b, intensity]
    set_feature_report(fd, data)


def main():
    if len(sys.argv) < 2:
        print("Usage:")
        print(f"  {sys.argv[0]} info          - Show lamp array info")
        print(f"  {sys.argv[0]} color RRGGBB  - Set solid color (hex, e.g., ff0000)")
        print(f"  {sys.argv[0]} off           - Turn off LEDs")
        print(f"  {sys.argv[0]} auto          - Re-enable autonomous (rainbow) mode")
        print()
        print("Examples:")
        print(f"  {sys.argv[0]} color ff0000   # Red")
        print(f"  {sys.argv[0]} color 00ff00   # Green")
        print(f"  {sys.argv[0]} color 0000ff   # Blue")
        print(f"  {sys.argv[0]} color ff00ff   # Magenta")
        print(f"  {sys.argv[0]} color 00ffff   # Cyan")
        print(f"  {sys.argv[0]} color ffff00   # Yellow")
        sys.exit(1)

    device = find_device()
    
    try:
        fd = os.open(device, os.O_RDWR)
    except PermissionError:
        print(f"Error: Permission denied accessing {device}", file=sys.stderr)
        print("Try running with sudo, or ensure udev rules are properly configured.", file=sys.stderr)
        sys.exit(1)
    except FileNotFoundError:
        print(f"Error: Device {device} not found", file=sys.stderr)
        sys.exit(1)

    try:
        cmd = sys.argv[1]

        if cmd == "info":
            attrs = get_lamp_array_attributes(fd)
            if attrs:
                kinds = {
                    0: "Undefined", 1: "Keyboard", 2: "Mouse", 3: "GameController",
                    4: "Peripheral", 5: "Scene", 6: "Notification", 7: "Chassis",
                    8: "Wearable", 9: "Furniture"
                }
                print(f"Device:              {device}")
                print(f"Lamp count:          {attrs['lamp_count']}")
                print(f"Kind:                {kinds.get(attrs['kind'], 'Unknown')} ({attrs['kind']})")
                print(f"Bounding box:        {attrs['bbox_width']}x{attrs['bbox_height']}x{attrs['bbox_depth']} µm")
                print(f"Min update interval: {attrs['min_update_interval']} µs")
            else:
                print("Could not get lamp array attributes")
                sys.exit(1)

        elif cmd == "color":
            if len(sys.argv) < 3:
                print("Error: Provide hex color, e.g.: color ff0000")
                sys.exit(1)
            hex_color = sys.argv[2].lstrip('#')
            if len(hex_color) != 6:
                print("Error: Color must be 6 hex digits (RRGGBB)")
                sys.exit(1)
            try:
                r = int(hex_color[0:2], 16)
                g = int(hex_color[2:4], 16)
                b = int(hex_color[4:6], 16)
            except ValueError:
                print("Error: Invalid hex color")
                sys.exit(1)

            attrs = get_lamp_array_attributes(fd)
            if attrs:
                set_autonomous_mode(fd, False)
                set_color_range(fd, 0, attrs['lamp_count'] - 1, r, g, b, 255)
            else:
                print("Failed to get lamp attributes")
                sys.exit(1)

        elif cmd == "off":
            attrs = get_lamp_array_attributes(fd)
            if attrs:
                set_autonomous_mode(fd, False)
                set_color_range(fd, 0, attrs['lamp_count'] - 1, 0, 0, 0, 0)
            else:
                print("Failed to get lamp attributes")
                sys.exit(1)

        elif cmd == "auto":
            set_autonomous_mode(fd, True)

        else:
            print(f"Unknown command: {cmd}")
            sys.exit(1)

    finally:
        os.close(fd)


if __name__ == "__main__":
    main()
