#!/usr/bin/env python

from setuptools import setup

setup(name='ghfetch-pip',
      version='1.2.5',
      description='CLI tool to fetch GitHub information',
      author='Nullgaro, Icutum',
      author_email='ghfetch.contact@gmail.com',
      url='https://github.com/ghfetch/ghfetch',
      packages=['ghfetch'],
      install_requires=['pillow', 'aiohttp', 'rich'],
      entry_points={
        'console_scripts': [
            'ghfetch=ghfetch.main:main'
        ]
    },
    )