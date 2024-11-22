#!/usr/bin/env python

# need python-packaging

import sys
import platform
import argparse
from packaging.requirements import Requirement

def filter_requirements(file_path):
    current_python = f"{sys.version_info.major}.{sys.version_info.minor}"
    current_system = platform.system()

    with open(file_path, "r") as f:
        lines = f.readlines()

    filtered = []
    for line in lines:
        line = line.strip()
        if not line or line.startswith("#"):
            continue

        try:
            req = Requirement(line)
            if req.marker:
                if not req.marker.evaluate({"python_version": current_python, "sys_platform": current_system}):
                    continue
            filtered.append(line)
        except Exception as e:
            print(f"{line}, error: {e}")

    return filtered

def main():
    parser = argparse.ArgumentParser(description="filter requirements.txt")
    parser.add_argument("file", help="path to requirements.txt")
    args = parser.parse_args()

    filtered_reqs = filter_requirements(args.file)
    print("\n".join(filtered_reqs))

if __name__ == "__main__":
    main()
