#!/usr/bin/env python
from sys import argv
from json import load, dump, JSONDecodeError

# In order of decreasing priority
PRODUCT_JSON_LOCATIONS = (
    "/usr/lib/vscodium-electron/app/product.json",
    "/usr/lib/vscodium-electron/product.json"
)


if __name__ == "__main__":
    for location in PRODUCT_JSON_LOCATIONS:
        try:
            with open(location) as file:
                product = load(file)
        except JSONDecodeError:
            print(f"Error: couldn't parse {location} or fetch a new one from the web")
            exit(1)
        except FileNotFoundError:
            print(f"File {location} not found, attempting next location")
            continue

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

        with open(location, mode='w') as file:
            dump(product, file, indent=2)
            break
