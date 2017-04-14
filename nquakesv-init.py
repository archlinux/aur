#!/usr/bin/env python3

import os
import pwd
import datetime
import json
import subprocess

timestamp = datetime.datetime.now().strftime('%Y.%m.%d_%H%M.%S')
user = pwd.getpwuid(os.geteuid()).pw_name
homedir = os.environ['HOME']
nquakedir = homedir + '/.nquakesv'

def getVer():
    try:
        ver = 'unknown'
        pkginfo = subprocess.check_output(['pacman', '-Qi', 'nquakesv']).decode('utf-8').splitlines()
        for line in pkginfo:
            if line.startswith('Version'):
                ver = line.split(':')[1].strip()
                break
    except:
        ver = 'unknown'
    return(ver)

def makeDir(path, dest = False):
    pass

def buildRootdir(ver = False):
    if ver == False:
        ver = getVer()
    # Overwriting is bad, mmk?
    if os.path.isdir(nquakedir):
        os.move(nquakedir, '{0}.bak_{1}'.format(nquakedir, timestamp))
    os.makedirs(nquakedir, exist_ok = True)
    # Generated from a vanilla from-"source" nquakesv install
    # and a "tree -d -J -a --noreport" run inside the directory.
    # We only fetch the "contents" key as the first level is '.'
    with open('/usr/share/nquakesv/dirtree.json', 'r') as raw:
        dirtree = json.loads(raw.read())[0]['contents']
    with open(nquakedir + '/VERSION', 'w') as f:
        f.write('Generated on nquakesv package version {0}\n'.format(ver))
    # We dont need these dirs.
    direxcludes = ['addons', 'run']
    dirlinks = ['id1']
    # Walk the paths and build the tree.
    for pathspec in dirtree:
        if pathspec['name'] in direxcludes:
            continue
        if pathspec['name'] in dirlinks:
            src = '/usr/share/nquakesv/
            dest = 
            os.symlink()
        if pathspec['type'] == 'link':
            

def main():
    pass

if __name__ == '__main__':
    main()
