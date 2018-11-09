#!/usr/bin/env python
# -*- coding: utf-8 -*-
from setuptools import setup

setup(
    name='ogr2osm',
    version='0.1',
    author='pnorman',
    author_email='penorman@mac.com',
    description="pnorman's version of UVM's Rewrite of ogr2osm",
    license='MIT',
    url='https://github.com/pnorman/ogr2osm/',
    install_requires=[
        'GDAL'
    ],
    py_modules=[
        'ogr2osm',
        'geom',
    ],
    entry_points={
        'console_scripts': [
            'ogr2osm=ogr2osm:main',
        ]
    }
)
