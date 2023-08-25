#!/usr/bin/env python3

import sys
import json
import os

pkt_name = sys.argv[1]
operation = sys.argv[2]

product_path = "/usr/lib/code-server/lib/vscode/product.json"
patch_path = "/usr/share/%s/patch.json" % pkt_name
cache_path = "/usr/share/%s/cache.json" % pkt_name

indent = 2 * ' '

if not os.path.exists(cache_path):
    with open(cache_path, 'w') as file:
        file.write("{}")


def patch():
    with open(product_path, "r") as product_file:
        product_data = json.load(product_file)
    with open(patch_path, "r") as patch_file:
        patch_data = json.load(patch_file)
    cache_data = {}
    for key in patch_data.keys():
        if key in product_data:
            cache_data[key] = product_data[key]
        product_data[key] = patch_data[key]
    with open(product_path, "w") as product_file:
        json.dump(product_data, product_file, indent=indent)
    with open(cache_path, "w") as cache_file:
        json.dump(cache_data, cache_file, indent=indent)


def restore():
    with open(product_path, "r") as product_file:
        product_data = json.load(product_file)
    with open(patch_path, "r") as patch_file:
        patch_data = json.load(patch_file)
    with open(cache_path, "r") as cache_file:
        cache_data = json.load(cache_file)
    for key in patch_data.keys():
        if key in product_data:
            del product_data[key]
    for key in cache_data.keys():
        product_data[key] = cache_data[key]
    with open(product_path, "w") as product_file:
        json.dump(product_data, product_file, indent=indent)
    os.remove(cache_path)


if operation == "patch":
    patch()
elif operation == "restore":
    restore()
