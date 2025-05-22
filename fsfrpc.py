#!/usr/bin/env python
# GNU General Public License 3.0

from time import sleep
import pypresence
import subprocess
import re
from collections import namedtuple
from shutil import which
from signal import signal, SIGTERM, SIGINT
import argparse

import pypresence.payloads

# check for absolutely-proprietary
checktool: str | None = which("absolutely-proprietary")
if checktool is None:
    print("error: could not find absolutely-proprietary")
    exit(1)

OS_ID = "generic"
OS_PRETTYNAME = "GNU/Linux"

RPC: pypresence.Presence | None = None

ALLOWED_IDS = ["debian", "linuxmint", "arch",
               "opensuse", "ubuntu", "fedora", "generic"]

rpc_clientid = "1375008247425142814"
interval = 10
parse_os = True
verbose = 0


def osinfo():
    global OS_ID
    global OS_PRETTYNAME
    global ALLOWED_IDS
    try:
        with open("/etc/os-release") as f:
            while True:
                line = f.readline()
                if line == '':
                    break
                split = line.split('=')
                if len(split) != 2:
                    continue
                if split[0] == "ID" and OS_ID == "generic":
                    stripped = split[1].strip("\n ")
                    if stripped in ALLOWED_IDS:
                        if verbose > 1:
                            print(f"- OS ID: {stripped}")
                        OS_ID = stripped
                if split[0] == "PRETTY_NAME" and OS_PRETTYNAME == "GNU/Linux":
                    stripped = split[1].strip("\" \n")
                    if verbose > 1:
                        print(f"- OS pretty name: {stripped}")
                    OS_PRETTYNAME = stripped
    except Exception as e:
        print(f"warn: failed to parse os data: {e}")


### ARGS ###


def parse_args():
    global interval
    global rpc_clientid
    global parse_os
    global verbose
    global OS_PRETTYNAME
    global OS_ID
    parser = argparse.ArgumentParser(
        prog="fsfrpc",
        description="dynamically update discord rich presence with proprietary package status"
    )
    parser.add_argument("-i", "--interval", help="update interval",
                        type=int, default=interval, required=False)
    parser.add_argument("-c", "--client", help="discord application client id",
                        type=str, default=rpc_clientid, required=False)
    parser.add_argument("-o", "--no-parse-os", help="do not parse os information (use generic branding)",
                        action="store_false", required=False)
    parser.add_argument("-n", "--name", help="pretty name of the distro",
                        type=str, default=OS_PRETTYNAME, required=False)
    parser.add_argument("-p", "--icon", help="distro icon (same as the ID in /etc/os-release)",
                        type=str, default=OS_ID, required=False, choices=ALLOWED_IDS)
    parser.add_argument("-v", "--verbose", help="detailed output, use twice for even more detailed output",
                        action="count", required=False)
    args = parser.parse_args()
    interval = args.interval or interval
    rpc_clientid = args.client or rpc_clientid
    parse_os = args.no_parse_os  # confusing but it works
    verbose = args.verbose or 0
    OS_PRETTYNAME = args.name or OS_PRETTYNAME
    OS_ID = args.icon or OS_ID


###      ###


def handle_SIGTERM(_, __):
    global RPC
    print("* Stopping...")
    RPC.close()
    exit(0)


signal(SIGTERM, handle_SIGTERM)
signal(SIGINT, handle_SIGTERM)

# ! this might change with a new release of absolutely-proprietary
# also we're doing raw regex :(
PKGCOUNT_TEMPLATE = r"^Your GNU/Linux is infected with ([0-9]+) proprietary packages out of ([0-9]+) total installed.$"
# https://stackoverflow.com/questions/12643009/regular-expression-for-floating-point-numbers
FREEDOM_INDEX_TEMPLATE = r"^Your Stallman Freedom Index is ([+-]?([0-9]*[.])?[0-9]+)$"

SoftwareInfo = namedtuple(
    "SoftwareInfo", ["pkg_nonfree", "pkg_total", "freedom_index"])


def getinfo() -> SoftwareInfo:
    try:
        sp = subprocess.run([checktool], input="n\n",  # absolutely-proprietary always asks whether to save to file, so this simulates rejecting to avoid hangs
                            capture_output=True, text=True)
        pkgcount_match = re.search(
            PKGCOUNT_TEMPLATE, sp.stdout, re.MULTILINE)
        index_match = re.search(FREEDOM_INDEX_TEMPLATE,
                                sp.stdout, re.MULTILINE)

        if not pkgcount_match or not index_match:
            print("error: couldn't match template and output")
            exit(1)

        return SoftwareInfo(int(pkgcount_match.group(1)), int(pkgcount_match.group(2)), float(index_match.group(1)))
    except KeyboardInterrupt:
        pass
    except Exception as e:
        print(f"error: failed to get package info: {e}")
        exit(1)


if __name__ == "__main__":
    parse_args()
    if parse_os:
        osinfo()
    print("* Connecting to Discord...")
    if verbose > 0:
        print(f"- Client ID: {rpc_clientid}")
    RPC = pypresence.Presence(rpc_clientid)
    try:
        RPC.connect()
    except pypresence.DiscordNotFound:
        print("error: discord is not open!")
        exit(1)
    except Exception as e:
        print(f"error: failed to connect to discord: {e}")
        exit(1)
    print("* Connected!")
    while True:
        if verbose > 0:
            print("- Updating...")
        info: SoftwareInfo = getinfo()
        if verbose > 0:
            print(
                f"- Packages nonfree: {info.pkg_nonfree}; Packages total: {info.pkg_total}; Freedom Index: {info.freedom_index}")
        response = RPC.update(
            state=f"{info.pkg_nonfree}/{info.pkg_total} ({(100.0 - info.freedom_index):.2f}%) nonfree packages",
            large_image=OS_ID,
            large_text=OS_PRETTYNAME,
            details=OS_PRETTYNAME,
        )
        if verbose > 1:
            print(f"- RPC request: {response}")
        sleep(interval)
