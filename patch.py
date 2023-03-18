#!/usr/bin/env python
from sys import argv
from json import load, dump, JSONDecodeError

PRODUCT_JSON_LOCATION = "/opt/vscodium-bin/resources/app/product.json"


if __name__ == "__main__":
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
