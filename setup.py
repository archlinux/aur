#!/usr/bin/env python3

from setuptools import setup, find_packages

setup(
    name = "sfs_select",
    version = "0.3.1",
    packages = ["sfs_select"],
    package_data = { "": ["gui.ui"] },
    entry_points = { "console_scripts": ["sfs-select = sfs_select:main"] },
    install_requires = ["pyside", "psutil"],
    author = """PsyBlade""",
    description = "A small tool to manage Steam Family Sharing",
    keywords = "steam games",
    license = "None",
    url = "https://www.unix-ag.uni-kl.de/~t_schmid/sfs-select/"
)
