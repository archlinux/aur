#!/usr/bin/env python3

import sys
import os
import subprocess
import re
from collections import defaultdict

variables = {}
targets = {}
dependencies = defaultdict(list)

def substitute_vars(line):
    for var, val in variables.items():
        line = line.replace(f"${var}", val)
    return line

def run_command(cmd):
    try:
        subprocess.run(cmd, shell=True, check=True)
    except subprocess.CalledProcessError as e:
        print(f"[HemeshP] Command failed: {cmd}")
        sys.exit(1)

def parse_line(line, inside_target=None):
    line = line.strip()
    if not line or line.startswith("#"):
        return None

    line = substitute_vars(line)

    if line.startswith("say "):
        print(line[4:].strip('" '))
    elif line.startswith("run "):
        cmd = line[4:].strip('" ')
        run_command(cmd)
    elif line.startswith("set "):
        match = re.match(r"set (\w+) *= *[\"'](.+)[\"']", line)
        if match:
            variables[match.group(1)] = match.group(2)
    else:
        return line  # return any leftover line for further processing

def parse_target_header(line):
    # Example: target build depends clean {
    match = re.match(r"target (\w+)(?: depends ([\w ]+))? *{", line)
    if not match:
        return None, []
    name = match.group(1)
    deps = match.group(2).split() if match.group(2) else []
    return name, deps

def interpret_file(file_path):
    with open(file_path) as f:
        lines = f.readlines()

    current_target = None
    collecting_block = False
    block_lines = []

    for line in lines:
        stripped = line.strip()
        if stripped.startswith("target "):
            current_target, deps = parse_target_header(stripped)
            dependencies[current_target].extend(deps)
            block_lines = []
            collecting_block = True
        elif stripped == "}":
            if current_target:
                targets[current_target] = block_lines[:]
                current_target = None
                block_lines = []
                collecting_block = False
        elif collecting_block:
            block_lines.append(line)
        else:
            parse_line(line)

def execute_target(name, visited=set()):
    if name in visited:
        return
    visited.add(name)
    for dep in dependencies.get(name, []):
        execute_target(dep, visited)

    if name in targets:
        print(f"[HemeshP] Running target: {name}")
        for line in targets[name]:
            parse_line(line)

def main():
    if len(sys.argv) < 3:
        print("Usage: hemeshp <script.hp> <target>")
        sys.exit(1)

    script = sys.argv[1]
    target = sys.argv[2]

    interpret_file(script)
    execute_target(target)

if __name__ == "__main__":
    main()
