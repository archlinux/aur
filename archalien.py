#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Copyright (c) Asher256 <asher256@gmail.com>
#
# Github: https://github.com/Asher256/archalien
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with This program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#
"""Convert a Debian package to an Arch Linux package."""

from __future__ import print_function
from __future__ import division
from __future__ import absolute_import
import sys
import os
from shutil import rmtree
from tempfile import mkdtemp
from getopt import gnu_getopt, GetoptError
import shlex

pkgrel=1

def command_required(*cmd_list):
    """Check if the commands exist."""
    path = os.getenv('PATH')
    if path is not None:
        path_list = path.split(os.pathsep)
    else:
        print("The environment variable PATH is not defined.")
        sys.exit(1)

    for command in cmd_list:
        error = True

        for path in path_list:
            command_path = os.path.join(path, command)
            if os.access(command_path, os.X_OK):
                error = False
                break

        if error:
            print('The command \'%s\' is not found.' % command)
            sys.exit(1)


def fix_input_pkg(input_pkg):
    """Verify and fix the input package path.

    It returns the input package, modified.

    """
    if not os.path.isfile(input_pkg):
        print('\'%s\' doesn\'t exist.' % input_pkg)
        sys.exit(1)

    if not os.access(input_pkg, os.R_OK):
        print('\'%s\' is not accessible in reading.' % input_pkg)

    (_, input_ext) = os.path.splitext(input_pkg)

    if input_ext != '.deb':
        print('The extension of \'%s\' must be *.deb.' % input_pkg)
        sys.exit(1)

    # Convert to the absolute path
    input_pkg = os.path.abspath(input_pkg)

    return input_pkg


def usage():
    """Called when the user uses --help."""
    print('Convert a Debian or an RPM Package into an Arch Linux package'
          ' (and vice-versa).')
    print()
    print('Usage: %s [OPTIONS] debian_package.deb [arch_package.pkg.tar.gz]'
          % os.path.basename(sys.argv[0]))
    print()
    print("OPTIONS :")
    print("          -h, --help            Show this help")
    print()
    sys.exit(0)


def more_informations():
    """Asks the user to use --help."""
    print("--help for more informations.")
    sys.exit(1)


def handle_arguments():
    """Handle all options in the arguments.

    This function returns a dictionary that contain
    'input_pkg' and 'output_pkg' keywords.

    """
    result = {'input_pkg': '', 'output_pkg': ''}

    try:
        args = sys.argv[1:]
        optlist = gnu_getopt(args, 'h', ['help'])
    except GetoptError:
        print('Error when parsing arguments.')
        more_informations()

    if len(sys.argv) < 2:
        print('No input file.')
        more_informations()

    for option, _ in optlist[0]:
        if option in ['-h', '--help']:
            usage()

    result['input_pkg'] = optlist[1][0]

    if len(sys.argv) > 3:
        result['output_pkg'] = optlist[1][1]

    return result


def read_debcontrol(path):
    """Read some informations from debian/control."""
    result = {'name': '', 'maintainer': '', 'version': '',
              'description': '', 'size': '', 'architecture': ''}

    try:
        filedesc = open(path, 'r')
    except IOError:
        print('Cannot read debian package informations from \'%s\'.' % path)
        sys.exit(1)

    for line in filedesc.readlines():
        line = line.rstrip('\n')
        try:
            (variable, value) = [splited.strip().lower()
                                 for splited in line.split(':', 1)]
        except ValueError:
            continue

        if variable == 'package':
            result['name'] = value
        if variable == 'installed-size':
            result['size'] = value
        if variable == 'version':
            try:
                before, after = value.split(':')
            except ValueError:
                result[variable] = value
            else:
                result[variable] = after

            result[variable] = result[variable].replace('-', '_')
        elif variable in ['maintainer', 'version', 'description']:
            result[variable] = value
        elif variable == 'architecture':
            if value == 'amd64':
                result['architecture'] = 'x86_64'
            elif value == 'i386':
                result['architecture'] = 'i686'  # on Arch Linux, i686 only
            elif value == 'i686':
                result['architecture'] = 'i686'
            else:
                result['architecture'] = 'any'

    filedesc.close()

    for key, value in list(result.items()):
        if value == '' and key not in ['size', 'description']:
            print('The debian package doesn\'t '
                  'contain all needed informations.\n'
                  'The variable \'%s\' is empty.' % key)
            sys.exit(1)

    return result


def write_archcontrol(path, pkginfo):
    """Write an Arch Linux PKGINFO in 'path'.

    'pkginfo' is a dictionary that contain some informations
    returned by read_debcontrol().

    """
    try:
        filedesc = open(path, 'w')
    except IOError:
        print('\'%s\' is not accessible in writing.' % path)
        sys.exit(1)

    filedesc.write('# Generated by Alien Arch\n')
    filedesc.write('pkgname = %s\n' % pkginfo['name'])
    filedesc.write('pkgver = %s-%s\n' % (pkginfo['version'], pkgrel))
    filedesc.write('pkgdesc = %s\n' % pkginfo['description'])
    filedesc.write('packager = Arch Linux, Alien Arch '
                   '(http://www.archlinux.org)\n')
    filedesc.write('size = %s\n' % pkginfo['size'])
    filedesc.write('arch = %s\n' % pkginfo['architecture'])
    filedesc.write('license =\n')
    # filedesc.write('url =\n')
    # filedesc.write('builddate =\n')
    # filedesc.write('depend =\n')

    filedesc.close()


def convert(input_pkg, output_pkg=''):
    """Convert a Debian package to an Arch Linux package.

    input_pkg contains the input package, with *.deb extension.

    output_pkg contains the output package, with *.pkg.tar.gz extension. This
    argument is not obligatory.

    """
    (input_tmpd, output_tmpd) = (mkdtemp(), mkdtemp())

    input_pkg = fix_input_pkg(input_pkg)
    print('Conversion of %s...' % os.path.basename(input_pkg))
    print()

    def chdir(directory):
        """Change the directory."""
        try:
            os.chdir(directory)
        except OSError:
            print('Cannot chdir to %s.' % directory)
            sys.exit(1)

    try:
        chdir(input_tmpd)

        # Extraction of the deb archive
        os.system('ar x %s' % shlex.quote(input_pkg))

        if os.path.exists('data.tar.gz'):
            data_path = 'data.tar.gz'
        else:
            for found_data_path in os.listdir('.'):
                if found_data_path.find('data.tar') == 0:
                    data_path = found_data_path
                    break

            if data_path == '':
                print("The data archive wasn't found inside %s" % input_pkg)
                sys.exit(1)

        # Extraction of control.tar.gz and data.tar.x
        os.system('tar xf %s -C %s' %
                  (shlex.quote(os.path.join(input_tmpd, data_path)),
                   shlex.quote(output_tmpd)))

        control_file = os.path.join(input_tmpd, 'control.tar.gz')
        if os.path.isfile(control_file):
            os.system('tar xf %s' % shlex.quote(control_file))
        else:
            control_file = os.path.join(input_tmpd, 'control.tar.xz')
            if os.path.isfile(control_file):
                os.system('tar xf %s' % shlex.quote(control_file))
            else:
                print("Error: control.tar.* was not found in the deb package.")
                sys.exit(1)

        # Reading 'control' file, from the deb archive
        deb_info = read_debcontrol(os.path.join(input_tmpd, 'control'))

        # If the output filename is not specified, it will be created
        if output_pkg == '':
            output_pkg = os.path.join(os.path.dirname(input_pkg),
                                      '%s-%s-%s-%s''.pkg.tar.gz'
                                      % (deb_info['name'], deb_info['version'],
                                         pkgrel, deb_info['architecture']))

        # Creating Arch Linux package
        chdir(output_tmpd)
        os.system('find . -type f | sed -e \'s/^\\.\\///\' > .FILELIST')
        write_archcontrol('.PKGINFO', deb_info)
        os.system('tar zcf %s * .PKGINFO .FILELIST' % shlex.quote(output_pkg))

        print("done.")
        print()
        print('The Arch Linux package:\n%s' % output_pkg)
    finally:
        rmtree(input_tmpd, True)
        rmtree(output_tmpd, True)


if __name__ == '__main__':
    try:
        command_required('ar', 'tar', 'find', 'sed')
        DATA = handle_arguments()
        convert(DATA['input_pkg'],
                DATA['output_pkg'])
    except KeyboardInterrupt:
        print("Interrupted.")

# vim:ai:et:sw=4:ts=4:sts=4:tw=78:fenc=utf-8
