#!/usr/bin/python
#
#       apbp.py
#
#       Copyright 2010 Alexander Preisinger <alexander.preisinger@gmail.com>
#
#       This program is free software; you can redistribute it and/or modify
#       it under the terms of the GNU General Public License as published by
#       the Free Software Foundation; either version 2 of the License, or
#       (at your option) any later version.
#
#       This program is distributed in the hope that it will be useful,
#       but WITHOUT ANY WARRANTY; without even the implied warranty of
#       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#       GNU General Public License for more details.
#
#       You should have received a copy of the GNU General Public License
#       along with this program; if not, write to the Free Software
#       Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#       MA 02110-1301, USA.

__version__ = "1.0"

import os
import os.path
import sys
import tarfile
import datetime
from optparse import OptionParser

# Cron fix
if 'XDG_DATA_HOME' not in os.environ:
    os.environ['XDG_DATA_HOME'] = os.path.join(os.environ['HOME'], \
        '.local/share')
# Cron fix

_ex = os.path.exists
_abs = os.path.abspath
_isdir = os.path.isdir
_dpath = _abs(os.path.join(os.environ['XDG_DATA_HOME'], 'apbp')) + os.sep
_trust = _dpath+'.SECURE'

if not _ex(_dpath):
    os.makedirs(_dpath)

with open(_dpath+'.SECURE', 'w') as trusted_file:
    pass


optparser = OptionParser("""\n{name} [OPTIONS] [ADDITIONAL-FILES]
{name} -x ARCHIVE FILES
{name} -c CONFIG-FILE [ADDITIONAL-FILES]""".format(name=sys.argv[0]))

optparser.add_option("-c", "--config", dest="config", \
    help="use a config", metavar="FILENAME")

optparser.add_option("-x", "--archive", dest="archive", \
    help="choose an archive (gzip, bzip2)", metavar="TAR-ARCHIVE")

optparser.add_option("-i", "--ignore", dest="ignore", \
    help="""ignores files in the given path
use comma to sepperate paths (e.g. FILE1,PATH1,FILE2,...)""", metavar="FILE")

optparser.add_option("-r", "--restore", dest="restore", \
    help="restores the saved data, will overwrite the original files", \
    metavar="TAR-ARCHIVE")

optparser.add_option("-s", "--separator", dest="separator", \
    help="use a different separator for lists of files", metavar="CHAR")

optparser.add_option("-v", "--verbose", action="store_true", dest="verbose",
    default=False, help="verbose output")


def get_config(filename, separator):
    """
    Reads the lines from the given file and checks if these lines are valid.
    """
    configs = {'separator' : separator}

    filename = _abs(filename)
    if _ex(filename):
        cfile = open(filename, 'r')

        for line in cfile.readlines():
            line = line.strip()

            if line.startswith('#') or line == '':
                continue
            else:

                if line == 'replace':
                    try:
                        key, value = line.split('=')
                    except ValueError:
                        key = line
                        value = 1

                else:
                    try:
                        key, value = line.split('=')

                    except ValueError:
                        optparser.error('{file} contains an invalid line'\
                            .format(file=filename))

                    key = key.strip()
                    value = value.strip()

                    if key == 'files' or key == 'ignore':

                        if configs['separator'] in value:
                            value = value.split(configs['separator'])
                        else:
                            value = [value]

                configs[key] = value

        cfile.close()

        return configs

    else:
        optparser.error('{file} does not exist'.format(file=filename))


def abs_and_check(files):
    """
    Returns the files with the absolute pathname and checks if the file exists.
    """
    files = [_abs(file) for file in files]

    for file in files:
        if not _ex(file):
            optparser.error('{file} does not exist'.format(file=file))

    return files


def subdir(files):
    """
    Checks if the file is a directory. If true then the directory will be
    removed from the filelist and its files will be added and also this files
    will be checked if they are directories and so on.
    """
    for file in files:

        if _isdir(file):
            files.remove(file)

            if not file.endswith(os.sep):
                file = file + os.sep

            subfiles = [file+subfile for subfile in os.listdir(file)]
            files.extend(subdir(subfiles))

    return files


def get_files(afiles, ignore):
    """
    Removes the ignored files form the file list.
    """
    afiles = abs_and_check(afiles)
    ignore = abs_and_check(ignore)

    afiles = subdir(afiles)

    nfiles = []
    for file in afiles:
        IGN = False

        for ign in ignore:
            if file.startswith(ign):
                IGN = True

        if not IGN:
            nfiles.append(file)

    return nfiles


def archive(archive_name, files, verbose=False):
    """
    Finally archives the file under the given name
    """
    archive_type = archive_name.split('.')[-1]

    if archive_type != 'gz' and archive_type != 'bz2':
        optparser.error('the archive has to be a *.tar.gz or a *.tar.bz2 file')

    archive_file = tarfile.open(archive_name, 'w:%s' % archive_type)

    for file in files:

        if verbose:
            print(file)

        archive_file.add(file)

    archive_file.add(_trust, os.path.basename(_trust))

    archive_file.close()


def main(options, args):
    configs = {'replace' : 0, 'files' : [], 'ignore' : [], 'separator' : ','}

    if options.separator:
        configs['separator'] = options.separator

    if options.config:
        configs.update(get_config(options.config, configs['separator']))

    if options.archive:
        configs['archive'] = options.archive

    if options.ignore:
        if configs['separator'] not in options.ignore:
            ignore = [options.ignore]

        else:
            ignore = options.ignore.split(configs['separator'])

        configs['ignore'].extend(ignore)

    configs['files'].extend(args)

    if 'archive' in configs:
        files = get_files(configs['files'], configs['ignore'])

        ctime = datetime.datetime.now()
        # Support for time formatting in the archive name
        name = ctime.strftime(configs['archive'])

        archive(name, files, options.verbose)

        if options.verbose:
            print('--> '+_abs(name))

        if configs['replace']:
            conf_filename = os.path.basename(options.config)
            rpfilename = _dpath + conf_filename

            if _ex(rpfilename):
                rpfile = file(rpfilename, 'r')
                rep_files = [files.strip() for files in rpfile.readlines()]
                rpfile.close()

                rep_no = int(configs['replace'])
                if rep_no == len(rep_files):

                    del_filename = rep_files.pop(rep_no-1)

                    if _ex(del_filename):
                        if name != del_filename:
                            os.remove(del_filename)

                rep_files.insert(0, name)
                rpfile = file(rpfilename, 'w')
                rpfile.write('\n'.join(rep_files))
                rpfile.close()

            else:
                rpfile = file(rpfilename, 'w')
                rpfile.write(name)
                rpfile.close

    elif options.restore:
        archive_name = _abs(options.restore)

        if options.verbose:
            print('<-- '+archive_name)

        if _ex(archive_name):
            archive_file = tarfile.open(archive_name, 'r')
            try:
                archive_file.getmember(os.path.basename(_trust))

                if len(args) == 0:
                    if options.verbose:
                        members = archive_file.getmembers()

                        for member in members:
                            if member.name != '.SECURE':
                                print(member.name)
                                archive_file.extract(member, '/')

                    else:
                        archive_file.extractall('/')

                else:
                    members = archive_file.getmembers()

                    for member in members:

                        if member.name != '.SECURE':
                            for replace in args:

                                if replace.startswith('/'):
                                    replace = replace[1:]

                                if member.name.startswith(replace):

                                    if options.verbose:
                                        print(member.name)

                                    archive_file.extract(member, '/')

            except:
                optparser.error("{file} is not a trusted archive"\
                    .format(file=archive_name))

        else:
            optparser.error("{file} does not exist".format(file=archive_name))
    else:
        optparser.print_help()

if __name__ == "__main__":
    options, args = optparser.parse_args()
    try:
        main(options, args)
    except KeyboardInterrupt:
        optparser.error('KeyboardInterrupt')