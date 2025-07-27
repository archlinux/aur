#!/usr/bin/env python3

import sys
import os
import requests
import subprocess
import tempfile
import shutil

# --- Constants ---
REPO_URL = "https://api.github.com/repos/Voxelum/x-minecraft-launcher/releases/latest"
RELEASE_URL = "https://github.com/Voxelum/x-minecraft-launcher/releases"
PKGBUILD_FILE = "PKGBUILD"
SRCINFO_FILE = ".SRCINFO"

# ANSI Color Codes
COLOR_GREEN = "\033[92m"
COLOR_RED = "\033[91m"
COLOR_YELLOW = "\033[93m" # Added for warnings/info
COLOR_BLUE = "\033[94m"  # Added for actions
COLOR_RESET = "\033[0m"

# --- Helper Functions ---
def print_success(message):
    """Prints a success message in green."""
    print(f"{COLOR_GREEN}{message}{COLOR_RESET}")

def print_error(message):
    """Prints an error message in red to stderr."""
    print(f"{COLOR_RED}Error: {message}{COLOR_RESET}", file=sys.stderr)

def print_info(message):
    """Prints an informational message in yellow."""
    print(f"{COLOR_YELLOW}{message}{COLOR_RESET}")

def print_action(message):
    """Prints a message indicating an action in blue."""
    print(f"{COLOR_BLUE}{message}{COLOR_RESET}")

# --- Core Functions ---
def fetch_latest_version():
    """Fetches the latest release tag name from GitHub API."""
    print_action(f"Fetching latest version info from {REPO_URL}...")
    try:
        response = requests.get(REPO_URL, timeout=10)
        response.raise_for_status()
        return response.json()['tag_name']
    except requests.exceptions.RequestException as e:
        print_error(f"fetching release info: {e}")
    except KeyError:
        print_error("'tag_name' not found in API response.")
    except Exception as e:
        print_error(f"An unexpected error occurred during fetch: {e}")
    return None

def update_pkgbuild(version_tag):
    """Updates the pkgver line in PKGBUILD."""
    print_action(f"Updating {PKGBUILD_FILE}...")
    version_num = version_tag.lstrip('v')
    temp_path = None
    try:
        with tempfile.NamedTemporaryFile(mode='w', delete=False) as temp_file:
            temp_path = temp_file.name
            with open(PKGBUILD_FILE, 'r') as infile:
                for line in infile:
                    if line.strip().startswith('pkgver='):
                        temp_file.write(f"pkgver={version_num}\n")
                    else:
                        temp_file.write(line)
        shutil.move(temp_path, PKGBUILD_FILE)
        return True
    except FileNotFoundError:
        print_error(f"File not found: {PKGBUILD_FILE}")
    except Exception as e:
        print_error(f"updating {PKGBUILD_FILE}: {e}")
        if temp_path and os.path.exists(temp_path):
            try:
                os.remove(temp_path) # Clean up temp file on error
            except OSError as rm_err:
                 print_error(f"cleaning up temporary file {temp_path}: {rm_err}")
    return False

def create_srcinfo(version_tag):
    """Creates or overwrites the .SRCINFO file."""
    print_action(f"Updating {SRCINFO_FILE}...")
    version_num = version_tag.lstrip('v')
    srcinfo_content = f"""pkgbase = xmcl-launcher
	pkgdesc = X Minecraft Launcher - A modern Minecraft launcher
	pkgver = {version_num}
	pkgrel = 1
	url = https://xmcl.app/
	arch = x86_64
	arch = aarch64
	license = MIT
	makedepends = curl
	makedepends = libarchive
	optdepends = jre8-openjdk: Minimum requirement for launching older game versions
	optdepends = jre11-openjdk: Recommended Java version for launching versions 1.12-1.17
	optdepends = jre17-openjdk: Recommended Java version for launching version 1.17 and above
	optdepends = jre21-openjdk: Recommended Java version for launching version 1.20.5+ and above
	provides = xmcl
	conflicts = xmcl-launcher-bin
	conflicts = xmcl-electron-bin
	source = {RELEASE_URL}/{version_tag}

pkgname = xmcl-launcher
"""
    try:
        with open(SRCINFO_FILE, 'w') as f:
            f.write(srcinfo_content)
        return True
    except Exception as e:
        print_error(f"creating {SRCINFO_FILE}: {e}")
        return False

# --- Main Function ---
def main():
    """Main execution logic."""
    if not os.path.exists(PKGBUILD_FILE):
       print_error(f"{PKGBUILD_FILE} not found in the current directory.")
       sys.exit(1)

    latest_version = fetch_latest_version()
    if not latest_version:
        print_error("Failed to get the latest version. Exiting.")
        sys.exit(1)

    print_info(f"Latest version found: {latest_version}")

    if not update_pkgbuild(latest_version):
        print_error(f"Failed to update {PKGBUILD_FILE}. Exiting.")
        sys.exit(1)

    if not create_srcinfo(latest_version):
        print_error(f"Failed to create {SRCINFO_FILE}. Exiting.")
        sys.exit(1)

    print_success(f"Successfully updated files to version {latest_version}")

    try:
        response = input("Do you want to build the package? (y/N) ")
        if response.strip().lower() == 'y':
            print_action("Running makepkg -s ...")
            try:
                subprocess.run(['makepkg', '-s'], check=True)
            except subprocess.CalledProcessError as e:
                print_error(f"makepkg failed with return code {e.returncode}")
                sys.exit(e.returncode)
        else:
            print_info("Skipping package build.")
    except KeyboardInterrupt:
        # Add newline for cleaner exit after Ctrl+C during input()
        print()
        print_info("Build cancelled by user.")
        sys.exit(1)
    except Exception as e:
        print_error(f"An error occurred during build prompt/execution: {e}")
        sys.exit(1)

# --- Script Entry Point ---
if __name__ == "__main__":
    try:
        main()
    except Exception as e:
        # Catch-all for any unexpected errors in main logic
        print_error(f"An unexpected script error occurred: {e}")
        sys.exit(1)
