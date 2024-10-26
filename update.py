#!/usr/bin/env python3

# This script will update the ./patch.json to match the official release
# Usage: ./update.py <version-number>
# Where <version-number> is the version of the official release

import json
import os
import shutil
import subprocess
import sys

key_list = [
    "extensionsGallery",
    "extensionRecommendations",
    "keymapExtensionTips",
    "languageExtensionTips",
    "configBasedExtensionTips",
    "webExtensionTips",
    "virtualWorkspaceExtensionTips",
    "remoteExtensionTips",
    "extensionAllowedBadgeProviders",
    "extensionAllowedBadgeProvidersRegex",
    "msftInternalDomains",
    "linkProtectionTrustedDomains",
]


def fetch_product_json(version: str):
    """Download official release and extract it, then copy product.json to project root"""
    url = f"https://update.code.visualstudio.com/{version}/linux-x64/stable"
    download_cmd = ["curl", "-fSL", "-o", "code.tgz", url]
    subprocess.run(download_cmd)
    extract_cmd = ["tar", "xvf", "code.tgz"]
    subprocess.run(extract_cmd)
    shutil.copy(src="./VSCode-linux-x64/resources/app/product.json", dst=".")
    shutil.rmtree("./VSCode-linux-x64")
    os.remove("code.tgz")


def update_package():
    """Update the package"""
    with open("./product.json", "r") as product_file:
        product_data = json.load(product_file)

    patch_data = {}

    for key in key_list:
        patch_data[key] = product_data[key]

    with open("./patch.json", "w") as patch_file:
        json.dump(patch_data, patch_file, indent="\t")

    subprocess.run(["updpkgsums", "./PKGBUILD"])


version = sys.argv[1]
fetch_product_json(version)
update_package()
