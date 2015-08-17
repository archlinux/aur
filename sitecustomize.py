#!/usr/bin/python3

import os, sys

cur_path = os.path.dirname(os.path.realpath(__file__))
path_segments = []
for segment in reversed(cur_path.lstrip("/").split("/")):
    path_segments.insert(0, segment)
    if segment == "lib":
        path_segments.insert(0, "local")

sys.path.insert(0, "/" + os.path.join(*path_segments))
path_segments.pop()
sys.path.insert(1, "/" + os.path.join(*path_segments))
