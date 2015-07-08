#!/usr/bin/env python
"""Print the Factory Boy version.

This script exists soley for the convenience of the package maintainer.

"""
import factory
import sys

print('Python version: {}'.format(sys.version))
print('Factory Boy version: {}'.format(factory.__version__))
