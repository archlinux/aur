#!/usr/bin/env python3
# 更新 product.json 中 workbench.desktop.main.js 的 MD5-base64 校验值。
# 用法：fix_checksum.py <product.json> <workbench.desktop.main.js>
import json, hashlib, base64, sys

key = 'vs/workbench/workbench.desktop.main.js'
with open(sys.argv[2], 'rb') as f:
    new_sum = base64.b64encode(hashlib.md5(f.read()).digest()).decode().rstrip('=')
product = json.load(open(sys.argv[1]))
product['checksums'][key] = new_sum
with open(sys.argv[1], 'w') as f:
    json.dump(product, f, indent='\t', ensure_ascii=False)
