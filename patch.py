#!/usr/bin/env python
from sys import argv, stderr, stdout
from json import load, dump

PRODUCT_JSON = "/usr/share/vscodium-translucent/resources/app/product.json"

if __name__ == "__main__":
    with open(PRODUCT_JSON) as f:
        product = load(f)

    if "-R" in argv:
        product["extensionsGallery"] = {
            "serviceUrl": "https://open-vsx.org/vscode/gallery",
            "itemUrl": "https://open-vsx.org/vscode/item",
        }
        product["linkProtectionTrustedDomains"] = ["https://open-vsx.org"]
    else:
        product["extensionsGallery"] = {
            "serviceUrl": "https://marketplace.visualstudio.com/_apis/public/gallery",
            "cacheUrl": "https://vscode.blob.core.windows.net/gallery/index",
            "itemUrl": "https://marketplace.visualstudio.com/items",
        }
        product.pop("linkProtectionTrustedDomains", None)

    with open(PRODUCT_JSON, "w") as f:
        dump(product, f, indent=2)

    print(f"Patched {PRODUCT_JSON}", file=stdout)
