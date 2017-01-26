#!/usr/bin/env python3

# Copyright 2011-2015 Kwant authors.
#
# This file is part of Kwant.  It is subject to the license terms in the file
# LICENSE.rst found in the top-level directory of this distribution and at
# http://kwant-project.org/license.  A list of Kwant authors can be found in
# the file AUTHORS.rst at the top-level directory of this distribution and at
# http://kwant-project.org/authors.

from __future__ import print_function

import sys

v = sys.version_info
if v[:2] < (3, 4):
    error = "This version of Kwant requires Python 3.4 or above.\n"
    if v[0] == 2:
        error += "Kwant 1.1 is the last version to support Python 2."
    print(error, file=sys.stderr)
    sys.exit(1)

import re
import os
import glob
import imp
import subprocess
import configparser
from setuptools import setup, find_packages, Extension, Command
from sysconfig import get_platform
from distutils.errors import DistutilsError, DistutilsModuleError, \
    CCompilerError
from distutils.command.build import build
from setuptools.command.sdist import sdist
from setuptools.command.build_ext import build_ext

try:
    import numpy
except ImportError:
    include_dirs = []
else:
    include_dirs = [numpy.get_include()]

CONFIG_FILE = 'build.conf'
README_FILE = 'README.rst'
MANIFEST_IN_FILE = 'MANIFEST.in'
README_END_BEFORE = 'See also in this directory:'
STATIC_VERSION_PATH = ('kwant', '_kwant_version.py')
REQUIRED_CYTHON_VERSION = (0, 22)
CYTHON_OPTION = '--cython'
TUT_DIR = 'tutorial'
TUT_GLOB = 'doc/source/tutorial/*.py'
TUT_HIDDEN_PREFIX = '#HIDDEN'
CLASSIFIERS = """\
    Development Status :: 5 - Production/Stable
    Intended Audience :: Science/Research
    Intended Audience :: Developers
    Programming Language :: Python :: 3 :: Only
    Topic :: Software Development
    Topic :: Scientific/Engineering
    Operating System :: POSIX
    Operating System :: Unix
    Operating System :: MacOS :: MacOS X
    Operating System :: Microsoft :: Windows"""


# Let Kwant itself determine its own version.  We cannot simply import kwant, as
# it is not built yet.
_dont_write_bytecode_saved = sys.dont_write_bytecode
sys.dont_write_bytecode = True
_common = imp.load_source('_common', 'kwant/_common.py')
sys.dont_write_bytecode = _dont_write_bytecode_saved

version = _common.version
version_is_from_git = _common.version_is_from_git

try:
    sys.argv.remove(CYTHON_OPTION)
    use_cython = True
except ValueError:
    use_cython = version_is_from_git

if use_cython:
    try:
        import Cython
        from Cython.Build import cythonize
    except ImportError:
        cython_version = ()
    else:
        match = re.match('([0-9.]*)(.*)', Cython.__version__)
        cython_version = [int(n) for n in match.group(1).split('.')]
        # Decrease version if the version string contains a suffix.
        if match.group(2):
            while cython_version[-1] == 0:
                cython_version.pop()
            cython_version[-1] -= 1
        cython_version = tuple(cython_version)

distr_root = os.path.dirname(os.path.abspath(__file__))

def banner(title=''):
    starred = title.center(79, '*')
    return '\n' + starred if title else starred

error_msg = """{header}
The compilation of Kwant has failed.  Please examine the error message
above and consult the installation instructions in README.rst.
You might have to customize {{file}}.

Build configuration was:

{{summary}}
{sep}
"""
error_msg = error_msg.format(header=banner(' Error '), sep=banner())


class kwant_build_ext(build_ext):
    def run(self):
        if not config_file_present:
            # Create an empty config file if none is present so that the
            # extensions will not be rebuilt each time.  Only depending on the
            # config file if it is present would make it impossible to detect a
            # necessary rebuild due to a deleted config file.
            with open(CONFIG_FILE, 'w') as f:
                f.write('# Created by setup.py - feel free to modify.\n')

        try:
            build_ext.run(self)
        except (DistutilsError, CCompilerError):
            print(error_msg.format(file=CONFIG_FILE, summary=build_summary),
                  file=sys.stderr)
            raise
        print(banner(' Build summary '))
        print(build_summary)
        print(banner())


class kwant_build_tut(Command):
    description = "build the tutorial scripts"
    user_options = []

    def initialize_options(self):
        pass

    def finalize_options(self):
        pass

    def run(self):
        if not os.path.exists(TUT_DIR):
            os.mkdir(TUT_DIR)
        for in_fname in glob.glob(TUT_GLOB):
            out_fname = os.path.join(TUT_DIR, os.path.basename(in_fname))
            with open(in_fname) as in_file:
                with open(out_fname, 'w') as out_file:
                    for line in in_file:
                        if not line.startswith(TUT_HIDDEN_PREFIX):
                            out_file.write(line)


# Our version of the "build" command also makes sure the tutorial is made.
# Even though the tutorial is not necessary for installation, and "build" is
# supposed to make everything needed to install, this is a robust way to ensure
# that the tutorial is present.
class kwant_build(build):
    sub_commands = [('build_tut', None)] + build.sub_commands

    def run(self):
        build.run(self)
        write_version(os.path.join(self.build_lib, *STATIC_VERSION_PATH))


def git_lsfiles():
    if not version_is_from_git:
        return

    try:
        p = subprocess.Popen(['git', 'ls-files'], cwd=distr_root,
                             stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    except OSError:
        return

    if p.wait() != 0:
        return
    return p.communicate()[0].decode().split('\n')[:-1]


# Make the command "sdist" depend on "build".  This verifies that the
# distribution in the current state actually builds.  It also makes sure that
# the Cython-made C files and the tutorial will be included in the source
# distribution and that they will be up-to-date.
class kwant_sdist(sdist):
    sub_commands = [('build', None)] + sdist.sub_commands

    def run(self):
        """
        Create MANIFEST.in from git if possible, otherwise check that MANIFEST.in
        is present.

        Right now (2015) generating MANIFEST.in seems to be the only way to
        include files in the source distribution that setuptools does not think
        should be there.  Setting include_package_data to True makes setuptools
        include *.pyx and other source files in the binary distribution.
        """
        manifest = os.path.join(distr_root, MANIFEST_IN_FILE)
        names = git_lsfiles()
        if names is None:
            if not (os.path.isfile(manifest) and os.access(manifest, os.R_OK)):
                print("Error:", MANIFEST_IN_FILE,
                      "file is missing and Git is not available"
                      " to regenerate it.", file=sys.stderr)
                exit(1)
        else:
            with open(manifest, 'w') as f:
                for name in names:
                    a, sep, b = name.rpartition('/')
                    if b == '.gitignore':
                        continue
                    stem, dot, extension = b.rpartition('.')
                    f.write('include {}'.format(name))
                    if extension == 'pyx':
                        f.write(''.join([' ', a, sep, stem, dot, 'c']))
                    f.write('\n')

        sdist.run(self)

        if names is None:
            print(banner(' Caution '),
        """Git was not available to generate the list of files to be included in the
source distribution.  The old {} was used.""".format(MANIFEST_IN_FILE),
                  banner(), sep='\n', file=sys.stderr)

    def make_release_tree(self, base_dir, files):
        sdist.make_release_tree(self, base_dir, files)
        write_version(os.path.join(base_dir, *STATIC_VERSION_PATH))


def write_version(fname):
    # This could be a hard link, so try to delete it first.  Is there any way
    # to do this atomically together with opening?
    try:
        os.remove(fname)
    except OSError:
        pass
    with open(fname, 'w') as f:
        f.write("# This file has been created by setup.py.\n")
        f.write("version = '{}'\n".format(version))


def long_description():
    text = []
    try:
        with open(README_FILE) as f:
            for line in f:
                if line.startswith(README_END_BEFORE):
                    break
                text.append(line.rstrip())
            while text[-1] == "":
                text.pop()
    except:
        return ''
    return '\n'.join(text)


def search_mumps():
    """Return the configuration for MUMPS if it is available in a known way.

    This is known to work with the MUMPS provided by the Debian package
    libmumps-scotch-dev."""

    libs = ['zmumps_scotch', 'mumps_common_scotch', 'pord', 'mpiseq_scotch',
            'gfortran']

    cmd = ['gcc']
    cmd.extend(['-l' + lib for lib in libs])
    cmd.extend(['-o/dev/null', '-xc', '-'])
    try:
        p = subprocess.Popen(cmd, stdin=subprocess.PIPE, stderr=subprocess.PIPE)
    except OSError:
        pass
    else:
        p.communicate(input=b'int main() {}\n')
        if p.wait() == 0:
            return {'libraries': libs}
    return {}


def extensions():
    """Return a list of tuples (args, kwrds) to be passed to Extension."""

    global build_summary, config_file_present
    build_summary = []

    #### Add components of Kwant without external compile-time dependencies.
    result = [
        (['kwant._system', ['kwant/_system.pyx']],
         {'include_dirs': ['kwant/graph']}),
        (['kwant.graph.core', ['kwant/graph/core.pyx']],
         {'depends': ['kwant/graph/core.pxd', 'kwant/graph/defs.h',
                      'kwant/graph/defs.pxd']}),
        (['kwant.graph.utils', ['kwant/graph/utils.pyx']],
         {'depends': ['kwant/graph/defs.h', 'kwant/graph/defs.pxd',
                      'kwant/graph/core.pxd']}),
        (['kwant.graph.slicer', ['kwant/graph/slicer.pyx',
                                 'kwant/graph/c_slicer/partitioner.cc',
                                 'kwant/graph/c_slicer/slicer.cc']],
         {'depends': ['kwant/graph/defs.h', 'kwant/graph/defs.pxd',
                      'kwant/graph/core.pxd',
                      'kwant/graph/c_slicer.pxd',
                      'kwant/graph/c_slicer/bucket_list.h',
                      'kwant/graph/c_slicer/graphwrap.h',
                      'kwant/graph/c_slicer/partitioner.h',
                      'kwant/graph/c_slicer/slicer.h']})]

    #### Add components of Kwant with external compile-time dependencies.
    config = configparser.ConfigParser()
    try:
        with open(CONFIG_FILE) as f:
            config.read_file(f)
    except IOError:
        config_file_present = False
    else:
        config_file_present = True

    kwrds_by_section = {}
    for section in config.sections():
        kwrds_by_section[section] = kwrds = {}
        for name, value in config.items(section):
            kwrds[name] = value.split()

    # Setup LAPACK.
    lapack = kwrds_by_section.get('lapack')
    if lapack:
        build_summary.append('User-configured LAPACK and BLAS')
    else:
        lapack = {'libraries': ['lapack', 'blas']}
        build_summary.append('Default LAPACK and BLAS')
    kwrds = lapack.copy()
    kwrds.setdefault('depends', []).extend(
        ['kwant/linalg/f_lapack.pxd'])
    result.append((['kwant.linalg.lapack', ['kwant/linalg/lapack.pyx']],
                   kwrds))

    # Setup MUMPS.
    kwrds = kwrds_by_section.get('mumps')
    if kwrds:
        build_summary.append('User-configured MUMPS')
    else:
        kwrds = search_mumps()
        if kwrds:
            build_summary.append('Auto-configured MUMPS')
    if kwrds:
        for name, value in lapack.items():
            kwrds.setdefault(name, []).extend(value)
        kwrds.setdefault('depends', []).extend(
            ['kwant/linalg/cmumps.pxd'])
        result.append((['kwant.linalg._mumps', ['kwant/linalg/_mumps.pyx']],
                       kwrds))
        print(kwrds)
        print(result)
    else:
        build_summary.append('No MUMPS support')

    build_summary = '\n'.join(build_summary)
    return result


def complain_cython_unavailable():
    assert not use_cython or cython_version < REQUIRED_CYTHON_VERSION
    if use_cython:
        msg = ("Install Cython {0} or newer so it can be made\n"
               "or use a source distribution of Kwant.")
        ver = '.'.join(str(e) for e in REQUIRED_CYTHON_VERSION)
        print(msg.format(ver), file=sys.stderr)
    else:
        print("Run setup.py with the {} option.".format(CYTHON_OPTION),
              file=sys.stderr)


def ext_modules(extensions):
    """Prepare the ext_modules argument for setuptools.

    If Cython is not to be run, replace .pyx extensions with .c or .cpp, and
    check timestamps.
    """
    if use_cython and cython_version >= REQUIRED_CYTHON_VERSION:
        return cythonize([Extension(*args, **kwrds)
                          for args, kwrds in extensions], language_level=3)

    # Cython is not going to be run: replace pyx extension by that of
    # the shipped translated file.

    result = []
    problematic_files = []
    for args, kwrds in extensions:
        name, sources = args

        language = kwrds.get('language')
        if language is None:
            ext = '.c'
        elif language == 'c':
            ext = '.c'
        elif language == 'c++':
            ext = '.cpp'
        else:
            print('Unknown language: {}'.format(language), file=sys.stderr)
            exit(1)

        pyx_files = []
        cythonized_files = []
        new_sources = []
        for f in sources:
            if f.endswith('.pyx'):
                pyx_files.append(f)
                f = f.rstrip('.pyx') + ext
                cythonized_files.append(f)
            new_sources.append(f)
        sources = new_sources

        # Complain if cythonized files are older than Cython source files.
        try:
            cythonized_oldest = min(os.stat(f).st_mtime
                                    for f in cythonized_files)
        except OSError:
            print("error: Cython-generated file {} is missing.".format(f),
                  file=sys.stderr)
            complain_cython_unavailable()
            exit(1)

        for f in pyx_files + kwrds.get('depends', []):
            if f == CONFIG_FILE:
                # The config file is only a dependency for the compilation
                # of the cythonized file, not for the cythonization.
                continue
            if os.stat(f).st_mtime > cythonized_oldest:
                problematic_files.append(f)

        result.append(Extension(name, sources, **kwrds))

    if problematic_files:
        problematic_files = ", ".join(problematic_files)
        msg = ("Some Cython source files are newer than files that should have\n"
               "been derived from them, but {}.\n"
               "\n"
               "Affected files: {}")
        if use_cython:
            if not cython_version:
                reason = "Cython is not installed"
            else:
                reason = "the installed Cython is too old"
            print(banner(" Error "), msg.format(reason, problematic_files),
                  banner(), sep="\n", file=sys.stderr)
            print()
            complain_cython_unavailable()
            exit(1)
        else:
            reason = "the option {} has not been given".format(CYTHON_OPTION)
            dontworry = ('(Do not worry about this if you are building Kwant\n'
                         'from unmodified sources, e.g. with "pip install".)\n')
            print(banner(" Caution "), dontworry,
                  msg.format(reason, problematic_files),
                  banner(), sep='\n', file=sys.stderr)

    return result


def main():
    setup(name='kwant',
          version=version,
          author='C. W. Groth (CEA), M. Wimmer, '
                 'A. R. Akhmerov, X. Waintal (CEA), and others',
          author_email='authors@kwant-project.org',
          description="Package for numerical quantum transport calculations.",
          long_description=long_description(),
          platforms=["Unix", "Linux", "Mac OS-X", "Windows"],
          url="http://kwant-project.org/",
          license="BSD",
          packages=find_packages('.'),
          test_suite = 'nose.collector',
          cmdclass={'build': kwant_build,
                    'sdist': kwant_sdist,
                    'build_ext': kwant_build_ext,
                    'build_tut': kwant_build_tut},
          ext_modules=ext_modules(extensions()),
          include_dirs=include_dirs,
          setup_requires=['numpy > 1.6.1', 'nose >= 1.0'],
          install_requires=['numpy > 1.6.1', 'scipy >= 0.9', 'tinyarray'],
          extras_require={'plotting': 'matplotlib >= 1.2'},
          classifiers=[c.strip() for c in CLASSIFIERS.split('\n')])

if __name__ == '__main__':
    main()
