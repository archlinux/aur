#! /usr/bin/env python
import os
from distutils.core import setup, Extension

module = Extension('LeapPython',
                   libraries=['Leap'],
                   library_dirs=['/usr/lib/Leap'],
                   sources=['LeapPython.cpp'])

setup(name='Leap',
      version=os.environ['LEAP_VERSION'],
      ext_modules=[module],
      py_modules=["Leap"])
