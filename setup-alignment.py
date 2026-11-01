from setuptools import Extension, setup
from Cython.Build import cythonize

setup(ext_modules=cythonize(
    [Extension('q2_feature_classifier._primer_alignment_c',
               ['q2_feature_classifier/_primer_alignment_c.pyx'])],
    build_dir='build/cython'))
