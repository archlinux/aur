#!/usr/bin/env python2

from distutils.core import setup
from fnmatch        import fnmatch
import os

def listfiles(*dirs):
	dir, pattern = os.path.split(os.path.join(*dirs))
	return [os.path.join(dir, filename)
	for filename in os.listdir(os.path.abspath(dir))
	   if filename[0] != '.' and fnmatch(filename, pattern)]

setup(
	name             = 'iwscanner',
	version          = '0.2.4',
	description      = 'Wireless Scanner',
	long_description = "Wireless scanner for linux with an easy to use graphic interface",
	author           = 'Renzo Bertuzzi (kuthulu)',
	author_email     = 'iwscanner@kuthulu.com',
	url              = 'http://www.kuthulu.com/iwscanner',
	platforms        = 'linux',
	license          = 'LGPL-2.1+',
	scripts          = ['../../iwscanner'],
	data_files       = [
	                   ('/usr/share/iwscanner/', [ 'iwscanner.glade' ] ),
			   ('/usr/share/iwscanner/', [ 'iwscanner.py' ] ),
			   ('/usr/share/iwscanner/', [ 'SimpleGladeApp.py' ] ),
			   ('/usr/share/iwscanner/',[ 'iwscanner.png' ] ),
			   ('/usr/share/pixmaps/', [ 'iwscanner.png' ] )
			   ],
	)


