#!/usr/bin/env python3
'''
setup.py

    Installs Kurcoder as a CLI appliation locally

'''

import os
import setuptools

NAME = "kurcoder"
VERSION = "0.0.1"

DESC = "Simple encoder & decoder tool"
REPO = "https://github.com/0xkurome/Kurcoder"

# main
setuptools.setup(
        name = NAME,
        version = VERSION,
        author = "0xkurome",
        description = DESC,
        license = "MIT",
        url=REPO,
        download_url="{}/archive/v{}".format(REPO, VERSION),
        install_requires = [
            "ipcalc",
        ],
        classifiers = [
            "Development Status :: 5 - Production/Stable",
            "Intended Audience :: End Users/Desktop",
            "Environment :: Console",
            "Natural Language :: English",
            "Programming Language :: Python :: 3",
        ]
)
