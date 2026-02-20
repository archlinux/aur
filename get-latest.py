#!/usr/bin/env python3
import requests
from bs4 import BeautifulSoup
import subprocess
# from urllib.request import urlretrieve
# import hashlib


url = "https://files.openscad.org/snapshots/"
BEG = "OpenSCAD-"
END = "-x86_64.AppImage"
HSH = ".sha256"

resp = requests.get(url)
resp.raise_for_status()
soup = BeautifulSoup(resp.text, "html.parser")
result = [text for row in soup.find_all("a") if (text := row.get_text()).endswith(END)]

newest = result[-1]
pkgver = newest.split(BEG)[1].split(END)[0]

resp = requests.get(url + newest + HSH)
resp.raise_for_status()
sha256, filename = resp.text.split(" ", maxsplit=1)
assert newest == filename.strip()

# urlretrieve(url + newest, newest)
# with open(newest, 'rb', buffering=0) as f:
#     hsh_computed = hashlib.file_digest(f, 'sha256').hexdigest()
# assert hsh == hsh_computed

with open("PKGBUILD", "r") as f:
    lines = f.readlines()

lines2 = []
for i, line in enumerate(lines):
    if line.startswith("pkgver="):
        line = f"pkgver={pkgver}\n"
    elif i and lines[i-1].strip() == "sha256sums=(":
        line = f"  '{sha256}'\n"
    elif line.startswith("pkgrel=") and line.strip().split("=", 1)[1] != "1":
        print("Warning! pkgrel is not 1")
    elif i+1 == len(lines) and line.strip() == "":
        continue
    lines2.append(line)

with open("PKGBUILD", "w") as f:
    print("".join(lines2), file=f)

out = subprocess.check_output(["makepkg", "--printsrcinfo"]).decode()

with open(".SRCINFO", "w") as f:
    print(out, file=f)
