#!/usr/bin/env python3

import hashlib
import json
import re
import subprocess
import sys
import urllib.request
import urllib.error
import shutil

REQUIRED_ASSET_NAME = "omp-linux-x64"


def fetch_json(url):
    req = urllib.request.Request(url, headers={"User-Agent": "oh-my-pi-aur-updater"})
    try:
        with urllib.request.urlopen(req) as response:
            return json.loads(response.read().decode("utf-8"))
    except urllib.error.URLError as e:
        print(f"Error fetching {url}: {e}", file=sys.stderr)
        sys.exit(1)


def fetch_bytes(url):
    req = urllib.request.Request(url, headers={"User-Agent": "oh-my-pi-aur-updater"})
    try:
        with urllib.request.urlopen(req) as response:
            return response.read()
    except urllib.error.URLError as e:
        print(f"Error fetching {url}: {e}", file=sys.stderr)
        sys.exit(1)


def normalize_sha256(digest):
    if digest.startswith("sha256:"):
        return digest[7:]
    return digest


def get_asset_sha256(assets, asset_name):
    for asset in assets:
        if asset.get("name") != asset_name:
            continue

        digest = normalize_sha256(asset.get("digest", ""))
        if digest:
            return digest

        print(
            f"Digest not found for {asset_name}, downloading asset to compute sha256..."
        )
        asset_bytes = fetch_bytes(asset.get("browser_download_url"))
        return hashlib.sha256(asset_bytes).hexdigest()

    print(f"Could not find {asset_name} asset or its digest", file=sys.stderr)
    sys.exit(1)


def format_sha256sums(values):
    lines = [f"sha256sums=('{values[0]}'"]
    lines.extend(f"            '{value}'" for value in values[1:])
    lines[-1] = f"{lines[-1]})"
    return "\n".join(lines)


def main():
    try:
        with open("PKGBUILD", "r") as f:
            content = f.read()
    except FileNotFoundError:
        print("PKGBUILD not found", file=sys.stderr)
        sys.exit(1)

    m = re.search(r"^pkgver=(\S+)", content, re.MULTILINE)
    if not m:
        print("Could not find pkgver in PKGBUILD", file=sys.stderr)
        sys.exit(1)

    current_ver = m.group(1)

    release_data = fetch_json(
        "https://api.github.com/repos/can1357/oh-my-pi/releases/latest"
    )
    tag_name = release_data.get("tag_name", "")
    if not tag_name.startswith("v"):
        print(f"Unexpected tag_name format: {tag_name}", file=sys.stderr)
        sys.exit(1)

    latest_ver = tag_name[1:]

    cur_tuple = tuple(int(x) for x in current_ver.split("."))
    lat_tuple = tuple(int(x) for x in latest_ver.split("."))

    if lat_tuple <= cur_tuple:
        print("already up to date")
        sys.exit(0)

    print(f"Update available: {current_ver} -> {latest_ver}")
    ans = input("Update? [y/N]: ")
    if ans.lower() != "y":
        print("Aborted.")
        sys.exit(0)

    assets = release_data.get("assets", [])
    binary_sha = get_asset_sha256(assets, REQUIRED_ASSET_NAME)

    license_bytes = fetch_bytes(
        f"https://raw.githubusercontent.com/can1357/oh-my-pi/v{latest_ver}/LICENSE"
    )
    license_sha = hashlib.sha256(license_bytes).hexdigest()
    sha256sums = [binary_sha, license_sha]

    content = re.sub(
        r"^pkgver=\S+", f"pkgver={latest_ver}", content, flags=re.MULTILINE
    )
    content = re.sub(r"^pkgrel=\S+", "pkgrel=1", content, flags=re.MULTILINE)

    content, replaced = re.subn(
        r"sha256sums=\((?:\s*'[0-9a-f]+'\s*)+\)",
        format_sha256sums(sha256sums),
        content,
        count=1,
    )
    if replaced != 1:
        print("Could not find sha256sums array in PKGBUILD", file=sys.stderr)
        sys.exit(1)

    with open("PKGBUILD", "w") as f:
        f.write(content)

    print("PKGBUILD updated.")

    if not shutil.which("makepkg"):
        print(
            "makepkg not found, cannot proceed with verification and .SRCINFO generation",
            file=sys.stderr,
        )
        sys.exit(1)

    try:
        # Generate .SRCINFO
        print("Generating .SRCINFO...")
        res = subprocess.run(
            ["makepkg", "--printsrcinfo"],
            capture_output=True,
            text=True,
            check=True,
        )
        with open(".SRCINFO", "w") as f:
            f.write(res.stdout)
        print(".SRCINFO generated.")

        print("Verifying build with makepkg...")
        subprocess.run(["makepkg", "-Cf"], check=True)

        print("\nDiffing changes:")
        subprocess.run(["git", "diff", "PKGBUILD", ".SRCINFO"])

        ans = input("\nLooks good? [y/N]: ")
        if ans.lower() not in ["y", "yes"]:
            print("Aborted.")
            sys.exit(0)

        print("Staging changes...")
        subprocess.run(["git", "add", "PKGBUILD", ".SRCINFO"], check=True)

        print(f"Committing version {latest_ver}...")
        subprocess.run(
            ["git", "commit", "-m", f"upstream release: {latest_ver}"], check=True
        )

        print("Pushing to origin...")
        subprocess.run(["git", "push", "origin"], check=True)

        print("Success.")
    except subprocess.CalledProcessError as e:
        print(f"Command failed: {e}", file=sys.stderr)
        sys.exit(1)
    except Exception as e:
        print(f"An unexpected error occurred: {e}", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
