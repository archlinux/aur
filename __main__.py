# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD

"""Allow cropgtk.py, which has no entry function, to be used as a
`gui_scripts` entry point."""

import runpy

def main():
    runpy.run_module('cropgui.cropgtk')

if __name__ == '__main__':
    main()
