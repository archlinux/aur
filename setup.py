#!/usr/bin/env python2

from distutils.core import setup

setup(name='PushyBullet',
      version='1.5.4',
      description='PushBullet APIv2 python bindings',
      author='Konstantin Stepanov',
      author_email='me@kstep.me',
      url='http://github.com/kstep/pushybullet/',
      py_modules=['pushybullet'],
      install_requires=[
          #'requests>=2.3.0',
          #'websocket-client>=0.12.0',
          #'dateutil>=2.2',
          #'magic>=5.18',
          ],
      scripts=['pb'],
      classifiers=[
          'Topic :: Software Development :: Libraries',
          'Topic :: Utilities',
          'Topic :: Internet',
          'Development Status :: 4 - Beta',
          'Environment :: Console',
          ])
