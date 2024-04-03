#!/usr/bin/env python
import re
import subprocess
import urllib.request
from pathlib import Path

URL_ALL_FILES_SHA512 = "http://perso.b2b2c.ca/~sarrazip/dev/sha512sums.txt"


def file_replace(filename, patternToReplace, replacementString):
    with open(filename, 'r+', encoding='utf-8') as f:
        file_content = f.read()
        new_content = re.sub(patternToReplace,replacementString,file_content)
        f.seek(0)
        f.truncate(0)
        f.write(new_content)


print(f"Load {URL_ALL_FILES_SHA512} content")
response = urllib.request.urlopen(URL_ALL_FILES_SHA512)
content = response.read().decode('utf-8')

print("Find last verbiste version and SHA512")
last_version = None
last_sha = None
for line in content.splitlines():
    try:
        sha, package = filter(None, line.split(" "))
    except ValueError:
        continue
    match = re.match("^(?P<pkg>.*?)-(?P<ver>(\d+\.)+\d+)(-\d)?(?P<ext>.*)$", package)
    if not match or match.group('pkg') != 'verbiste':
        continue
    if not last_version or last_version < match.group('ver'):
        last_version = match.group('ver')
        last_sha = sha

print(f"  -> Version: {last_version}")
print(f"  -> SHA512: {last_sha}")

if not last_version or not last_sha:
    print("Missing version or SHA")
    exit(1)


print("Get current version")
try:
    current_version = re.search(r"pkgver=(.*)", Path('PKGBUILD').read_text()).group(1)
except (AttributeError, IndexError):
    current_version = "0"
print(f"  -> Version: {current_version}")

if last_version <= current_version:
    print("No new version, stop here")
    exit(0)

print("Update PKGBUILD with new version and SHA")
file_replace('PKGBUILD', r"pkgver=.*", f"pkgver={last_version}")
file_replace('PKGBUILD', r"sha512sums=.*", f"sha512sums=('{last_sha}')")

print("Build .SRCINFO")
Path(".SRCINFO").write_bytes(subprocess.run(["makepkg", "--printsrcinfo"], capture_output=True).stdout)

print("Git commit")
subprocess.run(["git", "add", "PKGBUILD", ".SRCINFO"])
subprocess.run(["git", "commit", "-m", f"\"Update to {last_version}\""])


