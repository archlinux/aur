#!/usr/bin/env python3

import sys
import json
import os

file_path = sys.argv[1]

with open(file_path, "r") as rfile:
    data = json.load(rfile)
data["contributes"]["configuration"]["properties"]["go.goplsPath"]["default"] = "/usr/bin/gopls"
with open(file_path, "w") as wfile:
    json.dump(data, wfile, indent='\t')
