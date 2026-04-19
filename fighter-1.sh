#!/usr/bin/env python3
import sys
import os
os.chdir("/usr/share/fighter-1")
sys.path.insert(0, "/usr/share/fighter-1")
if __name__ == "__main__":
    from fighter.app import main
    raise SystemExit(main())