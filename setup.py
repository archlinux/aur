#!/usr/bin/env python
#PATCH
# This is a patched version

from setuptools import setup

import os
import sys
import glob

from distutils.core import Command
from distutils.command.build import build as build_
from distutils.command.clean import clean as clean_
from setuptools.command.develop import develop as develop_
from setuptools.command.egg_info import egg_info as egg_info_
from setuptools.command.install import install as install_
from distutils.errors import DistutilsError

import gettext

LOCALE_DIR = os.path.join(os.path.dirname(sys.argv[0]), 'src/webilder/locale')
gettext.install('webilder', LOCALE_DIR)

if sys.argv[-1] == 'setup.py':
    print _("To install, run '%s'") % 'python setup.py install'
    print


#PATCH
#def GetBonoboPath():
#    """Extract the bonono path from the command line."""
#    for flag in sys.argv[1:]:
#        if flag.startswith('--bonobo_path'):
#            sys.argv.remove(flag)
#            return flag.split('=', 1)[1]
#    else:
#        return 'lib/bonobo/servers'


class file_build_command(Command):
    def initialize_options(self):
        self.build_lib = None
        self.install_scripts = None
        self.install_data = None

    def finalize_options(self):
        self.set_undefined_options('build',
                ('build_lib', 'build_lib'))
        self.set_undefined_options('install',
                ('install_scripts', 'install_scripts'),
                ('install_data', 'install_data'),
            )
        inst_cmd = self.get_finalized_command('install')
        if inst_cmd.root is not None:
            self.install_scripts = inst_cmd._original_install_scripts
            self.install_data = inst_cmd._original_install_data

    def run(self):
        dest_dir = self.get_dest_dir()
        self.mkpath(dest_dir)
        fc = file(os.path.join(self.dir, self.filename + '.in'), 'r').read()
        fw = file(os.path.join(dest_dir, self.filename), 'w')
        fw.write(fc % dict(
            bin_dir = self.install_scripts,
            data_dir = os.path.join(self.install_data, 'share', 'pixmaps'),
            version = self.distribution.get_version()))
        fw.close()


#PATCH
#class build_server(file_build_command):
#    description = _('Builds the bonobo server file representing the applet.')
#    dir = 'servers'
#    filename = 'GNOME_WebilderApplet.server'
#    def get_dest_dir(self): return 'servers'


class egg_info(egg_info_):
    def find_sources(self):
        egg_info_.find_sources(self)
        # Prune debian/ control directory.
        self.filelist.exclude_pattern(None, prefix='debian')


class build(build_):
    sub_commands = build_.sub_commands[:]
#PATCH
#    sub_commands.append(('build_server', None))
    sub_commands.append(('build_i18n', None))


class CompileTranslationsMixin(object):
    def compile_mo(self):
        for po in glob.glob(os.path.join(LOCALE_DIR, '*/*/*.po')):
            self.spawn([
                'msgfmt', po,
                '-o', po[:-3]+'.mo'])


class develop(develop_, CompileTranslationsMixin):
    def install_for_development(self):
        self.compile_mo()
        return develop_.install_for_development(self)

    sub_commands = develop_.sub_commands[:]
    sub_commands.append(('build_i18n', None))


class build_i18n(Command, CompileTranslationsMixin):
    def initialize_options(self):
        pass

    def finalize_options(self):
        pass

    def run(self):
        self.compile_mo()


def check_modules(*modules):
    for module in modules:
        import imp
        try:
            imp.find_module(module)
        except ImportError, e:
            raise DistutilsError, _('Could not find module %s. Make sure all dependencies are installed.') % e


class install(install_):
    user_options = install_.user_options[:]
    sub_commands = install_.sub_commands[:]

    def run(self):
#PATCH
#        check_modules('gtk', 'pygtk', 'gnome', 'appindicator')
        check_modules('gtk', 'pygtk')
        install_.run(self)
        print _("""
Installation completed successfully.

# If you prefer the command line, you can run webilder_desktop
# to configure Webilder and manage your photos. It is also
# possible to start photo downloading from the command line by
# starting webilder_downloader.
# 
# Please report any problem to thesamet at gmail.com.
# """)

    def change_roots(self, *names):
        # in case we are going to perform a rooted install, store the original
        # path names, so we can use them in file_build_command's.
        for name in names:
            attr = 'install_' + name
            backup_attr = '_original_install_' + name
            setattr(self, backup_attr, getattr(self, attr))
        install_.change_roots(self, *names)


class clean(clean_):
    def run(self):
        if self.dry_run:
            return
        for mo in glob.glob(os.path.join(LOCALE_DIR, '*/*/*.mo')):
            os.unlink(mo)
#PATCH
#        bonobo_server = os.path.join(
#            os.path.dirname(sys.argv[0]),
#            'servers/GNOME_WebilderApplet.server')
#        if os.path.exists(bonobo_server):
#            os.unlink(bonobo_server)
        clean_.run(self)


setup(name='Webilder',
      version='0.7.3',
      description='Webilder Desktop',
      author='Nadav Samet',
      author_email='thesamet@gmail.com',
      url='http://www.webilder.org',
      packages = ['webilder', 'webilder.webshots', 'webilder.flickr'],
      package_dir = {'': 'src'},
      package_data = {
        '': ['ui/*.glade', 'ui/*.png', 'ui/*.xpm', 'locale/*/*/*.mo'],
      },
      exclude_package_data = {
        '': ['debian/*',],
      },
      data_files = [
          (os.path.join('share', 'pixmaps'),
                        ['src/webilder/ui/camera48.png']),
          (os.path.join('share', 'applications'),
                        ['desktop/webilder_desktop.desktop']),
#PATCH
#          (os.path.join('share', 'applications'),
#                        ['desktop/webilder_indicator.desktop']),
#          (os.path.join('share', 'gnome', 'autostart'),
#                        ['autostart/webilder_indicator.desktop']),
#          (GetBonoboPath(),
#                        ['servers/GNOME_WebilderApplet.server'])
      ],
      cmdclass = {
        'build': build,
#PATCH
#        'build_server': build_server,
        'build_i18n': build_i18n,
        'clean': clean,
        'develop': develop,
        'egg_info': egg_info,
        'install': install},
      entry_points = {
        'console_scripts': [
          'webilder_downloader = webilder.downloader:main',
          'wbz_handler = webilder.wbz_handler:main',
#PATCH
#          'webilder_applet = webilder.webilder_gnome_applet:main',
#          'webilder_unity_indicator = webilder.webilder_unity_indicator:main',
        ],
        'gui_scripts': [
          'webilder_desktop = webilder.WebilderDesktop:main'
        ]
      }
)
