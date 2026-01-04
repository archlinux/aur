#!/usr/bin/env python
from sys import argv, stderr, stdout
from json import load, dump, JSONDecodeError

PRODUCT_JSON_LOCATIONS = tuple((
    "/usr/share/vscodium/resources/app/product.json",
    "/usr/share/vscodium-bin/resources/app/product.json",
    "/usr/share/vscodium-git/resources/app/product.json",
    "/usr/share/vscodium-insiders/resources/app/product.json",
    "/usr/share/vscodium-insiders-bin/resources/app/product.json",
    "/usr/share/vscodium-insiders-git/resources/app/product.json",
    "/usr/share/vscodium-electron/resources/app/product.json",
    "/usr/share/vscodium-electron-bin/resources/app/product.json",
))

PRODUCT_LOCATION = None
product = None

if __name__ == "__main__":
    for PRODUCT_JSON_LOCATION in PRODUCT_JSON_LOCATIONS:
        try:
            with open(PRODUCT_JSON_LOCATION) as file:
                product = load(file)
            # Success! Break the loop.
            # PRODUCT_JSON_LOCATION now holds the correct path.
            print(f"Valid product configuration found in:\n\t{PRODUCT_JSON_LOCATION}", file=stdout)
            break
        except (JSONDecodeError, FileNotFoundError, IsADirectoryError):
            continue
    else:
        # This block executes only if the loop finished WITHOUT hitting 'break'
        print(f"Error: No valid product configuration found in:\n\t{PRODUCT_JSON_LOCATIONS}", file=stderr)
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
