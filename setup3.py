import os
import os.path
import sys

from distutils import sysconfig
from distutils.core import setup

try:
    import xpybutil
except:
    print('')
    print('pytyle3 requires xpybutil')
    print('See: https://github.com/BurntSushi/xpybutil')
    sys.exit(1)

setup(
    name = 'pytyle3',
    author = 'Andrew Gallant',
    author_email = 'andrew@pytyle.com',
    version = '3.0.0',
    license = 'WTFPL',
    description = 'A new and much more lightweight pytyle that supports Openbox Multihead',
    long_description = 'See README',
    url = 'https://github.com/BurntSushi/pytyle3',
    platforms = 'POSIX',
    packages = ['pt3', 'pt3/layouts'],
    data_files = [('share/doc/pytyle3', ['README', 'COPYING', 'INSTALL']),
                  ('/etc/xdg/pytyle3', 
                   ['config.py', 'keybind.py'])],
    scripts = ['pytyle3']
)

