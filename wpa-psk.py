#!/usr/bin/env python3

import sys
from argparse import ArgumentParser
from getpass import getpass
from hashlib import pbkdf2_hmac

parser = ArgumentParser(
    description="%(prog)s pre-computes PSK entries for network configuration blocks of a wpa_supplicant.conf file. An ASCII passphrase and SSID are used to generate a 256-bit PSK."
)
parser.add_argument("ssid", help="The SSID whose passphrase should be derived.")
parser.add_argument(
    "passphrase",
    help="The passphrase to use. If not included on the command line, passphrase will be read from standard input.",
    nargs="?",
)
args = parser.parse_args()

if not args.passphrase:
    print("# reading passphrase from stdin")
    args.passphrase = getpass(prompt="")

if not 8 <= len(args.passphrase) <= 63:
    print("Passphrase must be 8..63 characters")
    sys.exit(1)
args.ssid.encode()
passphrase = args.passphrase.encode()
if any(b < 32 or b == 127 for b in passphrase):
    print("Invalid passphrase character")
    sys.exit(1)

ssid = args.ssid.encode()
psk = pbkdf2_hmac("sha1", passphrase, ssid, iterations=4096, dklen=32)
print(
    "network={",
    f'\tssid="{args.ssid}"',
    f'\t#psk="{args.passphrase}"',
    f"\tpsk={psk.hex()}",
    "}",
    sep="\n",
)
