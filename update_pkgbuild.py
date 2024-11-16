#!/usr/bin/env python3

import os
import subprocess
import re
import sys
import json

PKGBUILD_FILE = "PKGBUILD"
SRCINFO_FILE = ".SRCINFO"
GITHUB_API_URL = "https://api.github.com/repos/pnpm/pnpm/releases/latest"

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
        version = data.get("tag_name", "").lstrip("v")  # 去除可能的 "v" 前缀
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

        # 查找 pkgver
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
    """更新 PKGBUILD 文件中的 pkgver, pkgrel 和 sums，并生成 .SRCINFO"""
    if not os.path.exists(PKGBUILD_FILE):
        print(f"Error: {PKGBUILD_FILE} not found.")
        return 1

    try:
        # 读取 PKGBUILD 文件内容
        with open(PKGBUILD_FILE, "r") as f:
            content = f.read()

        # 获取当前版本号
        current_version = get_current_version()
        if current_version == version:
            print("No update needed. Version is already up-to-date.")
            return 0

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

        # 写回更新后的 PKGBUILD 文件
        with open(PKGBUILD_FILE, "w") as f:
            f.write(content)

        print(f"PKGBUILD updated successfully with version {version}.")

        # 运行 makepkg -g 来生成新的校验和
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

        # 清除原有的 sums 行（支持所有架构和多行）
        content = re.sub(
            r"^(\w+sums(\w+)?=)\('\w+'\)$\n?",
            "",
            content,
            flags=re.MULTILINE
        )

        # 插入新的校验和（替换所有架构的 sums）
        content += new_sums

        # 写回更新后的 PKGBUILD 文件
        with open(PKGBUILD_FILE, "w") as f:
            f.write(content)

        print("Sums updated successfully.")

        # 生成 .SRCINFO 文件
        result = subprocess.run(
            ["makepkg", "--printsrcinfo"],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True
        )

        if result.returncode != 0:
            print(f"Error generating .SRCINFO: {result.stderr}")
            return 1

        # 将 .SRCINFO 输出保存到文件
        with open(SRCINFO_FILE, "w") as f:
            f.write(result.stdout)

        print(f"{SRCINFO_FILE} generated successfully.")

        return 0

    except Exception as e:
        print(f"Unexpected error updating PKGBUILD: {e}")
        return 1

def main():
    latest_version = fetch_latest_version()
    if not latest_version:
        print("Failed to fetch the latest version.")
        return 1

    print(f"Latest version: {latest_version}")
    return update_pkgbuild(latest_version)

if __name__ == "__main__":
    sys.exit(main())
