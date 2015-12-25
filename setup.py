from setuptools import setup
from distutils.extension import Extension

include_dirs = ['/usr/include', '.']
library_dirs = ['/usr/lib', '.']
libraries = ['boost_python', 'leveldb']
define_macros = [("LINUX", None), ("_LINUX", None), ("LEVELDB_PLATFORM_POSIX", None),
                    ('OS_LINUX', None)]
extra_compile_args = ['-std=c++11', '-fPIC', "-DDLLX="]
runtime_library_dirs = ['/usr/lib']
extra_link_args = ['-v']
files = ["leveldb_mcpe.cpp"]

setup(name="leveldb_python_wrapper",
      packages = ['leveldb_mcpe'],
      package_dir = {'leveldb_mcpe': ''},
      ext_modules=[
          Extension(
              "leveldb_mcpe",
              files,
              library_dirs=library_dirs,
              libraries=libraries,
              include_dirs=include_dirs,
              depends=[],
              define_macros=define_macros,
              extra_compile_args=extra_compile_args,
              extra_link_args=extra_link_args,
              runtime_library_dirs=runtime_library_dirs)
      ]
      )
