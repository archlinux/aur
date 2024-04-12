#!/usr/bin/python2
# Since igcc doesn't come with a setup.py, we'll supply our own

from distutils.core import setup

setup(
    name='IGCC',
    version='0.2',
    description='Interactive GCC real-eval-print loop for C and C++ programmers',
    author='Andy Balaam',
    url='https://www.artificialworlds.net/wiki/IGCC/IGCC',
    packages=['libigcc'],
    scripts=['igcc'],
)

