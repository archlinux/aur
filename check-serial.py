"""Smoke test of libSystem.IO.Ports.Native: drive a pseudo-terminal like System.IO.Ports drives a serial port."""

import ctypes
import os
import sys

lib = ctypes.CDLL(sys.argv[1])
lib.SystemIoPortsNative_SerialPortOpen.restype = ctypes.c_ssize_t
lib.SystemIoPortsNative_SerialPortOpen.argtypes = [ctypes.c_char_p]
for name in ("SerialPortClose", "TermiosGetSpeed", "TermiosDrain"):
    getattr(lib, f"SystemIoPortsNative_{name}").argtypes = [ctypes.c_ssize_t]
lib.SystemIoPortsNative_TermiosReset.argtypes = [ctypes.c_ssize_t] + [
    ctypes.c_int32
] * 5
lib.SystemIoPortsNative_Write.argtypes = [
    ctypes.c_ssize_t,
    ctypes.c_char_p,
    ctypes.c_int32,
]
lib.SystemIoPortsNative_Read.argtypes = [
    ctypes.c_ssize_t,
    ctypes.c_char_p,
    ctypes.c_int32,
]

master, slave = os.openpty()
fd = lib.SystemIoPortsNative_SerialPortOpen(os.ttyname(slave).encode())
assert fd >= 0, f"SerialPortOpen failed: {fd}"

# 9600 baud, 8 data bits, one stop bit, no parity, no handshake, as SerialPort's defaults
assert lib.SystemIoPortsNative_TermiosReset(fd, 9600, 8, 1, 0, 0) == 0, (
    "TermiosReset failed"
)
speed = lib.SystemIoPortsNative_TermiosGetSpeed(fd)
assert speed == 9600, f"TermiosGetSpeed returned {speed}"

message = b"hello serial"
assert lib.SystemIoPortsNative_Write(fd, message, len(message)) == len(message), (
    "Write failed"
)
assert lib.SystemIoPortsNative_TermiosDrain(fd) == 0, "TermiosDrain failed"
assert os.read(master, 100) == message, "data written to the port didn't arrive"

os.write(master, message)
buffer = ctypes.create_string_buffer(100)
read = lib.SystemIoPortsNative_Read(fd, buffer, len(buffer))
assert buffer.raw[:read] == message, f"read {buffer.raw[:read]!r} from the port"

assert lib.SystemIoPortsNative_SerialPortClose(fd) == 0, "SerialPortClose failed"
print("libSystem.IO.Ports.Native works")
