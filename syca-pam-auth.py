#!/usr/bin/env python3
import sys
import termios
import tty
import pam
import os

def masked_input(prompt="[syca] password: "):
    sys.stdout.write(prompt)
    sys.stdout.flush()
    password = ""
    fd = sys.stdin.fileno()
    old = termios.tcgetattr(fd)
    try:
        tty.setcbreak(fd)
        while True:
            ch = sys.stdin.read(1)
            if ch in ("\n", "\r"):
                break
            if ch == "\x03":
                raise KeyboardInterrupt
            if ch == "\x7f":
                if password:
                    password = password[:-1]
                    sys.stdout.write("\b \b")
                    sys.stdout.flush()
            else:
                password += ch
                sys.stdout.write("*")
                sys.stdout.flush()
    finally:
        termios.tcsetattr(fd, termios.TCSADRAIN, old)
    print()
    return password

try:
    username = os.getlogin()
    password = masked_input("[syca] password: ")
    if pam.pam().authenticate(username, password, service="syca"):
        sys.exit(0)
    else:
        sys.exit(1)
except KeyboardInterrupt:
    # Exit silently; Ruby will handle "[syca] Command cancelled by user."
    sys.exit(1)
