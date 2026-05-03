#!/usr/bin/env python
from sys import argv, stderr
from json import load, dump, JSONDecodeError

PRODUCT_JSON_LOCATIONS = [
    "/usr/share/vscodium-insiders/resources/app/product.json",
    "/usr/share/vscodium-insiders-bin/resources/app/product.json",
    "/usr/share/vscodium-insiders-git/resources/app/product.json"
]

if __name__ == "__main__":
    location = None
    product = None
    for location in PRODUCT_JSON_LOCATIONS:
        try:
            with open(location) as file:
                product = load(file)
            print(f"[INFO] Successfully loaded \"product.json\" from:\n\t\"{location}\"")
            break
        except (JSONDecodeError, FileNotFoundError, IsADirectoryError):
            continue
    else:
        print("[WARN] Failed to find or load a valid \"product.json\" for an Insiders build of VSCodium!", file=stderr)
        print(f"[WARN] Checked the following locations:\n\n{PRODUCT_JSON_LOCATIONS}", file=stderr)
        exit(0)
    if '-R' in argv:
        print("[INFO] Unpatching VSCodium Insiders...")
        product["extensionsGallery"] = {
            "serviceUrl": "https://open-vsx.org/vscode/gallery",
            "itemUrl": "https://open-vsx.org/vscode/item",
        }
        product["linkProtectionTrustedDomains"] = ["https://open-vsx.org"]
    else:
        print("[INFO] Patching VSCodium Insiders...")
        product["extensionsGallery"] = {
            "serviceUrl": "https://marketplace.visualstudio.com/_apis/public/gallery",
            "cacheUrl": "https://vscode.blob.core.windows.net/gallery/index",
            "itemUrl": "https://marketplace.visualstudio.com/items"
        }
        product.pop("linkProtectionTrustedDomains", None)
    with open(location, mode='w') as file:
        dump(product, file, indent=4)
    print("[INFO] Finished patching/unpatching VSCodium Insiders!")
