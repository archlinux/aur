#!/usr/bin/env python3
# coding: utf-8
# SPDX-License-Identifier: Apache-2.0

"""
Update PKGBUILD from the Multiviewer release API.

So easy, you can update the package (almost) in your sleep!

:author: AntiCompositeNumber
"""

import argparse
import requests
import subprocess
import re
import sys


def get_download_data() -> tuple[str, str]:
    download_page_url = "https://api.multiviewer.dev/api/v1/releases/latest"
    r = requests.get(download_page_url)
    r.raise_for_status()

    data = r.json()
    url = next(
        release for release in data["downloads"] if release["platform"] == "linux"
    )["url"]
    assert "linux-x64" in url
    assert url.endswith(".zip")
    return url, data["version"]


def check_version(version: str) -> None:
    with open("PKGBUILD") as f:
        pkgbuild = f.read()
        old_version = re.search(r"pkgver=(.*)$", pkgbuild, re.MULTILINE)

    assert old_version is not None
    vercmp = subprocess.run(
        ["vercmp", old_version[1], version], capture_output=True, check=True
    )
    if vercmp.stdout.startswith(b"-"):
        return
    else:
        sys.exit(f"Version {old_version[1]} is already up to date.")


def update_pkgbuild(url: str, version: str) -> None:
    with open("PKGBUILD", "r") as f:
        pkgbuild = f.read()
        # This part is brittle.
        pkgbuild, subs = re.subn(
            r"https://releases\.multiviewer\.\w+/download/\d+/MultiViewer.for.F1-linux-x64-.*?.zip",
            url,
            pkgbuild,
            flags=re.MULTILINE,
        )
        assert subs == 1
        pkgbuild = re.sub(
            r"pkgver=.*$", f"pkgver={version}", pkgbuild, flags=re.MULTILINE, count=1
        )
        pkgbuild = re.sub(
            r"pkgrel=.*$", "pkgrel=1", pkgbuild, flags=re.MULTILINE, count=1
        )
    with open("PKGBUILD", "w") as f:
        f.write(pkgbuild)


def main(argv):
    parser = argparse.ArgumentParser(
        description="Automatically update the version and download URL for the f1multiviewer-bin PKGBUIILD"
    )
    parser.add_argument(
        "-i", "--install", action="store_true", help="Install built package locally"
    )
    parser.add_argument(
        "-c",
        "--commit",
        action="store_true",
        help="Commit PKGBUILD changes to Git with an automatic commit message",
    )
    args = parser.parse_args(argv)

    url, version = get_download_data()
    print(f"Found v{version} at {url}")
    check_version(version)
    if input("Update PKGBUILD? [Y/n] ").lower() == "n":
        sys.exit(1)
    update_pkgbuild(url, version)
    subprocess.run("updpkgsums", check=True)
    subprocess.run("makepkg --printsrcinfo > .SRCINFO", shell=True, check=True)
    if args.install or input("Install new version? [Y/n]").lower() != "n":
        subprocess.run(["makepkg", "-i", "--clean"], check=True)
    else:
        subprocess.run(["makepkg", "--clean"], check=True)
    if args.commit or input("Commit changes? [Y/n]").lower() != "n":
        subprocess.run(
            ["git", "commit", "PKGBUILD", ".SRCINFO", "-m", version], check=True
        )
    else:
        subprocess.run(["git", "add", "PKGBUILD", ".SRCINFO"], check=True)
    print(
        "Update complete. Please verify PKGBUILD, commit any additional changes, and push to AUR."
    )


if __name__ == "__main__":
    main(sys.argv[1:])
