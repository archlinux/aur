# -*- coding: utf-8 -*-
#
# you can install this to a local test virtualenv like so:
#   virtualenv venv
#   ./venv/bin/pip install --editable .
#   ./venv/bin/pip install --editable .[dev]  # with dev requirements, too

from setuptools import setup

from lynda import __version__


def read_file(filename, alt=None):
    """
    Read the contents of filename or give an alternative result instead.
    """
    lines = None

    try:
        with open(filename) as f:
            lines = f.read()
    except IOError:
        lines = [] if alt is None else alt
    return lines


requirements = read_file('requirements.txt')

trove_classifiers = [
    'Development Status :: 4 - Beta',
    'Environment :: Console',
    'Intended Audience :: End Users/Desktop',
    'License :: OSI Approved :: MIT License',
    'Operating System :: OS Independent',
    'Programming Language :: Python :: 2',
    'Programming Language :: Python :: 2.7',
    'Programming Language :: Python :: 3',
    'Programming Language :: Python :: 3.4',
    'Programming Language :: Python :: 3.5',
    'Programming Language :: Python :: 3.6',
    'Programming Language :: Python :: 3.7',
    'Programming Language :: Python :: Implementation :: CPython',
    'Programming Language :: Python :: Implementation :: PyPy',
    'Programming Language :: Python',
    'Topic :: Education',
]

setup(
    name='lynda-dl',
    version=__version__,
    maintainer='Nasir Khan',
    maintainer_email='r0oth3x49@gmail.com',

    license='MIT',
    url='https://github.com/r0oth3x49/lynda-dl',

    install_requires=requirements,

    description='A cross-platform python based utility to download courses from lynda for personal offline use.',
    keywords=['lynda-dl','lynda', 'download', 'education', 'video'],
    classifiers=trove_classifiers,

    packages=["lynda", "lynda._colorized"],
    entry_points=dict(
        console_scripts=[
            'lynda-dl=lynda.lynda_dl:main'
        ]
    ),

    platforms=['any'],
)
