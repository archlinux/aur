#!/usr/bin/env python3
# A quick n dirty script to compute Fortran module dependencies for a Makefile.
import os, re, sys

def obj_path(f_path):
    return os.path.splitext(f_path)[0] + ".o"

module_paths = []
use_path_by_module = {}
for path in sys.argv[1:]:
    with open(path) as f:
        for line in f:
            line = line.lower().strip()
            if match := re.search(r"^use\s+(\w+)", line):
                [module] = match.groups()
                use_path_by_module.setdefault(module, set()).add(path)
            elif match := re.search(r"^module\s+(\w+)", line):
                [module] = match.groups()
                module_paths.append((module, path))

targets_by_prerequisite = {}
for module, module_path in module_paths:
    for use_path in use_path_by_module[module]:
        if use_path != module_path:
            targets_by_prerequisite.setdefault(
                obj_path(module_path),
                set(),
            ).add(obj_path(use_path))

for prerequisite, targets in sorted(targets_by_prerequisite.items()):
    print(f"{' '.join(sorted(targets))}: {prerequisite}")
