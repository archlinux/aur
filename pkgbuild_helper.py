#!/usr/bin/env python3

import os
import subprocess
import re
import sys
import json
import argparse

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
    """更新 PKGBUILD 文件中的 pkgver, pkgrel"""
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
            return False  # 版本没有更新

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
        return True  # 返回 True 表示版本已更新
    except Exception as e:
        print(f"Unexpected error updating PKGBUILD: {e}")
        return False

def update_sums():
    """更新 PKGBUILD 文件中的 sums 校验和"""
    if not os.path.exists(PKGBUILD_FILE):
        print(f"Error: {PKGBUILD_FILE} not found.")
        return 1

    try:
        # 读取 PKGBUILD 文件内容
        with open(PKGBUILD_FILE, "r") as f:
            content = f.read()

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
        return 0

    except Exception as e:
        print(f"Unexpected error updating sums: {e}")
        return 1

def generate_srcinfo():
    """生成 .SRCINFO 文件"""
    try:
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
        print(f"Unexpected error generating .SRCINFO: {e}")
        return 1

def commit_git(version):
    """将版本号更新记录到 Git 日志"""
    try:
        # 确保当前目录是 Git 仓库
        subprocess.run(["git", "status"], check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

        # 将更改添加到 Git 暂存区
        subprocess.run(["git", "add", "*"], check=True)

        # 提交更改
        commit_message = f"update to version {version}"
        subprocess.run(["git", "commit", "-m", commit_message], check=True)

        return True
    except subprocess.CalledProcessError as e:
        print(f"Error during git operation: {e}")
        return False

def main():
    parser = argparse.ArgumentParser(description="Update PKGBUILD, sums or generate .SRCINFO.")
    
    # 添加命令行选项
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

    # 如果没有任何参数，则执行所有任务
    if not any(vars(args).values()):
        args.version = args.sums = args.info = True

    # 如果更新版本，则更新 pkgver
    version_updated = False
    latest_version = None
    if args.version:
        latest_version = fetch_latest_version()
        if not latest_version:
            print("Failed to fetch the latest version.")
            return 1

        print(f"Latest version: {latest_version}")
        version_updated = update_pkgbuild(latest_version)

    # 如果版本已更新或需要单独更新 sums
    if args.sums:
        # 只在版本更新时才更新 sums
        if version_updated:
            update_sums()
        elif not args.version:  # 如果是单独执行 sums，则直接更新 sums
            update_sums()

    # 如果需要生成 .SRCINFO 文件
    if args.info:
        generate_srcinfo()

    # 如果版本已更新，则提交到 Git
    if version_updated:
        commit_git(latest_version)

    return 0

if __name__ == "__main__":
    sys.exit(main())
