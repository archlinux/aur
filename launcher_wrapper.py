#!/usr/bin/env python3
import sys
import os

# Run from the share directory
app_dir = "/usr/share/broslauncher"
os.chdir(app_dir)
sys.path.insert(0, app_dir)

from launcher import main

main()
