#!/usr/bin/env python3
import os
import sys
import termios
import tty
import pam

def masked_input(prompt="[syca] password: "):
    # Open the terminal directly
    fd = os.open("/dev/tty", os.O_RDWR)
    old = termios.tcgetattr(fd)
    password = ""
    try:
        tty.setcbreak(fd)
        os.write(fd, prompt.encode())
        while True:
            ch = os.read(fd, 1)
            if ch in (b"\n", b"\r"):
                break
            if ch == b"\x03":  # Ctrl-C
                raise KeyboardInterrupt
            if ch == b"\x7f":  # Backspace
                if password:
                    password = password[:-1]
                    os.write(fd, b"\b \b")
            else:
                password += ch.decode("utf-8")
                os.write(fd, b"*")
    finally:
        termios.tcsetattr(fd, termios.TCSADRAIN, old)
        os.close(fd)
    os.write(sys.stdout.fileno(), b"\n")
    return password

try:
    username = os.getlogin()
    password = masked_input("[syca] password: ")
    if pam.pam().authenticate(username, password, service="syca"):
        sys.exit(0)
    else:
        sys.exit(1)
except KeyboardInterrupt:
    sys.exit(1)
