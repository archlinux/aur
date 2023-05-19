#!/usr/bin/python3

import glob
import re
import shlex
import shutil

from os import path

from xdg import BaseDirectory
from xdg.DesktopEntry import DesktopEntry

# allow matching empty envs with .*
env_re = re.compile(r'\w+=.*')

def find_missing_desktop_files(desktop_dir: str):
	for df in glob.iglob('*.desktop', root_dir=desktop_dir):
		de = DesktopEntry(path.join(desktop_dir, df))
		if exc := (de.getTryExec() or de.getExec()):
			cmd = shlex.split(exc)
			if cmd[0] == 'exec':
				cmd = cmd[1:]
			if cmd[0] == 'env':
				cmd = cmd[1:]

			for tok in cmd:
				# ignore all attempts to set environment variables
				if not env_re.match(tok):
					if not shutil.which(tok):
						yield shlex.quote(de.getFileName())
					break

def find_desktop_directories():
	"""
	https://wiki.archlinux.org/title/desktop_entries#Modify_desktop_files
	https://wiki.archlinux.org/title/XDG_Autostart#Directories
	"""
	yield from BaseDirectory.load_data_paths('applications')
	yield from BaseDirectory.load_config_paths('autostart')

# TODO add option to respect NotShowIn and NoDisplay options
if __name__ == '__main__':
	for d in find_desktop_directories():
		for df in find_missing_desktop_files(d):
			print (df)
