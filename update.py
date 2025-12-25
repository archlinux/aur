#!/usr/bin/env python3
#                  _       _
#  _   _ _ __   __| | __ _| |_ ___   _ __  _   _
# | | | | '_ \ / _` |/ _` | __/ _ \ | '_ \| | | |
# | |_| | |_) | (_| | (_| | ||  __/_| |_) | |_| |
#  \__,_| .__/ \__,_|\__,_|\__\___(_) .__/ \__, |
#       |_|                         |_|    |___/
#

import argparse
from pathlib import Path
import hashlib
import re
import sys
import urllib.request

parser = argparse.ArgumentParser(description="Update AUR package version and checksum.")
parser.add_argument("new_version", help="New version like 1.1.2")
parser.add_argument(
    "--dir",
    default=Path(__file__).parent,
    help="Directory containing PKGBUILD and .SRCINFO (default: script dir)",
)
args = parser.parse_args()


def url_get(url: str) -> bytes:
    print(f"Fetching {url}...", file=sys.stderr)
    with urllib.request.urlopen(url, timeout=30) as response:
        return response.read()


def sha256_of_remote_resource(remote_url: str) -> str:
    return hashlib.sha256(url_get(remote_url)).hexdigest()


def update_pkgbuild(path: Path, new_ver: str, new_sha: str):
    text = path.read_text(encoding="utf-8")
    text = re.sub(r"(?m)^pkgver=.*$", f"pkgver={new_ver}", text)
    text = re.sub(r"(?m)^pkgrel=.*$", "pkgrel=1", text)

    source_pattern = r"source=\(.*\)"
    new_source = (
        'source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")'
    )
    text = re.sub(source_pattern, new_source, text)

    # Update or Add sha256sums
    if "sha256sums=" in text:
        text = re.sub(r"(?m)^sha256sums=\(.*\)$", f"sha256sums=('{new_sha}')", text)
    else:
        text = text.replace(new_source, f"{new_source}\nsha256sums=('{new_sha}')")

    # Remove git from makedepends if it exists
    text = text.replace("'git'", "").replace('"git"', "").replace("  ", " ")

    path.write_text(text, encoding="utf-8")


def update_srcinfo(path: Path, new_ver: str, new_sha: str, repo: str, pkgname: str):
    text = path.read_text(encoding="utf-8")
    text = re.sub(r"(?m)^(\s*)pkgver\s*=\s*.*$", rf"\1pkgver = {new_ver}", text)
    text = re.sub(r"(?m)^(\s*)pkgrel\s*=\s*.*$", rf"\1pkgrel = 1", text)

    new_src_line = f"source = {pkgname}-{new_ver}.tar.gz::{repo}/archive/refs/tags/v{new_ver}.tar.gz"
    text = re.sub(r"(?m)^(\s*)source\s*=\s*.*$", rf"\1{new_src_line}", text)

    # Update or Insert sha256sums
    if "sha256sums =" in text:
        text = re.sub(
            r"(?m)^(\s*)sha256sums\s*=\s*.*$", rf"\1sha256sums = {new_sha}", text
        )
    else:
        text = re.sub(
            rf"(?m)^(\s*){re.escape(new_src_line)}$",
            rf"\1{new_src_line}\n\1sha256sums = {new_sha}",
            text,
        )

    path.write_text(text, encoding="utf-8")


def main():
    root = Path(args.dir)
    pkgname = "cheeseburger"
    repo = "https://github.com/lov3b/cheeseburger"

    new_ver = args.new_version.strip()
    tar_url = f"{repo}/archive/refs/tags/v{new_ver}.tar.gz"

    try:
        new_sha = sha256_of_remote_resource(tar_url)
    except Exception as e:
        print(f"Error: Could not download {tar_url}\n{e}")
        sys.exit(1)

    update_pkgbuild(root / "PKGBUILD", new_ver, new_sha)
    update_srcinfo(root / ".SRCINFO", new_ver, new_sha, repo, pkgname)

    print(f"Done! Updated to {new_ver} with SHA {new_sha[:8]}...")


if __name__ == "__main__":
    main()
