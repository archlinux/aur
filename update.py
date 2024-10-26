#!/usr/bin/env python3

# This script will update the ./patch.json to match the official release
# Usage: ./update.py

import json
import os
import shutil
import subprocess

key_list = [
    "nameShort",
    "nameLong",
    "applicationName",
    "serverApplicationName",
    "urlProtocol",
    "dataFolderName",
    "serverDataFolderName",
    "webUrl",
    "webEndpointUrl",
    "webEndpointUrlTemplate",
    "webviewContentExternalBaseUrlTemplate",
    "commandPaletteSuggestedCommandIds",
    "extensionKeywords",
    "aiConfig",
    "settingsSearchUrl",
    "extensionEnabledApiProposals",
    "tasConfig",
    "extensionKind",
    "extensionPointExtensionKind",
    "extensionSyncedKeys",
    "extensionVirtualWorkspacesSupport",
    "trustedExtensionAuthAccess",
    "auth",
    "configurationSync.store",
    "editSessions.store",
    "tunnelApplicationName",
    "tunnelApplicationConfig",
]


def fetch_product_json():
    """Download official release and extract it, then copy product.json to project root"""
    url = "https://code.visualstudio.com/sha/download?build=insider&os=linux-x64"
    download_cmd = ["axel", "-n", "8", "-o", "code.tgz", url]
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

    patch_data["enableTelemetry"] = False

    with open("./patch.json", "w") as patch_file:
        json.dump(patch_data, patch_file, indent="\t")

    subprocess.run(["updpkgsums", "./PKGBUILD"])


fetch_product_json()
update_package()
