#!/usr/bin/env python3
"""
vscodium-prod-patcher by fnrir

I'm tired of having multiple versions of different "patchers" for different
versions of VSCodium. So fuck it. This one is configurable and universal.

I might add backups later. rn i'm tired

trans rights are human rights

polska gurom

GitHub: <https://github.com/fnr1r>
Matrix: @fnrir:matrix.org
Mastodon: <https://tech.lgbt/@fnrir>
Mail: fnr1r0@protonmail.com
Credit Card: 5809820978480085 Date: 06/21 CVC: 420
IP address: [::1]
"""

import json
import os
from pathlib import Path
import sys
import toml
from typing import Any

ENCODING = "UTF-8"

NAME = "vscodium-prod-patcher"

HOOKS_DIR = Path("/etc/pacman.d/hooks")
HOOK_FILE = HOOKS_DIR / f"98-{NAME}-action.hook"

HOOK_TEMPLATE = """[Trigger]
Operation = Install
Operation = Upgrade
Type = Package
{targets}

[Action]
Description = [{name}] VSCodium installation hook
Exec = /usr/share/{name}/util.py patch
When = PostTransaction
NeedsTargets
"""
HOOK_TARGET_TEMPLATE = "Target = {pkg}"

DATA_DIR = Path("/usr/share") / NAME
CONFIG_PATH = DATA_DIR / "config.toml"

CONFIG_TEMPLATE = {
    "packages": {},
    "patch": {
        "extensions_source": "openvsx",
        "extra_features": False,
        "use_xdg": False,
    }
}

EXTENSIONS_OPENVSX_GALLERY = {
    "serviceUrl": "https://open-vsx.org/vscode/gallery",
    "itemUrl": "https://open-vsx.org/vscode/item",
}
EXTENSIONS_OPENVSX_TRUSTED = ["https://open-vsx.org"]
EXTENSIONS_MS_GALLERY = {
    "serviceUrl": "https://marketplace.visualstudio.com/_apis/public/gallery",
    "cacheUrl": "https://vscode.blob.core.windows.net/gallery/index",
    "itemUrl": "https://marketplace.visualstudio.com/items"
}

COMMAND = ""
CONFIG: dict[str, Any] = []

def einfo(*args, **kwargs):
    print("::", *args, **kwargs)

def json_load(path: Path):
    with open(path, "rt", encoding=ENCODING) as file:
        return json.load(file)

def json_save(path: Path, obj: Any, *args, **kwargs):
    with open(path, "wt", encoding=ENCODING) as file:
        json.dump(obj, file, *args, **kwargs)

def toml_load(path: Path):
    with open(path, "rt", encoding=ENCODING) as file:
        return toml.load(file)

def load_config():
    try:
        return toml_load(CONFIG_PATH)
    except FileNotFoundError:
        return CONFIG_TEMPLATE

def argparse():
    global CONFIG
    CONFIG = load_config()
    global COMMAND
    COMMAND = sys.argv[1]

def install_hook():
    packages: dict[str, str] = CONFIG["packages"]
    if not packages:
        if HOOK_FILE.exists():
            os.remove(HOOK_FILE)
        einfo(
            "No VSCodium package defined.",
            f"Try to configure {NAME} by creating",
            CONFIG_PATH,
        )
        return
    targets = "\n".join([
        HOOK_TARGET_TEMPLATE.format(pkg=pkg)
        for pkg in packages.keys()
    ])
    hook_contents = HOOK_TEMPLATE.format(
        name=NAME, targets=targets,
    )
    HOOKS_DIR.mkdir(parents=True, exist_ok=True)
    with open(HOOK_FILE, "wt", encoding=ENCODING) as file:
        file.write(hook_contents)

def patch_features(product: dict[str, Any], config: dict[str, Any]):
    try:
        extra_features = config["extra_features"]
    except KeyError:
        return
    if not extra_features:
        return
    patch_path = DATA_DIR / "features-patch.json"
    patch_data = json_load(patch_path)
    for key in patch_data.keys():
        product[key] = patch_data[key]

def patch_data_dir(product: dict[str, Any], config: dict[str, Any]):
    try:
        use_xdg = config["use_xdg"]
    except KeyError:
        return
    if not use_xdg:
        return
    product["dataFolderName"] = ".local/share/vscodium"

def patch_marketplace(product: dict[str, Any], config: dict[str, Any]):
    try:
        marketplace = config["extensions_source"]
    except KeyError:
        return
    gallery = {}
    domains_remove = False
    match marketplace:
        case "openvsx":
            gallery = EXTENSIONS_OPENVSX_GALLERY
        case "microsoft":
            gallery = EXTENSIONS_MS_GALLERY
            domains_remove = True
        case _:
            einfo("Invalid marketplace:", marketplace)
            return
    if gallery:
        product["extensionsGallery"] = gallery
    tdkey = "linkProtectionTrustedDomains"
    if domains_remove:
        cur_domains: list[str] = product[tdkey]
        for domain in EXTENSIONS_OPENVSX_TRUSTED:
            cur_domains.remove(domain)
        if not cur_domains:
            product.pop(tdkey)
        else:
            product[tdkey] = cur_domains

def patch_pkg(pkg: str, editor_path: Path, config: dict[str, Any]):
    product_path = editor_path / "resources/app/product.json"
    product = json_load(product_path)
    # Patch 1: Features
    patch_features(product, config)
    # Patch 2: Data dir
    patch_data_dir(product, config)
    # Patch 3: Marketplace
    patch_marketplace(product, config)
    json_save(product_path, product, indent=2)

def patch_pkgs():
    changed_packages = [
        line.strip()
        for line in sys.stdin
    ]
    if not changed_packages:
        return
    packages: dict[str, str] = CONFIG["packages"]
    changed_packages = [
        pkg
        for pkg in changed_packages
        if pkg in packages.keys()
    ]
    config = CONFIG["patch"]
    for pkg in changed_packages:
        einfo("Patching", pkg)
        patch_pkg(pkg, Path(packages[pkg]), config)

def main():
    argparse()
    match COMMAND:
        case "hook":
            install_hook()
        case "patch":
            patch_pkgs()
        case _:
            sys.exit(1)

if __name__ == "__main__":
    main()
