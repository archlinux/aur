#!/usr/bin/env python
from os.path import isfile
from sys import argv, stderr
from json import load, dump, JSONDecodeError

# devin-desktop moved from /usr/share to /opt in 3.11.238; keep the old path as fallback.
PRODUCT_CANDIDATES = (
    "/opt/devin-desktop/resources/app/product.json",
    "/usr/share/devin-desktop/resources/app/product.json",
)
PRODUCT_JSON_LOCATION = next((p for p in PRODUCT_CANDIDATES if isfile(p)), None)


if __name__ == "__main__":
    if PRODUCT_JSON_LOCATION is None:
        print("devin-marketplace: product.json not found (looked in: %s), skipping"
              % ", ".join(PRODUCT_CANDIDATES), file=stderr)
        exit(0)
    try:
        with open(PRODUCT_JSON_LOCATION) as file:
            product = load(file)
    except JSONDecodeError:
        print(
            "error: couldn't parse local product.json or fetch a new one from the web")
        exit(1)
    if '-R' in argv:
        product["extensionsGallery"] = {
            "serviceUrl": "https://open-vsx.org/vscode/gallery",
            "itemUrl": "https://open-vsx.org/vscode/item",
        }
        product["linkProtectionTrustedDomains"] = ["https://open-vsx.org"]
    else:
        product["extensionsGallery"] = {
            "serviceUrl": "https://marketplace.visualstudio.com/_apis/public/gallery",
            "cacheUrl": "https://vscode.blob.core.windows.net/gallery/index",
            "itemUrl": "https://marketplace.visualstudio.com/items"
        }
        product.pop("linkProtectionTrustedDomains", None)

    with open(PRODUCT_JSON_LOCATION, mode='w') as file:
        dump(product, file, indent=2)
