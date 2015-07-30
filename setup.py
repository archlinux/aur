from setuptools import setup, find_packages

import graphy

setup(
    name = 'graphy',
    version = graphy.__version__,
    description = "graphy",
    long_description = """Graphy is a simple Python library for generating charts. It tries to get out of the way and let you just work with your data. At the moment, it produces charts using the Google Chart API.""",
    author = 'Mark Ivey',
    author_email = 'job@countlessprojects.com',
    url = 'http://code.google.com/p/graphy/',
    license = 'Apache License 2.0',
    platforms = ['any'],
    packages = find_packages(),
    include_package_data = True,
)
