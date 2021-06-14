#!/usr/bin/python

import importlib, pprint, sys

pprint.pprint(sys.path)

name = "mwparserfromhell"

try:
    importlib.import_module(name)
    print("import success: " + name)
except ImportError:
    print("import error: " + name)
