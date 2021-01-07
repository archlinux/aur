#!/usr/bin/env python

import sys
import os

if __name__ == "__main__":
    file_path = sys.argv[1]
    file_ext = file_path.split('.')[-1]
    if file_ext == 'py':
        cmd = 'black -l 90 -S ' + file_path
    elif file_ext == 'ipynb':
        cmd = 'jupytext ' + file_path + ' --pipe "black -l 90 -S {}"'
    elif file_ext == 'sh':
        cmd = 'shfmt -w ' + file_path
    else:
        sys.exit()
    os.system(cmd)
