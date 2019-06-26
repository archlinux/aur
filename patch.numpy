--- python-bufr/bufr/setup.py.org	2019-06-26 11:37:48.737889897 +0200
+++ python-bufr/bufr/setup.py	2019-06-26 11:37:17.287328210 +0200
@@ -22,10 +22,12 @@
 
 import os
 import sys
+import numpy
 from setuptools import setup, Extension 
 
 BUFRFile = Extension('bufr/_BUFRFile',
                      sources = ['bufr/_BUFRFile.c',], 
+                     include_dirs=[numpy.get_include()],
                      extra_compile_args = ['-O3','-g','-fstack-protector-all',
                          '-D_FORTIFY_SOURCE=2'], 
                      extra_link_args = [], 
