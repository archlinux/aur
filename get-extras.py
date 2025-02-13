#!/bin/python

from ast import Call, Name, parse, walk

with open("setup.py") as f:
    setup = f.read()
    tree = parse(setup)
    for parent in walk(tree):
        if isinstance(parent, Call) and isinstance(parent.func, Name) and parent.func.id == "setup":
            for child in parent.keywords:
                if child.arg == "extras_require":
                    print(",".join(key.value for key in child.value.keys))
