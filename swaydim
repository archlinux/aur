#!/usr/bin/python3
#
# Dims your display using brightnessctl
#

import subprocess
import os
import sys

default_multiplier = 0.1

def run(cmd):
    print(cmd)
    process = subprocess.run(
        cmd.split(" "),
        capture_output=True,
        text = True
    )
    return process.stdout.strip("\n")

def brightnessctl(args):
    template = "brightnessctl {args}"
    cmd = template.format(
        args = args
    )
    return run(cmd)

def multiplier():
    if len(sys.argv) == 2:
        return float(sys.argv[1])
    else:
        return float(default_multiplier)

path = "/tmp/brightness-" + str(multiplier())

if os.path.exists(path):
    with open(path, "r") as file:
        brightnessctl("set {brightness}".format(brightness=file.readlines()[0]))
    os.remove(path)
else:
    current_brightness = brightnessctl("get")
    
    with open(path, "w") as file:
        file.write(current_brightness)

    new_brightness = int(current_brightness) * multiplier()
    brightnessctl("set {new_brightness}".format(new_brightness=new_brightness))
