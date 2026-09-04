#!/usr/bin/env python3
"""Check for a stable Ecosia Snap release and optionally update the PKGBUILD."""

import argparse
import hashlib
import json
import os
import re
import subprocess
import sys
from pathlib import Path
from urllib.error import HTTPError, URLError
from urllib.request import Request, urlopen

SNAP_NAME = "ecosia"
SNAP_ARCH = "amd64"
SNAP_TRACK = "latest"
SNAP_RISK = "stable"
API_URL = f"https://api.snapcraft.io/v2/snaps/info/{SNAP_NAME}"
ROOT = Path(__file__).resolve().parent
PKGBUILD = ROOT / "PKGBUILD"
SRCINFO = ROOT / ".SRCINFO"
HEADERS = {
    "Accept": "application/json",
    "Snap-Device-Series": "16",
    "User-Agent": "ecosia-browser-bin-update-checker/1",
}


def pkgbuild_value(name: str, contents: str) -> str:
    match = re.search(rf"^{re.escape(name)}=['\"]?([^'\"\s]+)['\"]?\s*$", contents, re.MULTILINE)
    if not match:
        raise ValueError(f"could not read {name} from {PKGBUILD}")
    return match.group(1)


def replace_assignment(contents: str, name: str, value: str, *, quote: bool = False) -> str:
    replacement = f"{name}='{value}'" if quote else f"{name}={value}"
    updated, count = re.subn(rf"^{re.escape(name)}=.*$", replacement, contents, flags=re.MULTILINE)
    if count != 1:
        raise ValueError(f"expected exactly one {name} assignment in {PKGBUILD}")
    return updated


def fetch_release() -> dict:
    request = Request(API_URL, headers=HEADERS)
    with urlopen(request, timeout=20) as response:
        metadata = json.load(response)

    return next(
        entry
        for entry in metadata["channel-map"]
        if entry["channel"]["architecture"] == SNAP_ARCH
        and entry["channel"]["track"] == SNAP_TRACK
        and entry["channel"]["risk"] == SNAP_RISK
    )


def snap_id_from_url(url: str, revision: str) -> str:
    match = re.search(rf"/([^/]+)_{re.escape(revision)}\.snap(?:\?.*)?$", url)
    if not match:
        raise ValueError(f"could not determine Snap ID from download URL: {url}")
    return match.group(1)


def hash_file(path: Path) -> tuple[str, str, int]:
    sha256 = hashlib.sha256()
    sha3_384 = hashlib.sha3_384()
    size = 0
    with path.open("rb") as stream:
        while chunk := stream.read(1024 * 1024):
            sha256.update(chunk)
            sha3_384.update(chunk)
            size += len(chunk)
    return sha256.hexdigest(), sha3_384.hexdigest(), size


def download_snap(release: dict, target: Path) -> str:
    expected_sha3 = release["download"]["sha3-384"]
    expected_size = int(release["download"]["size"])

    if target.exists():
        sha256, sha3_384, size = hash_file(target)
        if sha3_384 == expected_sha3 and size == expected_size:
            print(f"Using existing verified download: {target.name}")
            return sha256

    temporary = target.with_name(f".{target.name}.part")
    temporary.unlink(missing_ok=True)
    print(f"Downloading {target.name} ({expected_size / 1024 / 1024:.1f} MiB)...")

    try:
        request = Request(release["download"]["url"], headers={"User-Agent": HEADERS["User-Agent"]})
        with urlopen(request, timeout=60) as response, temporary.open("wb") as output:
            while chunk := response.read(1024 * 1024):
                output.write(chunk)

        sha256, sha3_384, size = hash_file(temporary)
        if size != expected_size:
            raise ValueError(f"download size mismatch: expected {expected_size}, got {size}")
        if sha3_384 != expected_sha3:
            raise ValueError("download SHA3-384 checksum mismatch")
        os.replace(temporary, target)
        return sha256
    finally:
        temporary.unlink(missing_ok=True)


def atomic_write(path: Path, contents: str) -> None:
    temporary = path.with_name(f".{path.name}.tmp")
    temporary.write_text(contents, encoding="utf-8")
    if path.exists():
        temporary.chmod(path.stat().st_mode)
    os.replace(temporary, path)


def update_package(contents: str, release: dict, latest_version: str, latest_revision: str, latest_id: str) -> None:
    current_version = pkgbuild_value("pkgver", contents)
    current_pkgrel = int(pkgbuild_value("pkgrel", contents))
    pkgname = pkgbuild_value("pkgname", contents)
    new_pkgrel = 1 if latest_version != current_version else current_pkgrel + 1

    snap_name = f"{pkgname}-{latest_version}-{latest_revision}.snap"
    sha256 = download_snap(release, ROOT / snap_name)

    updated = replace_assignment(contents, "pkgver", latest_version)
    updated = replace_assignment(updated, "pkgrel", str(new_pkgrel))
    updated = replace_assignment(updated, "_snap_id", latest_id, quote=True)
    updated = replace_assignment(updated, "_snap_revision", latest_revision)
    updated, count = re.subn(
        r"^sha256sums_x86_64=\('[0-9a-f]{64}'\)$",
        f"sha256sums_x86_64=('{sha256}')",
        updated,
        flags=re.MULTILINE,
    )
    if count != 1:
        raise ValueError("expected exactly one sha256sums_x86_64 entry in PKGBUILD")

    atomic_write(PKGBUILD, updated)
    try:
        result = subprocess.run(
            ["makepkg", "--printsrcinfo"],
            cwd=ROOT,
            check=True,
            capture_output=True,
            text=True,
        )
        atomic_write(SRCINFO, result.stdout)
    except (OSError, subprocess.CalledProcessError):
        atomic_write(PKGBUILD, contents)
        raise

    print(f"Updated PKGBUILD to {latest_version}-{new_pkgrel} (Snap revision {latest_revision})")
    print("Updated .SRCINFO and the Snap SHA-256 checksum")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("-u", "--update", action="store_true", help="update PKGBUILD and .SRCINFO")
    args = parser.parse_args()

    try:
        contents = PKGBUILD.read_text(encoding="utf-8")
        current_version = pkgbuild_value("pkgver", contents)
        current_revision = pkgbuild_value("_snap_revision", contents)
        current_id = pkgbuild_value("_snap_id", contents)
        release = fetch_release()

        latest_version = str(release["version"])
        latest_revision = str(release["revision"])
        latest_id = snap_id_from_url(release["download"]["url"], latest_revision)

        print(f"PKGBUILD:         {current_version} (Snap revision {current_revision})")
        print(f"Snapcraft stable: {latest_version} (Snap revision {latest_revision})")

        if (current_version, current_revision, current_id) == (latest_version, latest_revision, latest_id):
            print("Status: up to date")
        else:
            print("Status: update available")
            print(f"Released: {release['channel']['released-at']}")
            print(f"Download: {release['download']['url']}")
            if args.update:
                update_package(contents, release, latest_version, latest_revision, latest_id)
    except (
        OSError,
        ValueError,
        KeyError,
        StopIteration,
        HTTPError,
        URLError,
        json.JSONDecodeError,
        subprocess.CalledProcessError,
    ) as error:
        print(f"error: {error}", file=sys.stderr)
        return 1

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
