#!/usr/bin/env python3
#                  _       _
#  _   _ _ __   __| | __ _| |_ ___   _ __  _   _
# | | | | '_ \ / _` |/ _` | __/ _ \ | '_ \| | | |
# | |_| | |_) | (_| | (_| | ||  __/_| |_) | |_| |
#  \__,_| .__/ \__,_|\__,_|\__\___(_) .__/ \__, |
#       |_|                         |_|    |___/
#

## Make sure that we catch this error fast
try:
    import requests
except ImportError:
    import sys

    sys.exit("Please install requests: pacman -S python-requests")


## Check the arguments before iterpreting the rest of the script
## and before sourcing other stuff.
import argparse
from pathlib import Path

parser = argparse.ArgumentParser(description="Update AUR package version and checksum.")
parser.add_argument("new_version", help="New version like 1.0.0")
parser.add_argument(
    "--dir",
    default=Path(__file__).parent,
    help="Directory containing PKGBUILD and .SRCINFO (default: script dir)",
)
args = parser.parse_args()

import hashlib
import re
import sys


class SourceInfoReader:
    def __init__(self, root: Path):
        with (root / ".SRCINFO").open("r") as f:
            self.content = f.read()

    def get(self, field: str) -> str:
        match = re.search(rf"(?m)^\s*{re.escape(field)}\s*=\s*(.+?)\s*$", self.content)
        if not match:
            raise KeyError(f"{field} not found")
        return match.group(1).strip()


def sha256_of_remote_resource(remote_url: str) -> str:
    request = requests.get(remote_url, timeout=30)
    request.raise_for_status()
    return hashlib.sha256(request.content).hexdigest()


def update_file(path: Path, substitutions: list[tuple[re.Pattern, str]]):
    text = path.read_text(encoding="utf-8")
    for pattern, replacement in substitutions:
        text = pattern.sub(replacement, text)
    path.write_text(text, encoding="utf-8")


def main():
    root = Path(args.dir)
    sir = SourceInfoReader(root)
    package = sir.get("pkgname")
    repository = sir.get("url")

    package_version_line = re.compile(r"(?m)^(?P<prefix>\s*pkgver\s*=\s*)[^\n]+$")
    new_version = args.new_version.strip()
    tar_name = f"{package}-{new_version}.tar.gz"
    tar_url = f"{repository}/archive/refs/tags/v{new_version}.tar.gz"

    print(f"Fetching {tar_url} ...", file=sys.stderr)
    new_sha = sha256_of_remote_resource(tar_url)
    print(f"SHA256: {new_sha}", file=sys.stderr)

    pkgbuild = root / "PKGBUILD"
    assert pkgbuild.exists()
    update_file(
        pkgbuild,
        [
            (package_version_line, rf"\g<prefix>{new_version}"),
            (
                re.compile(r"(?ms)^(?P<prefix>sha256sums\s*=\s*)\([^)]+\)"),
                r"\g<prefix>('{}')".format(new_sha),
            ),
            (re.compile(rf"(?m){re.escape(package)}-\d+\.\d+\.\d+\.tar\.gz"), tar_name),
            (re.compile(r"(?m)/v\d+\.\d+\.\d+\.tar\.gz"), f"/v{new_version}.tar.gz"),
        ],
    )

    srcinfo = root / ".SRCINFO"
    assert srcinfo.exists()
    update_file(
        srcinfo,
        [
            (package_version_line, rf"\g<prefix>{new_version}"),
            (
                re.compile(r"(?m)^(?P<prefix>\s*sha256sums\s*=\s*)[^\n]+$"),
                rf"\g<prefix>{new_sha}",
            ),
            (
                re.compile(rf"(?m)({re.escape(package)}-)\d+\.\d+\.\d+(\.tar\.gz)"),
                rf"\g<1>{new_version}\2",
            ),
            (
                re.compile(r"(?m)(/refs/tags/)v\d+\.\d+\.\d+(\.tar\.gz)"),
                rf"\1v{new_version}\2",
            ),
        ],
    )

    print("Done.", file=sys.stderr)


if __name__ == "__main__":
    main()
