#!/usr/bin/env -S uv run --script
# /// script
# dependencies = [
#   "requests",
# ]
# ///

import hashlib
import re
import subprocess
import tempfile
from pathlib import Path

import requests


DEB_LISTING_URL = "https://fluxkeyboard.com/updates/polymath/linux/deb/"
DOWNLOAD_LINK_RE = re.compile(
    r'<a href="(https://fluxkeyboard\.com/updates/polymath/linux/deb/[^"]+)"[^>]*\sclass="download-btn">\s*Download for Linux\s*</a>'
)
VERSION_RE = re.compile(r"polymath_([0-9.]+)_amd64\.deb$")

DEPENDENCY_MAP = {
    "libc6": "glibc",
    "libglib2.0-0": "glib2",
    "libgtk-3-0": "gtk3",
    "libgtk-3-bin": "gtk3",
    "libayatana-appindicator3-1": "libayatana-appindicator",
    "libayatana-ido3-0.4-0": "libayatana-appindicator",
    "libsecret-1-0": "libsecret",
}


def read_pkgver(pkgbuild: Path) -> str:
    text = pkgbuild.read_text(encoding="utf-8")
    match = re.search(r"^pkgver=(.+)$", text, re.MULTILINE)
    if not match:
        raise RuntimeError("Could not find pkgver in PKGBUILD")
    return match.group(1).strip().strip("\"'")


def read_depends(pkgbuild: Path) -> list[str]:
    text = pkgbuild.read_text(encoding="utf-8")
    match = re.search(r"^depends=\(([^)]+)\)", text, re.MULTILINE)
    if not match:
        raise RuntimeError("Could not find depends in PKGBUILD")
    depends_raw = match.group(1).strip()
    return [dep.strip().strip("\"'") for dep in depends_raw.split() if dep.strip()]


def find_deb_url(session: requests.Session) -> str:
    response = session.get(DEB_LISTING_URL, timeout=20)
    response.raise_for_status()
    match = DOWNLOAD_LINK_RE.search(response.text)
    if not match:
        raise RuntimeError("Could not find Linux .deb download link")
    return match.group(1)


def download_if_missing(session: requests.Session, url: str, dest: Path) -> None:
    if dest.exists():
        print(f"File {dest.name} already exists. Skipping download.")
        return

    with session.get(url, stream=True, timeout=60) as response:
        response.raise_for_status()
        with dest.open("wb") as file:
            for chunk in response.iter_content(chunk_size=1024 * 1024):
                if chunk:
                    file.write(chunk)

def fix_depends_part(part: str) -> str:
    part = part.strip()
    if " " in part:
        return part.split(" ")[0]
    return part

def parse_depends(control_path: Path) -> list[str]:
    depends_line: str | None = None
    in_depends = False

    for raw_line in control_path.read_text(encoding="utf-8").splitlines():
        if raw_line.startswith("Depends:"):
            depends_line = raw_line[len("Depends:") :].strip()
            in_depends = True
            continue
        if in_depends and raw_line.startswith((" ", "\t")):
            depends_line = f"{depends_line} {raw_line.strip()}"
            continue
        if in_depends:
            break

    if not depends_line:
        return []

    return [fix_depends_part(part) for part in depends_line.split(",") if part.strip()]


def main() :
    workdir = Path.cwd()
    pkgver = read_pkgver(workdir / "PKGBUILD")
    depends_aur = set(read_depends(workdir / "PKGBUILD"))
    print(f"AUR version: {pkgver}")

    with requests.Session() as session:
        deb_url = find_deb_url(session)
        version_match = VERSION_RE.search(deb_url)
        if not version_match:
            raise RuntimeError(f"Could not parse version from URL: {deb_url}")
        latest_version = version_match.group(1)

        print(f"Latest .deb URL: {deb_url}")
        print(f"Latest version: {latest_version}")

        if latest_version == pkgver:
            print("AUR is up to date.")
            # TODO: Exit here once the code is complete

        deb_name = deb_url.rsplit("/", 1)[-1]
        deb_path = workdir / deb_name
        print(f"Downloading {deb_name}...")
        download_if_missing(session, deb_url, deb_path)

        with deb_path.open("rb") as deb_file:
            deb_sha256 = hashlib.file_digest(deb_file, "sha256").hexdigest()

    with tempfile.TemporaryDirectory() as tmp:
        tmpdir = Path(tmp)
        print(f"Extracting {deb_name} to {tmpdir}...")
        subprocess.check_call(["ar", "x", str(deb_path)], cwd=tmpdir)
        subprocess.check_call(["sh", "-c", "tar -xf control.tar*"], cwd=tmpdir)
        depends_deb = parse_depends(tmpdir / "control")

    depends_deb_mapped = set([DEPENDENCY_MAP.get(dep, dep) for dep in depends_deb])
    superflous_deps = depends_aur - depends_deb_mapped
    missing_deps = depends_deb_mapped - depends_aur

    print("==== RESULTS ====")
    if superflous_deps:
        print(f"Superfluous dependencies in AUR: {superflous_deps}")
    if missing_deps:
        print(f"Missing dependencies in AUR: {missing_deps}")
    print(f"pkgver = {latest_version}")
    print(f"sha256 = {deb_sha256}")
    print("====   END   ====")

if __name__ == "__main__":
    main()
