#!/usr/bin/env python3

import json
import sys
from pathlib import Path

PRODUCT_JSON_PATH = Path("/usr/lib/code/product.json")

EXTENSION_GALLERY_CODE_OSS = {
    "serviceUrl": "https://open-vsx.org/vscode/gallery",
    "itemUrl": "https://open-vsx.org/vscode/item",
}
EXTENSION_GALLERY_VSCODE = {
    "serviceUrl": "https://marketplace.visualstudio.com/_apis/public/gallery",
    "cacheUrl": "https://vscode.blob.core.windows.net/gallery/index",
    "itemUrl": "https://marketplace.visualstudio.com/items",
}


def main():
    try:
        with PRODUCT_JSON_PATH.open() as file:
            product = json.load(file)
    except json.JSONDecodeError as exc:
        sys.exit(
            f"error: couldn't parse local product.json or fetch a new one from the web: {exc}"
        )

    if "-R" in sys.argv:
        product["extensionsGallery"] = EXTENSION_GALLERY_CODE_OSS
        product["linkProtectionTrustedDomains"] = ["https://open-vsx.org"]
    else:
        product["extensionsGallery"] = EXTENSION_GALLERY_VSCODE
        product.pop("linkProtectionTrustedDomains", None)

    with PRODUCT_JSON_PATH.open(mode="w") as file:
        json.dump(product, file, indent=2)


if __name__ == "__main__":
    main()
