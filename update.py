#!/usr/bin/env python3

import argparse
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

work_dir = "/tmp/code-features"


def clean_work_dir():
    print(f"==> Cleaning work dir {work_dir}")
    if os.path.exists(work_dir):
        shutil.rmtree(work_dir)


def fetch_product_json(version):
    os.mkdir(work_dir)
    url = f"https://update.code.visualstudio.com/{version}/linux-x64/stable"
    download_cmd = ["curl", "-fSL", "-o", f"{work_dir}/code.tgz", url]
    print(
        '==> Start downloading official vscode release to %s/code.tgz. The command is "%s"'
        % (work_dir, " ".join(download_cmd))
    )
    subprocess.run(download_cmd)
    extract_cmd = ["tar", "xf", f"{work_dir}/code.tgz", "-C", work_dir]
    print(
        '==> Start extracting the tarball. The command is "%s"' % " ".join(extract_cmd)
    )
    subprocess.run(extract_cmd)
    print("==> Copying product.json to %s" % work_dir)
    shutil.copy(
        src=f"{work_dir}/VSCode-linux-x64/resources/app/product.json", dst=work_dir
    )
    print("==> Removing the tarball and the extracted contents")
    shutil.rmtree(f"{work_dir}/VSCode-linux-x64")
    os.remove(f"{work_dir}/code.tgz")


def update_patch_json(local_file: bool):
    print(f"==> Loading data from {work_dir}/product.json")
    with open(f"{work_dir}/product.json", "r") as product_file:
        product_data = json.load(product_file)

    patch_data = {}

    for key in key_list:
        patch_data[key] = product_data[key]

    patch_data["enableTelemetry"] = False

    patch_json_path = "/usr/share/code-features/patch.json"
    if local_file:
        patch_json_path = "./patch.json"
    print(f"==> Updating {patch_json_path}")
    with open(patch_json_path, "w") as patch_file:
        json.dump(patch_data, patch_file, indent="\t")


def is_running_as_root():
    return os.geteuid() == 0


def get_local_code_version():
    with open("/usr/lib/code/product.json") as product_file:
        product_data = json.load(product_file)
    return product_data["version"]


def update_system_hook(version):
    clean_work_dir()
    print("==> Updating system hook")
    if not is_running_as_root():
        print("==> Root privilege is required. Aborting...")
        exit(1)
    if version is None:
        version = get_local_code_version()
    fetch_product_json(version)
    print("==> Restoring product.json")
    subprocess.run(["/usr/share/code-features/patch.py", "code-features", "restore"])
    update_patch_json(False)
    print("==> Patching product.json")
    subprocess.run(["/usr/share/code-features/patch.py", "code-features", "patch"])
    clean_work_dir()


def update_local_hook(version):
    clean_work_dir()
    print("==> Updating local hook")
    if version is None:
        version = get_local_code_version()
    fetch_product_json(version)
    update_patch_json(True)
    print("==> Updating pkgsums")
    subprocess.run(["updpkgsums", "./PKGBUILD"])
    clean_work_dir()


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Update patch.json to keep up with the official vscode release."
    )
    group = parser.add_mutually_exclusive_group(required=True)
    group.add_argument(
        "-l",
        "--local",
        action="store_true",
        help="Update patch.json in AUR package. This should be executed in the project root of the AUR package.",
    )
    group.add_argument(
        "-s",
        "--system",
        action="store_true",
        help="Update patch.json installed on system and run the patch. This command will download the latest official release and update patch.json based on it. "
        + "NOTE: You should use this option with root privilege because the patch.json installed on your system has mode 644.",
    )
    parser.add_argument(
        "-v",
        "--version",
        type=str,
        help="Specify the vscode version you want to keep up with. If this option is omitted, this script will use the version of extra/code installed on the system.",
    )
    args = parser.parse_args()
    if args.local:
        update_local_hook(args.version)
    elif args.system:
        update_system_hook(args.version)
