#!/usr/bin/env python
"""Print the Python and python-django-tables2 versions.

This script exists soley for the convenience of the package maintainer.

"""
import django_tables2
import sys

print('Python version: {}'.format(sys.version))
print('django-extensions version: {}'.format(django_tables2.__version__))
