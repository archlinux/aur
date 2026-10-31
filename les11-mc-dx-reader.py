#!/usr/bin/env python3
"""Read the LES11-MC-Dx USB temperature sensor (Modbus RTU over USB-serial).

The LES11-MC-Dx exposes six channels (A1..A6) over Modbus RTU. Each channel is
one holding register (function code 0x03) starting at register 0x0000. The raw
16-bit value is (high*256 + low) / 10 degC; two's complement for negatives;
0x7FFF means "no probe / probe fault" on that channel.

Defaults match the factory settings: device address 1, 9600 8N1. The CH340
USB-serial adapter used by this probe is auto-detected; override with --device.
"""
import argparse
import glob
import os
import sys
import time

try:
    import serial
except ImportError:
    sys.exit("error: pyserial is required (pip install pyserial / pacman -S python-pyserial)")

DEFAULT_DEVICE = None  # auto-detect
DEFAULT_BAUD = 9600
DEFAULT_ADDR = 1
DEFAULT_COUNT = 6
CH340_VENDOR_ID = "1a86"  # QinHeng Electronics, the LES11-MC-Dx USB-serial chip
MISSING_CODE = 0x7FFF


def crc16(data: bytes) -> int:
    """Modbus CRC-16/MODBUS (poly 0xA001, init 0xFFFF)."""
    crc = 0xFFFF
    for b in data:
        crc ^= b
        for _ in range(8):
            if crc & 1:
                crc = (crc >> 1) ^ 0xA001
            else:
                crc >>= 1
    return crc


def decode_temp(raw: bytes) -> tuple[float, bool]:
    """Return (temperature_celsius, is_missing) for a 2-byte big-endian field."""
    value = (raw[0] << 8) | raw[1]
    if value == MISSING_CODE:
        return float("nan"), True
    if value & 0x8000:
        value -= 0x10000  # two's complement
    return value / 10.0, False


def _vendor_id(path: str) -> str:
    """Read the USB idVendor of the adapter backing a /dev/ttyUSB* node."""
    link = "/sys/bus/usb-serial/devices/" + os.path.basename(path)
    try:
        dev = os.path.dirname(os.path.dirname(os.path.realpath(link)))
        with open(os.path.join(dev, "idVendor")) as fh:
            return fh.read().strip()
    except OSError:
        return ""


def detect_device() -> str:
    """Pick the CH340 adapter, falling back to the first /dev/ttyUSB*."""
    usb = sorted(glob.glob("/dev/ttyUSB*"))
    if not usb:
        raise SystemExit("error: no /dev/ttyUSB* device found (is the probe plugged in?)")
    for path in usb:
        if _vendor_id(path) == CH340_VENDOR_ID:
            return path
    return usb[0]


def read_channels(port, addr, first, count):
    out = []
    for reg in range(first, first + count):
        frame = bytes([addr, 0x03, (reg >> 8) & 0xFF, reg & 0xFF, 0x00, 0x01])
        frame += bytes([(crc16(frame)) & 0xFF, (crc16(frame)) >> 8])
        port.reset_input_buffer()
        port.write(frame)
        port.flush()
        time.sleep(0.15)
        try:
            resp = port.read(9) or b""
        except serial.SerialException:
            resp = b""
        if len(resp) >= 7 and resp[0] == addr and resp[1] == 0x03:
            raw = resp[3:5]
            temp, missing = decode_temp(raw)
            out.append((reg, raw, temp, missing))
        else:
            out.append((reg, resp, None, False))
    return out


def main():
    parser = argparse.ArgumentParser(description="Read the LES11-MC-Dx temperature sensor.")
    parser.add_argument("-d", "--device", default=DEFAULT_DEVICE,
                        help="serial device (default: auto-detect CH340)")
    parser.add_argument("-b", "--baud", type=int, default=DEFAULT_BAUD,
                        help="baud rate (default: %(default)s)")
    parser.add_argument("-a", "--addr", type=int, default=DEFAULT_ADDR,
                        help="Modbus device address (default: %(default)s)")
    parser.add_argument("-n", "--count", type=int, default=DEFAULT_COUNT,
                        help="number of channels to read starting at A1 (default: %(default)s)")
    parser.add_argument("--loop", type=float, metavar="SECONDS", default=0.0,
                        help="continuously poll, refreshing every SECONDS")
    args = parser.parse_args()

    device = detect_device() if args.device in (None, "", "auto") else args.device
    port = serial.Serial(device, args.baud, timeout=1)
    print(f"device={device} baud={args.baud} addr={args.addr}", file=sys.stderr)

    def poll():
        rows = read_channels(port, args.addr, 0, args.count)
        print(f"{'CH':<4}{'reg':<8}{'raw':<8}{'temp(C)':<12}note")
        for reg, raw, temp, missing in rows:
            if missing:
                print(f"A{reg + 1:<3}0x{reg:04X}   {0x7FFF:04X}     {'--':<12}no probe / fault")
            elif temp is None:
                print(f"A{reg + 1:<3}0x{reg:04X}   {'--':<8}{'--':<12}no/short reply: {raw.hex(' ')}")
            else:
                print(f"A{reg + 1:<3}0x{reg:04X}   {raw[0]:02X}{raw[1]:02X}     {temp:<12}")

    try:
        if args.loop > 0:
            while True:
                os.system("clear")
                poll()
                time.sleep(args.loop)
        else:
            poll()
    except KeyboardInterrupt:
        pass
    finally:
        port.close()


if __name__ == "__main__":
    main()
