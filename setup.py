from setuptools import setup, find_packages

setup(name='python-vlc',
    version = '1.1.0',
    author='Olivier Aubert',
    author_email='olivier.aubert@liris.cnrs.fr',
    url='http://wiki.videolan.org/PythonBinding',
    py_modules=['vlc'],
    keywords = [ 'vlc', 'video' ],
    license = "GPL",
    description = "VLC bindings for python.",
    long_description = """VLC bindings for python.

This module provides ctypes-based bindings for the native libvlc API
(see http://wiki.videolan.org/LibVLC) of the VLC video player.

It is automatically generated from the include files.
""",
    packages=find_packages()
)
