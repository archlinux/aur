#!/usr/bin/env python3
"""
LM Studio PKGBUILD Maintenance Engine

Resolves dynamic upstream link, extracts version, calculates SHA256,
and generates PKGBUILD from template.

Updated to handle:
- AppImage file with calculated sha256
- .desktop file with 'SKIP' (locally managed)
- Static icon (lmstudio.png) with calculated sha256
- .install file staging and template rendering
"""

import re
import hashlib
import requests
import subprocess
import tarfile
from pathlib import Path
from typing import Tuple, List


def resolve_download_url(redirect_url: str = "https://lmstudio.ai/download/latest/linux/x64") -> str:
    """
    Follow redirects to resolve the final download URL.
    Uses HEAD request to avoid downloading the full file.
    """
    print(f"Resolving download URL: {redirect_url}")
    
    session = requests.Session()
    response = session.head(redirect_url, allow_redirects=True)
    response.raise_for_status()
    
    final_url = response.url
    print(f"Resolved URL: {final_url}")
    return final_url


def extract_version(filename: str) -> str:
    """
    Extract semantic version from filename using regex.
    Expected format: LM-Studio-X.Y.Z-x64.AppImage or LM-Studio-X.Y.Z-R-x64.AppImage
    Extracts only X.Y.Z portion (pkgrel handled separately in PKGBUILD).
    """
    match = re.search(r'LM-Studio-([\d.]+)-(?:\d+-)?x64\.AppImage', filename)
    if match:
        return match.group(1)
    raise ValueError(f"Could not extract version from filename: {filename}")


def calculate_sha256(file_path: str) -> str:
    """
    Calculate SHA256 checksum of a file.
    Handles both AppImage and icon files with identical hashing logic.
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


def stage_install_file() -> None:
    """
    Ensure lmstudio-bin.install file exists and is staged.
    """
    install_path = Path("/home/madgoat/Documents/LMStudio-bin Aur/lmstudio-bin.install")
    
    if install_path.exists():
        print(f"✓ Install file present: {install_path}")
    else:
        print(f"Warning: Install file not found at {install_path}")


def render_template(template_path: str, output_path: str, version: str, url: str, sha256: str, icon_sha256: str) -> None:
    """
    Render PKGBUILD from template by replacing placeholders.
    
    Placeholders:
    - {{version}}: Semantic version extracted from filename
    - {{url}}: Resolved download URL
    - {{sha256}}: SHA256 checksum of the AppImage
    - {{icon_sha256}}: SHA256 checksum of the static icon (lmstudio.png)
    
    The template includes sha256sums array with appimage hash, icon hash, and SKIP for .desktop file.
    """
    print(f"Rendering template: {template_path} -> {output_path}")
    
    with open(template_path, "r") as f:
        content = f.read()
    
    content = content.replace("{{version}}", version)
    content = content.replace("{{url}}", url)
    content = content.replace("{{sha256}}", sha256)
    content = content.replace("{{icon_sha256}}", icon_sha256)
    
    with open(output_path, "w") as f:
        f.write(content)
    
    print(f"Generated: {output_path}")


def generate_srcinfo() -> None:
    """
    Generate .SRCINFO using makepkg --printsrcinfo.
    """
    print("Generating .SRCINFO...")
    
    result = subprocess.run(
        ["makepkg", "--printsrcinfo"],
        capture_output=True,
        text=True,
        cwd="/home/madgoat/Documents/LMStudio-bin Aur"
    )
    
    if result.returncode != 0:
        raise RuntimeError(f"makepkg failed: {result.stderr}")
    
    with open("/home/madgoat/Documents/LMStudio-bin Aur/.SRCINFO", "w") as f:
        f.write(result.stdout)
    
    print("Generated: .SRCINFO")


def main():
    """
    Main maintenance engine workflow.
    """
    print("=== LM Studio PKGBUILD Maintenance Engine ===\n")
    
    # Change to workspace directory
    import os
    os.chdir("/home/madgoat/Documents/LMStudio-bin Aur")
    
    # Step 1: Resolve download URL
    final_url = resolve_download_url()
    
    # Step 2: Extract filename and version
    filename = final_url.split("/")[-1]
    version = extract_version(filename)
    print(f"Detected version: {version}\n")
    
    # Step 3: Download file if missing
    download_file(final_url, filename)
    
    # Step 4: Calculate SHA256 for AppImage
    sha256 = calculate_sha256(filename)
    print()
    
    # Step 5: Calculate SHA256 for static icon (lmstudio.png)
    # Uses identical hashing logic as AppImage
    icon_hash = calculate_sha256("lmstudio.png")
    print()
    
    # Step 6: Stage install file
    stage_install_file()
    print()
    
    # Step 7: Render PKGBUILD from template
    # The template uses {{sha256}} for the AppImage hash and {{icon_sha256}} for icon hash
    # and the sha256sums array in the template includes both hashes plus 'SKIP' for .desktop file
    render_template("PKGBUILD.template", "PKGBUILD", version, final_url, sha256, icon_hash)
    print()
    
    # Step 8: Generate .SRCINFO
    generate_srcinfo()
    
    print("\n=== Maintenance Engine Complete ===")
    print(f"Version: {version}")
    print(f"URL: {final_url}")
    print(f"AppImage SHA256: {sha256}")
    print(f"Icon SHA256: {icon_hash}")
    print(f"SHA256sums: ('{sha256}' '{icon_hash}' 'SKIP')")


if __name__ == "__main__":
    main()
