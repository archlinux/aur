import sys
from setuptools import setup

dependencies = ['waitress', 'jedi', 'bottle']

if sys.version_info[:2] == (2, 6):
    dependencies.append('argparse')

setup(
    name='jedihttp',
    version='0.0.1',
    description='Simple http wrapper around jedi',
    url='https://github.com/vheon/JediHTTP/',
    author='Andrea Cedraro',
    author_email='a.cedraro@gmail.com',
    packages=['jedihttp'],

    classifiers=[
        'Topic :: Text Editors',
        'Development Status :: 5 - Production/Stable',
        'Environment :: Console',
        'License :: OSI Approved :: Apache Software License',
        'Programming Language :: Python :: 2.6',
        'Programming Language :: Python :: 2.7',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.3',
        'Programming Language :: Python :: 3.4',
        'Programming Language :: Python :: 3.5',
    ],

    scripts=['jedihttp-main.py'],
    install_requires=dependencies,
)
