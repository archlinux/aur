#!/usr/bin/env python3

import sys
import json
import os

pkt_name = sys.argv[1]
operation = sys.argv[2]

product_path = "/usr/lib/code/product.json"
patch_path = "/usr/share/%s/patch.json" % pkt_name
cache_path = "/usr/share/%s/cache.json" % pkt_name


class term_colors:
    WARNING = "\033[93m"
    ENDC = "\033[0m"


if not os.path.exists(product_path):
    print(
        term_colors.WARNING
        + "WARN: "
        + term_colors.ENDC
        + product_path
        + " does not exist. You need to install extra/code in the official repository to use this package. Skipping..."
    )
    exit(0)

if not os.path.exists(cache_path):
    with open(cache_path, "w") as file:
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
        json.dump(product_data, product_file, indent="\t")
    with open(cache_path, "w") as cache_file:
        json.dump(cache_data, cache_file, indent="\t")


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
        json.dump(product_data, product_file, indent="\t")


if operation == "patch":
    patch()
elif operation == "restore":
    restore()
