#!/usr/bin/env python3

import sys
import json
import os

file_path = sys.argv[1]

with open(file_path, "r") as rfile:
    data = json.load(rfile)
data["contributes"]["configuration"]["properties"]["rust-analyzer.server.path"]["default"] = "/usr/bin/rust-analyzer"
with open(file_path, "w") as wfile:
    json.dump(data, wfile, indent='\t')
