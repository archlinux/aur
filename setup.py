import os
from setuptools import setup, find_packages

# Utility function to read the README file.
# Used for the long_description.  It's nice, because now 1) we have a top level
# README file and 2) it's easier to type in the README file than to put a raw
# string in below ...
def read(fname):
    return open(os.path.join(os.path.dirname(__file__), fname)).read()

setup(
    name = "xyplayer",
    version = "99.0",
    author = "Zheng-Yejian",
    author_email = "andrewjcarter@gmail.com",
    description = ("A simple but feature-rich online musicplayer using pyqt4"),
    license = "GPL",
    keywords = "pyqt4 musicplayer",
    url = "https://github.com/Zheng-Yejian/xyplayer",
    packages=find_packages(),
    long_description=read('README.md'),
    classifiers=[
        "Development Status :: 3 - Alpha",
        "Topic :: Multimedia",
        "License :: OSI Approved :: GPL",
        "Programming Language :: Python :: 3"
    ],
)
