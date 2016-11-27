import os
from setuptools import setup, find_packages

def read(fname):
    return open(os.path.join(os.path.dirname(__file__), fname)).read()

setup(
    name = "pugdebug",
    version = ":version:",
    author = "robertbasic",
    description = ("A standalone debugging client for PHP applications."),
    license = "GPLv3+",
    url = "https://github.com/robertbasic/pugdebug",
    packages=find_packages(),
    long_description=read('README.md'),
)
