#!/usr/bin/env python

from setuptools import find_packages, setup

setup(
    name = "seafobj",
    version = "11.0.5",
    author = "Seafile Ltd.",
    author_email = "info@seafile.com",
    description = ("Python library for accessing seafile data model"),
    license = "Apache2",
    url = "https://github.com/haiwen/seafobj",
    packages = find_packages(exclude=["test.*", "test"])
)
