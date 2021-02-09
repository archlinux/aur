#!/usr/bin/env python3

import sys
from argparse import ArgumentParser
from getpass import getpass
from hashlib import pbkdf2_hmac
from signal import signal, SIGINT

def die(*_, **__):
    sys.exit()

signal = signal(SIGINT, die)

iwd = """[Security]
PreSharedKey={psk}"""

supplicant = """network={{
    ssid={ssid}
    #psk={passphrase}
    psk={psk}
}}"""

parser = ArgumentParser(
    description="%(prog)s pre-computes PSK entries for network configuration blocks of wpa_supplicant or iwd config. An ASCII passphrase and SSID are used to generate a 256-bit PSK."
)
parser.add_argument("ssid", help="The SSID whose passphrase should be derived.")
parser.add_argument(
    "passphrase",
    help="The passphrase to use. If not included on the command line, passphrase will be read from standard input.",
    nargs="?",
)
parser.add_argument(
    "--iwd",
    "-i",
    dest="template",
    action="store_const",
    const=iwd,
    default=supplicant,
    help="Generate for iwd (default: generate for wpa_supplicant).",
)
args = parser.parse_args()

if not args.passphrase:
    print("# reading passphrase from stdin", file=sys.stderr)
    args.passphrase = getpass(prompt="")
if not 8 <= len(args.passphrase) <= 63:
    print("Passphrase must be 8..63 characters", file=sys.stderr)
    sys.exit(1)
passphrase = args.passphrase.encode()
if any(b < 32 or b == 127 for b in passphrase):
    print("Invalid passphrase character", file=sys.stderr)
    sys.exit(1)

ssid = args.ssid.encode()
psk = pbkdf2_hmac("sha1", passphrase, ssid, iterations=4096, dklen=32)
print(args.template.format(ssid=args.ssid, passphrase=args.passphrase, psk=psk.hex()))
