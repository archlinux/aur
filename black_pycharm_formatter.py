#!/usr/bin/env python

import sys
import os

if __name__ == "__main__":
    file_path = sys.argv[1]
    file_ext = file_path.split('.')[-1]
    if file_ext == 'py':
        cmd = '/usr/bin/black -l 88 -S -C' + file_path
    elif file_ext == 'ipynb':
        cmd = '/usr/bin/black -l 88 -S -C' + file_path
        # cmd = 'jupytext ' + file_path + ' --pipe "black -l 88 -S -C {}"'
    elif file_ext == 'sh':
        cmd = '/usr/bin/shfmt -w ' + file_path
    # elif file_ext in ['json', 'yaml', 'yml']:
    #     cmd = '/usr/bin/prettier --print-width 88 --write ' + file_path
    else:
        cmd = 'xte "keydown Control_L" "keydown Alt_L" "keydown Shift_L" "key O" "keyup Control_L" "keyup Alt_L" "keyup Shift_L"'
    os.system(cmd)
