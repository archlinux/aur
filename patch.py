#!/usr/bin/env python
"""Switch Devin Desktop's extension gallery to the VS Code Marketplace.

patch.py      save the current gallery in cache.json, then set the VS Code one
patch.py -R   put back the gallery saved in cache.json (Devin's default if missing)
"""
from os import path
from sys import argv, stderr
from json import load, dump, JSONDecodeError

# devin-desktop moved from /usr/share to /opt in 3.11.238; keep the old path as fallback.
PRODUCT_CANDIDATES = (
    "/opt/devin-desktop/resources/app/product.json",
    "/usr/share/devin-desktop/resources/app/product.json",
)
CACHE_PATH = "/usr/share/devin-marketplace/cache.json"

VSCODE_GALLERY = {
    "serviceUrl": "https://marketplace.visualstudio.com/_apis/public/gallery",
    "cacheUrl": "https://vscode.blob.core.windows.net/gallery/index",
    "itemUrl": "https://marketplace.visualstudio.com/items",
}
# Shipped by Devin Desktop; used only when no cache.json exists.
DEVIN_DEFAULT_GALLERY = {
    "serviceUrl": "https://marketplace.windsurf.com/vscode/gallery",
    "itemUrl": "https://marketplace.windsurf.com/vscode/item",
    "controlUrl": "https://marketplace.windsurf.com/vscode/extensions-control",
}
# Versions <= 1.2.1 wrote Open VSX on restore: never treat it as the original.
NOT_ORIGINAL = ("marketplace.visualstudio.com", "open-vsx.org")


def is_original(gallery):
    url = (gallery or {}).get("serviceUrl", "")
    return bool(url) and not any(host in url for host in NOT_ORIGINAL)


def main():
    product_path = next((p for p in PRODUCT_CANDIDATES if path.isfile(p)), None)
    if product_path is None:
        print("devin-marketplace: product.json not found (looked in: %s), skipping"
              % ", ".join(PRODUCT_CANDIDATES), file=stderr)
        return 0
    try:
        with open(product_path) as file:
            product = load(file)
    except JSONDecodeError:
        print("devin-marketplace: couldn't parse %s" % product_path, file=stderr)
        return 1

    if "-R" in argv:
        gallery = DEVIN_DEFAULT_GALLERY
        if path.isfile(CACHE_PATH):
            try:
                with open(CACHE_PATH) as file:
                    cached = load(file).get("extensionsGallery")
                if is_original(cached):
                    gallery = cached
            except (JSONDecodeError, AttributeError):
                pass
        product["extensionsGallery"] = gallery
    else:
        current = product.get("extensionsGallery")
        if is_original(current):
            with open(CACHE_PATH, mode="w") as file:
                dump({"extensionsGallery": current}, file, indent=2)
        product["extensionsGallery"] = VSCODE_GALLERY

    with open(product_path, mode="w") as file:
        dump(product, file, indent=2)
    return 0


if __name__ == "__main__":
    exit(main())
