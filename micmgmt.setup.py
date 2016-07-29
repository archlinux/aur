from setuptools import setup

NAME = 'micmgmt'
DESC = '''
Python interface to channel all communications to specified
Intel(R) Xeon Phi(TM) Coprocessor.
'''

setup(name=NAME, description=DESC.strip(),
    version='@PKGVER@',
    license="LGPLv2+",
    packages=[NAME])
