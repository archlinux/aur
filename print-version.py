#!/usr/bin/env python2
"""Print the currently installed django-extensions version.

This script exists soley for the convenience of the package maintainer.

"""
import django_extensions
import sys

print('Python version: {}'.format(sys.version))
print('django-extensions version: {}'.format(django_extensions.VERSION))
