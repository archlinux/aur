#!/usr/bin/env python3

import argparse
import json
import re
import subprocess
import sys
import urllib.request

PKGBUILD_FILE = "PKGBUILD"
SRCINFO_FILE = ".SRCINFO"
GITHUB_API_URL = "https://api.github.com/repos/DEEIX-AI/Winc/releases/latest"
REPO = "DEEIX-AI/Winc"


def fetch_text(url):
    request = urllib.request.Request(
        url,
        headers={"Accept": "application/vnd.github+json", "User-Agent": "winc-aur-helper"},
    )
    with urllib.request.urlopen(request, timeout=30) as response:
        return response.read().decode("utf-8")


def fetch_latest_release():
    tag = None
    try:
        data = json.loads(fetch_text(GITHUB_API_URL))
        tag = data.get("tag_name", "").strip()
    except Exception as exc:
        print(f"Warning: GitHub API unavailable ({exc}); using releases page fallback.")

    if not tag:
        try:
            releases_page = fetch_text(f"https://github.com/{REPO}/releases/latest")
            match = re.search(r"/releases/tag/(v?\d+\.\d+\.\d+(?:-\d+)?)", releases_page)
            if match:
                tag = match.group(1)
        except Exception as exc:
            print(f"Error fetching latest release page: {exc}")
            return None

    if not tag:
        print("Error: latest release tag not found.")
        return None

    version = tag.lstrip("v")
    match = re.fullmatch(r"(\d+\.\d+\.\d+)(?:-(\d+))?", version)
    if not match:
        print(f"Error: unexpected version format: {version}")
        return None
    sums_url = f"https://github.com/{REPO}/releases/download/{tag}/SHA256SUMS"
    return match.group(1), int(match.group(2) or 1), sums_url


def get_current_release():
    try:
        with open(PKGBUILD_FILE, "r", encoding="utf-8") as handle:
            content = handle.read()
        version = re.search(r"^pkgver=(\S+)", content, re.MULTILINE)
        pkgrel = re.search(r"^pkgrel=(\S+)", content, re.MULTILINE)
        if not version or not pkgrel:
            print("Error: pkgver or pkgrel not found in PKGBUILD.")
            return None
        return version.group(1), int(pkgrel.group(1))
    except Exception as exc:
        print(f"Unexpected error reading PKGBUILD: {exc}")
        return None


def get_upstream_sha256(version, pkgrel, sums_url):
    filename = f"winc-{version}-{pkgrel}-x86_64.pkg.tar.zst"
    try:
        sums = fetch_text(sums_url)
    except Exception as exc:
        print(f"Error fetching upstream SHA256SUMS: {exc}")
        return None
    for line in sums.splitlines():
        match = re.match(r"^([0-9a-fA-F]{64})\s+\*?(.+)$", line.strip())
        if match and match.group(2).strip() == filename:
            return match.group(1).lower()
    print(f"Error: {filename} not found in upstream SHA256SUMS.")
    return None


def update_pkgbuild(version, pkgrel, checksum):
    try:
        with open(PKGBUILD_FILE, "r", encoding="utf-8") as handle:
            content = handle.read()
        content = re.sub(r"^pkgver=.*", f"pkgver={version}", content, flags=re.MULTILINE)
        content = re.sub(r"^pkgrel=.*", f"pkgrel={pkgrel}", content, flags=re.MULTILINE)
        content = re.sub(
            r"^sha256sums_x86_64=\(.*\)$",
            f"sha256sums_x86_64=('{checksum}')",
            content,
            flags=re.MULTILINE,
        )
        with open(PKGBUILD_FILE, "w", encoding="utf-8") as handle:
            handle.write(content)
        return True
    except Exception as exc:
        print(f"Unexpected error updating PKGBUILD: {exc}")
        return False


def generate_srcinfo():
    result = subprocess.run(["makepkg", "--printsrcinfo"], capture_output=True, text=True)
    if result.returncode != 0:
        print(f"Error generating .SRCINFO: {result.stderr}")
        return False
    try:
        with open(SRCINFO_FILE, "w", encoding="utf-8") as handle:
            handle.write(result.stdout)
        return True
    except Exception as exc:
        print(f"Unexpected error writing {SRCINFO_FILE}: {exc}")
        return False


def commit_git(version, pkgrel):
    try:
        subprocess.run(["git", "add", PKGBUILD_FILE, SRCINFO_FILE], check=True)
        result = subprocess.run(["git", "diff", "--cached", "--quiet"])
        if result.returncode == 0:
            return False
        full_version = f"{version}-{pkgrel}" if pkgrel != 1 else version
        subprocess.run(["git", "commit", "-m", f"update to version {full_version}"], check=True)
        return True
    except subprocess.CalledProcessError as exc:
        print(f"Error during git operation: {exc}")
        return False


def main():
    parser = argparse.ArgumentParser(description="Update Winc AUR package.")
    parser.add_argument("--version", action="store_true", help="Fetch the latest GitHub release and upstream SHA256SUMS")
    parser.add_argument("--sums", action="store_true", help="Refresh checksum from upstream SHA256SUMS")
    parser.add_argument("--info", action="store_true", help="Generate .SRCINFO")
    parser.add_argument("--commit", action="store_true", help="Commit changes when updated")
    args = parser.parse_args()
    if not any(vars(args).values()):
        args.version = args.sums = args.info = args.commit = True

    latest = fetch_latest_release() if (args.version or args.sums) else None
    if (args.version or args.sums) and not latest:
        return 1

    if latest:
        version, pkgrel, sums_url = latest
    else:
        current = get_current_release()
        if not current:
            return 1
        version, pkgrel = current
        sums_url = f"https://github.com/{REPO}/releases/download/v{version}/SHA256SUMS"

    checksum = None
    if args.version or args.sums:
        checksum = get_upstream_sha256(version, pkgrel, sums_url)
        if not checksum:
            return 1

    updated = False
    if args.version:
        current = get_current_release()
        if current == (version, pkgrel):
            print(f"No update needed. Version is already {version}-{pkgrel}.")
        else:
            updated = update_pkgbuild(version, pkgrel, checksum)
            if not updated:
                return 1
    elif args.sums:
        updated = update_pkgbuild(version, pkgrel, checksum)
        if not updated:
            return 1

    if args.info and (updated or not (args.version or args.sums)):
        if not generate_srcinfo():
            return 1

    if args.commit and updated and not commit_git(version, pkgrel):
        return 1

    return 0


if __name__ == "__main__":
    sys.exit(main())