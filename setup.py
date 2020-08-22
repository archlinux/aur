import re
import os
from pathlib import Path

from setuptools import find_packages, setup


project_root = Path(os.getcwd())


def get_version():
    init_contents = (project_root / "argparse_utils/__init__.py").read_text(encoding="utf-8")

    return re.search(r"^__version__ = ['\"]([^'\"]*)['\"]", init_contents, re.M).group(
        1
    )


def get_long_description():
    return (project_root / "README.md").read_text(encoding="utf-8")


setup(
    name='argparse_utils',
    version=get_version(),
    packages=find_packages(include=('argparse_utils', 'argparse_utils.*')),
    setup_requires=["wheel"],

    author='Robert Wright',
    author_email='madman.bob@hotmail.co.uk',

    description='A collection of utilities for the Python standard-library argparse module',
    long_description=get_long_description(),
    long_description_content_type='text/markdown',
    url='https://github.com/madman-bob/python-argparse-utils',
    license='MIT',
    classifiers=[
        'License :: OSI Approved :: MIT License',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.5',
        'Programming Language :: Python :: 3.6',
        'Programming Language :: Python :: 3.7',
        'Programming Language :: Python :: 3.8',
    ],
    python_requires='>=3.5',
)
