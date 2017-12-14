#!/usr/bin/env python2

from setuptools import find_packages, setup

setup(
    name = "wsgidav",
    version = "6.2.2",
    author = "Seafile Ltd.",
    author_email = "info@seafile.com",
    description = ("Seafile webdav server"),
    license = "Apache2",
    url = "https://github.com/haiwen/seafdav",
    packages = find_packages(exclude=["tests.*", "tests", "wsgidav.samples"])
)
