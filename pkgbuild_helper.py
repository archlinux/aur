#!/usr/bin/env python3

import os
import subprocess
import re
import sys
import json
import argparse

PKGBUILD_FILE = "PKGBUILD"
SRCINFO_FILE = ".SRCINFO"
GITHUB_API_URL = "https://api.github.com/repos/mapleafgo/singcast/releases/latest"

def fetch_latest_version():
    """获取 GitHub 最新版本号"""
    try:
        result = subprocess.run(
            ["curl", "-s", GITHUB_API_URL],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True
        )

        if result.returncode != 0:
            print(f"Error fetching latest version: {result.stderr}")
            return None

        data = json.loads(result.stdout)
        version = data.get("tag_name", "").lstrip("v")
        return version
    except Exception as e:
        print(f"Unexpected error fetching latest version: {e}")
        return None

def get_current_version():
    """从 PKGBUILD 中获取当前的版本号"""
    if not os.path.exists(PKGBUILD_FILE):
        print(f"Error: {PKGBUILD_FILE} not found.")
        return None

    try:
        with open(PKGBUILD_FILE, "r") as f:
            content = f.read()

        match = re.search(r"^pkgver=(\S+)", content, re.MULTILINE)
        if match:
            return match.group(1)
        else:
            print("Error: pkgver not found in PKGBUILD.")
            return None
    except Exception as e:
        print(f"Unexpected error reading PKGBUILD: {e}")
        return None

def update_pkgbuild(version):
    """更新 PKGBUILD 文件中的 pkgver, pkgrel"""
    if not os.path.exists(PKGBUILD_FILE):
        print(f"Error: {PKGBUILD_FILE} not found.")
        return 1

    try:
        with open(PKGBUILD_FILE, "r") as f:
            content = f.read()

        current_version = get_current_version()
        if current_version == version:
            print("No update needed. Version is already up-to-date.")
            return False

        # 更新 pkgver
        content = re.sub(
            r"^pkgver=.*",
            f"pkgver={version}",
            content,
            flags=re.MULTILINE
        )

        # 更新 pkgrel 为 1
        content = re.sub(
            r"^pkgrel=.*",
            "pkgrel=1",
            content,
            flags=re.MULTILINE
        )

        with open(PKGBUILD_FILE, "w") as f:
            f.write(content)

        print(f"PKGBUILD updated successfully with version {version}.")
        return True
    except Exception as e:
        print(f"Unexpected error updating PKGBUILD: {e}")
        return False

def update_sums():
    """更新 PKGBUILD 文件中的 sums 校验和"""
    if not os.path.exists(PKGBUILD_FILE):
        print(f"Error: {PKGBUILD_FILE} not found.")
        return 1

    try:
        with open(PKGBUILD_FILE, "r") as f:
            content = f.read()

        result = subprocess.run(
            ["makepkg", "-g"],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True
        )

        if result.returncode != 0:
            print(f"Error generating sums: {result.stderr}")
            return 1

        new_sums = result.stdout.strip()
        if not new_sums:
            print("Error: No sums generated.")
            return 1

        # 清除原有的 sums 行
        content = re.sub(
            r"^(\w+sums(\w+)?=)\((('\w+')?\s?)+\)$\n?",
            "",
            content,
            flags=re.MULTILINE
        )

        content += new_sums

        with open(PKGBUILD_FILE, "w") as f:
            f.write(content)

        print("Sums updated successfully.")
        return 0

    except Exception as e:
        print(f"Unexpected error updating sums: {e}")
        return 1

def generate_srcinfo():
    """生成 .SRCINFO 文件"""
    try:
        result = subprocess.run(
            ["makepkg", "--printsrcinfo"],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True
        )

        if result.returncode != 0:
            print(f"Error generating .SRCINFO: {result.stderr}")
            return 1

        with open(SRCINFO_FILE, "w") as f:
            f.write(result.stdout)

        print(f"{SRCINFO_FILE} generated successfully.")
        return 0

    except Exception as e:
        print(f"Unexpected error generating .SRCINFO: {e}")
        return 1

def commit_git(version):
    """将版本号更新记录到 Git 日志"""
    try:
        subprocess.run(["git", "status"], check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        subprocess.run(["git", "add", "*"], check=True)
        commit_message = f"update to version {version}"
        subprocess.run(["git", "commit", "-m", commit_message], check=True)
        return True
    except subprocess.CalledProcessError as e:
        print(f"Error during git operation: {e}")
        return False

def main():
    parser = argparse.ArgumentParser(description="Update PKGBUILD, sums or generate .SRCINFO.")

    parser.add_argument(
        "--version", action="store_true", help="Fetch the latest version and update PKGBUILD"
    )
    parser.add_argument(
        "--sums", action="store_true", help="Update the sums in PKGBUILD"
    )
    parser.add_argument(
        "--info", action="store_true", help="Generate the .SRCINFO file"
    )

    args = parser.parse_args()

    if not any(vars(args).values()):
        args.version = args.sums = args.info = True

    version_updated = False
    latest_version = None
    if args.version:
        latest_version = fetch_latest_version()
        if not latest_version:
            print("Failed to fetch the latest version.")
            return 1

        print(f"Latest version: {latest_version}")
        version_updated = update_pkgbuild(latest_version)

    if args.sums:
        if version_updated:
            update_sums()
        elif not args.version:
            update_sums()

    if args.info:
        generate_srcinfo()

    if version_updated:
        commit_git(latest_version)

    return 0

if __name__ == "__main__":
    sys.exit(main())
