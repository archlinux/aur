import os
import shutil

from distutils.core import setup

from udemy import __author__
from udemy import __license__
from udemy import __version__

if not os.path.exists('build/_scripts'):
    os.makedirs('build/_scripts')
shutil.copyfile('udemy-dl.py', 'build/_scripts/udemy-dl')

setup(
    name='udemy-dl',
    version=__version__,
    author=__author__,
    license=__license__,
    long_description=open('README.md').read(),
    packages=['udemy', 'udemy._colorized'],
    scripts=['build/_scripts/udemy-dl'],
)
