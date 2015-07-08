#!/usr/bin/env python2
"""Print the Factory Boy version.

This script exists soley for the convenience of the package maintainer.

"""
import factory
import sys

print('Python version: {}'.format(sys.version))
print('Factory Boy version: {}'.format(factory.__version__))
