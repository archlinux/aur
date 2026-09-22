#!/usr/bin/env python3
"""
LM Studio Bionic PKGBUILD Maintenance Engine (multi-arch)

Resolves dynamic upstream links (x86_64 + aarch64), extracts version,
calculates SHA256 checksums, and generates PKGBUILD from template.
"""

import re
import os
import hashlib
import requests
import subprocess
from pathlib import Path

REDIRECTS = {
    "x64": "https://lmstudio.ai/download/bionic/latest/linux/x64",
    "aarch64": "https://lmstudio.ai/download/bionic/latest/linux/arm64",
}

ICON_FILENAME = "lmbionic.png"


def resolve_download_urls() -> dict:
    """
    Follow redirects to resolve the final download URL for each arch.
    Uses HEAD requests to avoid downloading the full files.
    :return: Dictionary containing the final download URLs for each arch.
    """
    urls = dict()
    session = requests.Session()
    for arch, redirect in REDIRECTS.items():
        print(f"Resolving {arch}: {redirect}")
        response = session.head(redirect, allow_redirects=True)
        response.raise_for_status()
        urls[arch] = response.url
        print(f"  -> {urls[arch]}")
    return urls


def extract_version(filename: str) -> str:
    """
    Extract semantic version from filename using regex.
    Expected format: Bionic-X.Y.Z-R-arch.appimage
    Examples:
      Bionic-1.1.4-3-x64.appimage  → 1.1.4
      Bionic-1.1.4-3-arm64.appimage → 1.1.4
    :param filename: The Bionic AppImage file name.
    :return: Bionic version.
    """
    match = re.search(
        r'Bionic-([\d.]+)-\d+-(?:x64|aarch64|arm64)\.appimage',
        filename,
        re.IGNORECASE
    )
    if match:
        return match.group(1)
    raise ValueError(f"Could not extract version from filename: {filename}")


def calculate_sha256(file_path: str) -> str:
    """
    Calculate SHA256 checksum of a file.
    Handles AppImages and the icon file with identical hashing logic.
    :param file_path: The path of the file to calculate the checksum for.
    :return: The checksum.
    """
    print(f"Calculating SHA256 for: {file_path}")

    sha256_hash = hashlib.sha256()
    with open(file_path, "rb") as f:
        for byte_block in iter(lambda: f.read(4096), b""):
            sha256_hash.update(byte_block)

    checksum = sha256_hash.hexdigest()
    print(f"SHA256: {checksum}")
    return checksum


def download_file(url: str, file_path: str) -> None:
    """
    Download file from URL if it doesn't already exist.
    :param url: URL to download the file from.
    :param file_path: Where to store the downloaded path (including the file name).
    """
    path = Path(file_path)
    if path.exists():
        print(f"File already exists: {file_path}")
        return

    print(f"Downloading: {url}")
    response = requests.get(url, stream=True)
    response.raise_for_status()

    with open(file_path, "wb") as f:
        for chunk in response.iter_content(chunk_size=8192):
            if chunk:
                f.write(chunk)

    print(f"Downloaded: {file_path}")


def render_template(template_path: str, output_path: str, version: str,
                    urls: dict, hashes: dict, icon_sha256: str) -> None:
    """
    Render PKGBUILD from template by replacing placeholders.

    Placeholders:
    - {{version}}: Semantic version extracted from filenames
    - {{url_x64}}: Resolved x86_64 download URL
    - {{url_aarch64}}: Resolved aarch64 download URL
    - {{sha256_x64}}: SHA256 checksum of the x86_64 AppImage
    - {{sha256_aarch64}}: SHA256 checksum of the aarch64 AppImage
    - {{icon_sha256}}: SHA256 checksum of the static icon (lmbionic.png)

    :param template_path: PKGBUILD template path.
    :param output_path: PKGBUILD output path.
    :param version: Package version.
    :param urls: Source URLs.
    :param hashes: Hashes to include.
    :param icon_sha256: Icon hash.
    """
    print(f"Rendering template: {template_path} -> {output_path}")

    with open(template_path, "r") as f:
        content = f.read()

    content = content.replace("{{version}}", version)
    content = content.replace("{{url_x64}}", urls["x64"])
    content = content.replace("{{url_aarch64}}", urls["aarch64"])
    content = content.replace("{{sha256_x64}}", hashes["x64"])
    content = content.replace("{{sha256_aarch64}}", hashes["aarch64"])
    content = content.replace("{{icon_sha256}}", icon_sha256)

    with open(output_path, "w") as f:
        f.write(content)

    print(f"Generated: {output_path}")


def generate_srcinfo(package_dir: str) -> None:
    """
    Generate .SRCINFO using makepkg --printsrcinfo.
    :param package_dir: Package directory, where PKGBUILD is.
    """
    print("Generating .SRCINFO...")

    result = subprocess.run(
        ["makepkg", "--printsrcinfo"],
        capture_output=True,
        text=True,
        cwd=package_dir
    )

    if result.returncode != 0:
        raise RuntimeError(f"makepkg failed: {result.stderr}")

    srcinfo_path = Path(package_dir) / ".SRCINFO"
    with open(srcinfo_path, "w") as f:
        f.write(result.stdout)

    print(f"Generated: {srcinfo_path}")


def main():
    """
    Main maintenance engine workflow.
    """
    print("=== LM Studio Bionic PKGBUILD Maintenance Engine (multi-arch) ===\n")

    # Run from the directory containing this script
    package_dir = os.path.dirname(os.path.abspath(__file__))
    os.chdir(package_dir)

    # Step 1: Resolve download URLs for both architectures
    urls = resolve_download_urls()
    print()

    # Step 2: Extract filename and version; sanity-check both match
    versions = {extract_version(urls[arch].split("/")[-1]) for arch in urls}
    if len(versions) != 1:
        raise RuntimeError(f"Version mismatch across architectures: {versions}")
    version = versions.pop()
    print(f"Detected Bionic version: {version}\n")

    # Step 3: Download files if missing, calculate SHA256 for each AppImage
    hashes = {}
    for arch in ("x64", "aarch64"):
        local_name = f"lm-studio-bionic-{arch}.AppImage"
        download_file(urls[arch], local_name)
        hashes[arch] = calculate_sha256(local_name)
        print()

    # Step 4: Calculate SHA256 for static icon (lmbionic.png)
    if not Path(ICON_FILENAME).exists():
        raise FileNotFoundError(f"{ICON_FILENAME} not found in current directory")
    icon_hash = calculate_sha256(ICON_FILENAME)
    print()

    # Step 5: Render PKGBUILD from template
    render_template("PKGBUILD.template", "PKGBUILD", version, urls, hashes, icon_hash)
    print()

    # Step 6: Generate .SRCINFO
    generate_srcinfo(package_dir)

    print("\n=== Maintenance Engine Complete ===")
    print(f"Bionic Version: {version}")
    print(f"x64 URL:     {urls['x64']}")
    print(f"  SHA256: {hashes['x64']}")
    print(f"aarch64 URL: {urls['aarch64']}")
    print(f"  SHA256: {hashes['aarch64']}")
    print(f"Icon SHA256: {icon_hash}")


if __name__ == "__main__":
    main()
