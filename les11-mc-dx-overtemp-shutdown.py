#!/usr/bin/env python3
"""les11-mc-dx-overtemp-shutdown monitor.

Watches one or more LES11-MC-Dx USB temperature sensors (Modbus RTU) and, when
any watched channel stays above ``max_temp_c`` for ``hold_readings`` consecutive
polls, runs the configured shutdown command. Missing/faulted probes (0x7FFF) are
logged but never counted as over-temperature unless ``fail_on_missing`` is set.

Co-designed with the reader in les11-mc-dx-temperature-reader; both share the
same Modbus framing and value decoding.
"""
import argparse
import glob
import logging
import os
import shlex
import subprocess
import sys
import time
import tomllib

try:
    import serial
except ImportError:
    sys.exit("error: python-pyserial is required (pacman -S python-pyserial)")

CH340_VENDOR_ID = "1a86"
MISSING_CODE = 0x7FFF
DEFAULT_CONFIG = "/etc/les11-mc-dx-overtemp-shutdown/config.toml"

log = logging.getLogger("les11-overtemp")


def crc16(data: bytes) -> int:
    crc = 0xFFFF
    for b in data:
        crc ^= b
        for _ in range(8):
            crc = (crc >> 1) ^ 0xA001 if crc & 1 else crc >> 1
    return crc


def decode_temp(raw: bytes):
    """Return (temperature_or_None, is_missing) for a 2-byte big-endian field."""
    value = (raw[0] << 8) | raw[1]
    if value == MISSING_CODE:
        return None, True
    if value & 0x8000:
        value -= 0x10000
    return value / 10.0, False


def vendor_id(path: str) -> str:
    link = "/sys/bus/usb-serial/devices/" + os.path.basename(path)
    try:
        dev = os.path.dirname(os.path.dirname(os.path.realpath(link)))
        with open(os.path.join(dev, "idVendor")) as fh:
            return fh.read().strip()
    except OSError:
        return ""


def resolve_devices(spec) -> list[str]:
    if not isinstance(spec, list) or not spec:
        raise ValueError("devices must be a non-empty list")
    out = []
    for item in spec:
        if item == "auto":
            # Only the CH340 adapter is a genuine LES11-MC-Dx; never auto-poll
            # unrelated USB-serial devices, whose noise could decode to a false
            # high temperature and trigger a spurious shutdown.
            out.extend(p for p in sorted(glob.glob("/dev/ttyUSB*"))
                       if vendor_id(p) == CH340_VENDOR_ID)
        else:
            out.append(item)
    if not out:
        raise SystemExit("error: no CH340 (1a86) device resolved; "
                         "check wiring or list explicit devices in config")
    # de-duplicate while preserving order (handles multiple "auto" entries)
    seen = set()
    uniq = []
    for d in out:
        if d not in seen:
            seen.add(d)
            uniq.append(d)
    return uniq


def load_config(path: str) -> dict:
    with open(path, "rb") as fh:
        cfg = tomllib.load(fh)
    cfg.setdefault("max_temp_c", 60.0)
    cfg.setdefault("hold_readings", 3)
    cfg.setdefault("poll_interval_s", 10.0)
    cfg.setdefault("shutdown_command", "systemctl poweroff")
    cfg.setdefault("devices", ["auto"])
    cfg.setdefault("baud", 9600)
    cfg.setdefault("addr", 1)
    cfg.setdefault("channels", 6)
    cfg.setdefault("ignore_channels", [])
    cfg.setdefault("fail_on_missing", False)
    cfg.setdefault("log_level", "info")
    cfg["ignore_channels"] = sorted({int(c) for c in cfg["ignore_channels"]})
    if cfg["hold_readings"] < 1:
        raise ValueError("hold_readings must be >= 1")
    if cfg["poll_interval_s"] <= 0:
        raise ValueError("poll_interval_s must be > 0")
    return cfg


def read_channel(port, addr: int, reg: int):
    frame = bytes([addr, 0x03, (reg >> 8) & 0xFF, reg & 0xFF, 0x00, 0x01])
    frame += bytes([crc16(frame) & 0xFF, crc16(frame) >> 8])
    port.reset_input_buffer()
    port.write(frame)
    port.flush()
    time.sleep(0.15)
    try:
        resp = port.read(9) or b""
    except serial.SerialException:
        resp = b""
    if len(resp) >= 7 and resp[0] == addr and resp[1] == 0x03:
        return decode_temp(resp[3:5])
    return None, False


def main():
    ap = argparse.ArgumentParser(description="LES11-MC-Dx over-temperature shutdown monitor")
    ap.add_argument("-c", "--config", default=DEFAULT_CONFIG, help="config file (default: %(default)s)")
    ap.add_argument("--dry-run", action="store_true",
                    help="log what would happen but do not execute the shutdown command")
    ap.add_argument("--once", action="store_true",
                    help="run a single poll cycle and exit (for testing)")
    args = ap.parse_args()

    cfg = load_config(args.config)
    level = getattr(logging, str(cfg["log_level"]).upper(), logging.INFO)
    logging.basicConfig(level=level, format="%(asctime)s %(levelname)s %(message)s")

    devices = resolve_devices(cfg["devices"])
    max_t = float(cfg["max_temp_c"])
    hold = int(cfg["hold_readings"])
    ignore = set(cfg["ignore_channels"])
    action = shlex.split(str(cfg["shutdown_command"]))
    log.info("config=%s devices=%s max_temp_c=%.1f hold_readings=%d action=%s dry_run=%s",
             args.config, devices, max_t, hold, cfg["shutdown_command"], args.dry_run)

    consecutive = {}          # (device, channel) -> run length above threshold
    triggered = set()         # (device, channel) already acted on
    last_shutdown = 0.0

    def do_shutdown(device: str, channel: int, temp: float):
        nonlocal last_shutdown
        log.critical("OVER-TEMP on %s A%d: %.1f C > %.1f C for %d reads -> executing shutdown",
                     device, channel, temp, max_t, hold)
        if args.dry_run:
            log.info("dry-run: would run %r", action)
            return
        try:
            res = subprocess.run(action, capture_output=True, text=True, timeout=30)
            log.info("shutdown cmd rc=%s stdout=%r stderr=%r",
                     res.returncode, res.stdout.strip(), res.stderr.strip())
        except Exception as e:  # noqa: BLE001
            log.exception("shutdown command failed: %s", e)
        last_shutdown = time.monotonic()

    while True:
        for device in devices:
            try:
                port = serial.Serial(device, int(cfg["baud"]), timeout=1)
            except Exception as e:  # noqa: BLE001
                log.warning("%s: open failed: %s", device, e)
                continue
            try:
                readings = {}
                for chan in range(1, int(cfg["channels"]) + 1):
                    if chan in ignore:
                        continue
                    temp, missing = read_channel(port, int(cfg["addr"]), chan - 1)
                    key = (device, chan)
                    if missing:
                        readings[chan] = None
                        if cfg["fail_on_missing"]:
                            log.warning("%s A%d: probe missing/faulted (0x7FFF)", device, chan)
                            consecutive[key] = 0
                            if time.monotonic() - last_shutdown > 60:
                                do_shutdown(device, chan, float("inf"))
                        else:
                            log.debug("%s A%d: probe missing/faulted (0x7FFF)", device, chan)
                            consecutive[key] = 0
                        continue
                    if temp is None:
                        readings[chan] = None
                        log.warning("%s A%d: no/short reply", device, chan)
                        consecutive[key] = 0
                        continue
                    readings[chan] = temp
                    if temp > max_t:
                        consecutive[key] = consecutive.get(key, 0) + 1
                        log.warning("%s A%d: %.1f℃ > %.1f℃ (%d/%d)",
                                    device, chan, temp, max_t, consecutive[key], hold)
                        if consecutive[key] >= hold and key not in triggered:
                            triggered.add(key)
                            do_shutdown(device, chan, temp)
                    else:
                        if consecutive.get(key, 0):
                            log.info("%s A%d: %.1f℃ back to normal", device, chan, temp)
                        consecutive[key] = 0
                        triggered.discard(key)
                # heartbeat: one concise line per device per cycle so the journal
                # always shows what the probes read, not just when they trip.
                summary = ", ".join(
                    f"A{c}={'--' if readings.get(c) is None else f'{readings[c]:.1f}℃'}"
                    for c in range(1, int(cfg["channels"]) + 1) if c not in ignore)
                log.info("%s readings: %s", device, summary)
            finally:
                port.close()

        if args.once:
            return
        # cooldown so a failed/pending shutdown is not re-issued in a tight loop
        time.sleep(max(cfg["poll_interval_s"], 60.0 - (time.monotonic() - last_shutdown)))


if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        pass
