#!/usr/bin/env python2.7
# -*- coding: utf-8 -*-

# region header

'''
    This module monitors a given file path. And relinks a broken hard link if \
    necessary.
'''

# # python3.5
# # pass
from __future__ import absolute_import, division, print_function, \
    unicode_literals
# #

'''
    For conventions see "boostnode/__init__.py" on \
    https://github.com/thaibault/boostnode
'''

__author__ = 'Torben Sickert'
__copyright__ = 'see boostnode/__init__.py'
__credits__ = 'Torben Sickert',
__license__ = 'see boostnode/__init__.py'
__maintainer__ = 'Torben Sickert'
__maintainer_email__ = 'info["~at~"]torben.website'
__status__ = 'stable'
__version__ = '1.0'

# # python3.5
# # import builtins
# # from collections import Iterable
import __builtin__ as builtins
# #
import copy
import inspect
import os
import sys
import threading

try:
    import pyinotify
except builtins.ImportError:
    pyinotify = None

sys.path.append('./node_modules/')

# # python3.5 pass
from boostnode import convert_to_unicode
from boostnode.aspect.signature import add_check as add_signature_check
from boostnode.extension.file import Handler as FileHandler
from boostnode.extension.native import Iterable, Module, \
    InstancePropertyInitializer
from boostnode.extension.system import CommandLine, Runnable
# # python3.5 from boostnode.extension.type import Self
pass
from boostnode.paradigm.aspectOrientation import JointPoint
from boostnode.paradigm.objectOrientation import Class

'''
    Add signature checking for all functions and methods with joint points in \
    this module.
'''
add_signature_check(point_cut='%s\..+' % Module.get_name(
    frame=inspect.currentframe()))

# endregion


# region classes

class Main(Class, Runnable):

    '''
        Entry point for this script.

        Examples:

        >>> Main() # doctest: +ELLIPSIS +SKIP
        ...
    '''

    # region properties

    COMMAND_LINE_ARGUMENTS = (
        {'arguments': ('-i', '--initialize-only'),
         'specification': {
             'action': 'store_true',
             'default': False,
             'help': 'Set all links once instead of start observation '
                     'service.',
             'dest': 'initialize_only'}},
        {'arguments': ('-e', '--exclude-file-path-patterns'),
         'specification': {
             'action': 'store',
             'nargs': '*',
             'default': {'execute': '__initializer_default_value__'},
             'type': builtins.str,
             'required': {'execute': '__initializer_default_value__ is None'},
             'help': {
                 'execute': "'Defines some file path patterns which "
                            '''shouldn\\'t be synced (default: "%s").' % '''
                            """'", "'.join(__initializer_default_value__)."""
                            "replace('%', '%%')"},
             'dest': 'exclude_file_path_patterns',
             'metavar': 'PATH_PATTERNS'}},
        {'arguments': ('-f', '--exclude-folder-path-patterns'),
         'specification': {
             'action': 'store',
             'nargs': '*',
             'default': {'execute': '__initializer_default_value__'},
             'type': builtins.str,
             'required': {'execute': '__initializer_default_value__ is None'},
             'help': {
                 'execute': "'Defines some folder path patterns which "
                            '''shouldn\\'t be synced (default: "%s").' % '''
                            """'", "'.join(__initializer_default_value__)."""
                            "replace('%', '%%')"},
             'dest': 'exclude_folder_path_patterns',
             'metavar': 'PATH_PATTERNS'}},
        {'arguments': ('-s', '--stop-order'),
         'specification': {
             'action': 'store',
             'default': {'execute': '__initializer_default_value__'},
             'type': {'execute': 'type(__initializer_default_value__)'},
             'required': {'execute': '__initializer_default_value__ is None'},
             'help': {
                 'execute': "'Saves a cli-command for shutting down the server"
                            ''' (default: "%s").' % '''
                            '__initializer_default_value__'},
             'dest': 'stop_order',
             'metavar': 'STRING'}})
    '''Holds all command line interface argument informations.'''
    START_INDICATOR_FILE_PATH = '/tmp/%sSingletonLock'
    '''
        Defines file path name for singleton lock. To indicate whether this \
        service was started or not.
    '''

    # endregion

    # region dynamic methods

    # # region public

    @JointPoint
# # python3.5
# #     def trigger_location(
# #         self: Self, triggered_location: FileHandler,
# #         event_type_name='create'
# #     ) -> Self:
    def trigger_location(
        self, triggered_location, event_type_name='create'
    ):
# #
        '''
            Triggers a linking check for given file location with given event \
            name.
        '''
        if triggered_location:
            if self._is_excluded_file(file=triggered_location):
                __logger__.debug(
                    'Ignore event for excluded file "%s".',
                    triggered_location.path)
            else:
                __logger__.debug(
                    'Event "%s" triggered on "%s" (%s).',
                    event_type_name.replace('|', '/'), triggered_location.path,
                    triggered_location.type)
                if((event_type_name[:event_type_name.index(
                    '|'
                )] if '|' in event_type_name else event_type_name
                ) == 'create' and triggered_location.is_directory()):
                    self._add_watcher_to_directory(location=triggered_location)
                found = False
                for path in self.all_locations:
                    watched_location = FileHandler(location=path)
                    if triggered_location.path.startswith(
                        watched_location.path
                    ):
                        found = True
                        __logger__.debug('Found responsible path "%s".', path)
                        self._hard_link_responsible_structure(
                            path, triggered_location)
                if not found:
                    __logger__.debug(
                        'No responsible path found for "%s".',
                        triggered_location.path)
        return self

        # # region runnable

    @JointPoint
# # python3.5
# #     def stop(
# #         self: Self, *arguments: builtins.object,
# #         **keywords: builtins.object
# #     ) -> Self:
    def stop(self, *arguments, **keywords):
# #
        '''Waits for running workers and shuts the server down.'''
        __logger__.info('Closing all inotify handler.')
        '''Take this method type by the abstract class via introspection.'''
        return builtins.getattr(
            builtins.super(self.__class__, self), inspect.stack()[0][3]
        )(*arguments, **keywords)

        # # endregion

        # endregion

        # region protected

        # # region runnable

    @JointPoint
# # python3.5     def _run(self: Self) -> Self:
    def _run(self):
        '''Provides the command line interface and triggers initialisation.'''
        command_line_arguments = CommandLine.argument_parser(
            module_name=__name__, arguments=self.COMMAND_LINE_ARGUMENTS,
            scope={'self': self})
        return self._initialize(**self._command_line_arguments_to_dictionary(
            namespace=command_line_arguments))

    @JointPoint(InstancePropertyInitializer)
# # python3.5
# #     def _initialize(
# #         self: Self, initialize_only=False,
# #         exclude_file_path_patterns=('.+\.py[cod]', '(^|.*/)package\.json'),
# #         exclude_folder_path_patterns=(
# #             '.*/\.git/?', '.*/__pycache__/?', '.*/node_modules/?'
# #         ), stop_order='stop', **keywords: builtins.object
# #     ) -> Self:
    def _initialize(
        self, initialize_only=False,
        exclude_file_path_patterns=('.+\.py[cod]', '(^|.*/)package\.json'),
        exclude_folder_path_patterns=(
            '.*/\.git/?', '.*/__pycache__/?', '.*/node_modules/?'
        ), stop_order='stop', **keywords
    ):
# #
        '''
            Starts the watcher daemon if not already initialized. If \
            "initialize_only" is set to "True" all links will be created once.
        '''

        # # # region dynamic properties

        '''Instance dealing with file observations.'''
        self._watch_manager = None
        '''Defines which events should be observed.'''
        self._mask = 0
        '''
            Describes the needed meta structure to determine where each path \
            belongs to. \
            NOTE: Giving none argument to "split()" is not the same as \
                  providing one whitespace. Other than the default behavior \
                  acts split as grouping a consecutive sequence of whitespace \
                  to one delimiter.
        '''
        self.link_structure = builtins.list(builtins.map(
            lambda paths: builtins.list(paths.strip().split()),
            os.environ['ILU_LINK_STRUCTURE'].strip().split('\n')))
        self.all_locations = []
        for paths in self.link_structure:
            for index, path in builtins.enumerate(paths):
                if path:
                    paths[index] = FileHandler(location=path).path
# # python3.5             self.all_locations += paths.copy()
            self.all_locations += copy.copy(paths)
        self.all_locations = builtins.tuple(builtins.set(self.all_locations))

        # # # endregion

        self._initialize_links()
        if not self.initialize_only:
            if pyinotify is None:
                raise __exception__(
                    'Needed python module "pyinotify" isn\'t available.')
            self._initialize_watcher()
        return self

        # # endregion

        # # region boolean

    @JointPoint
# # python3.5
# #     def _is_excluded_file(self: Self, file: FileHandler) -> builtins.bool:
    def _is_excluded_file(self, file):
# #
        '''Determines if given file name matches the exception patterns.'''
        patterns = self.exclude_folder_path_patterns
        if file.is_file():
            patterns = self.exclude_file_path_patterns
        if Iterable(patterns).is_in_pattern(value=file._path):
            __logger__.debug('Ignore file "%s".', file.path)
            return True
        return False

        # # endregion

    @JointPoint
# # python3.5     def _initialize_links(self: Self) -> Self:
    def _initialize_links(self):
        '''
            Hard links all the link structure how it would be done if any \
            watched file would be changed.
        '''
        for locations in self.link_structure:
# # python3.5             locations = locations.copy()
            locations = copy.copy(locations)
            for location in locations:
                base_location = FileHandler(location)
                if base_location:
                    break
            if base_location:
                locations.remove(location)
                for location in locations:
                    self._hard_link_location(
                        source=base_location, target=FileHandler(location))
            else:
                __logger__.debug(
                    'Ignore connections between "%s" because no such path is '
                    'present.', '", "'.join(locations))
        return self

    @JointPoint
# # python3.5
# #     def _hard_link_location(
# #         self: Self, source: FileHandler, target: FileHandler
# #     ) -> Self:
    def _hard_link_location(self, source, target):
# #
        '''Hard links given locations after making some sanity checks.'''
        if source.is_directory() and target.is_directory():
            self._hard_link_directory(
                triggered_location=source,
                corresponding_location=target, check_all=True)
        elif source.is_file() and target.is_file():
            self._hard_link_file(base_file=source, target=target)
        elif target and source.is_directory() != target.is_directory():
            __logger__.warning(
                'Location "%s" and "%s" couldn\'t be linked because one is a '
                'directory and the other is not.', source.path, target.path)
        else:
            __logger__.debug(
                'Ignore non existing location "%s".', target.path)
        return self

    @JointPoint
# # python3.5     def _initialize_watcher(self: Self) -> Self:
    def _initialize_watcher(self):
        '''Initializes the necessary file watcher.'''
        start_inidicator_file = FileHandler(
            location=self.START_INDICATOR_FILE_PATH % __module_name__)
        if start_inidicator_file:
            __logger__.info(
                'Daemon seems to already started. If not you have to delete '
                '"%s".', start_inidicator_file.path)
        elif not __test_mode__:
            start_inidicator_file.content = ''
            try:
                self._initialize_daemon()
            except:
                raise
            finally:
                start_inidicator_file.remove_file()
        return self

    @JointPoint
# # python3.5     def _initialize_daemon(self: Self) -> Self:
    def _initialize_daemon(self):
        '''
            Attaches all events to locations which should be observed.

            Supported events: \
                'create', 'access', 'move_self', 'ignored', 'moved_from', \
                'close_nowrite', 'delete', 'open', 'delete_self', 'modify', \
                'moved_to', 'q_overflow', 'unmount', 'attrib' and 'close_write'
        '''
        for event_name in ('create',):
            self._mask |= builtins.getattr(pyinotify, (
                'in_' + event_name
            ).upper())
        self._watch_manager = pyinotify.WatchManager()
        for path in self.all_locations:
            location = FileHandler(location=path)
            if location:
                '''
                    Check if we already listen to this directory by a parent
                    directory.
                '''
                if not builtins.list(builtins.filter(
                    lambda other_path: location.path != other_path and
                    location.path.startswith(other_path),
                    self.all_locations)
                ):
                    if location.is_directory():
                        self._add_watcher_to_directory(location)
                        location.iterate_directory(
                            function=self._add_watcher_to_directory,
                            recursive=True)
                    elif location.is_file():
                        '''
                            If we want to observe a file object we have to
                            observe the parent directory.
                        '''
                        self._add_watcher_to_directory(location.directory)
            else:
                __logger__.info(
                    'Ignore location "%s" because it doesn\'t exist.',
                    location.path)
        return self._initialize_daemon_thread()

    @JointPoint
# # python3.5     def _initialize_daemon_thread(self: Self) -> Self:
    def _initialize_daemon_thread(self):
        '''Initializes the wacher daemon thread.'''
        notifier = pyinotify.Notifier(self._watch_manager)
        if not __test_mode__:
# # python3.5
# #             threading.Thread(target=notifier.loop, daemon=True).start()
            notifier_thread = threading.Thread(target=notifier.loop)
            notifier_thread.daemon = True
            notifier_thread.start()
# #
            if self.stop_order:
                self.wait_for_order()
        return self

    @JointPoint
# # python3.5
# #     def _add_watcher_to_directory(
# #         self: Self, location: FileHandler
# #     ) -> (builtins.bool, builtins.type(None)):
    def _add_watcher_to_directory(self, location):
# #
        '''
            Adds observation event handler to given location if not match one \
            of defined exclude patterns.
        '''
        if location.is_directory():
            if self._is_excluded_file(file=location):
                '''Don't enter further directories in this branch.'''
                return None
            __logger__.info('Start watching "%s".', location.path)
            self._watch_manager.add_watch(
                location.path, self._mask, proc_fun=self._event_handler)
        return True

    @JointPoint
# # python3.5
# #     def _event_handler(self: Self, event: pyinotify.Event) -> Self:
    def _event_handler(self, event):
# #
        '''
            Handles each file system event.

            event.path -> initially watch dir

            event.mask -> watched mask

            event.wd -> watch descriptor

            event.name -> file object name

            event.pathname -> full path

            event.maskname -> event description

            event.dir -> True if object is a directory.
        '''
        triggered_location = FileHandler(location=event.pathname)
        '''
            NOTE: To improve performance use add the following to if \
            statement: "and (event.dir or os.stat(event.pathname).st_nlink \
            < 2):"
        '''
        mask_name = event.maskname[3:].lower()
        return self.trigger_location(
            triggered_location, event_type_name=mask_name)

    @JointPoint
# # python3.5
# #     def _hard_link_responsible_structure(
# #         self: Self, responsible_path: builtins.str,
# #         triggered_location: FileHandler
# #     ) -> Self:
    def _hard_link_responsible_structure(
        self, responsible_path, triggered_location
    ):
# #
        '''
            Hard links given responsible path with an event triggered \
            location.
        '''
        for paths in self.link_structure:
            '''NOTE: There could be a list of responsable paths.'''
            if responsible_path in paths:
# # python3.5                 affected_locations = paths.copy()
                affected_locations = copy.copy(paths)
                affected_locations.remove(responsible_path)
                self._hard_link_structure(
                    triggered_location, responsible_path, affected_locations)
        return self

    @JointPoint
# # python3.5
# #     def _determine_nearest_responsible_path(
# #         self: Self, triggered_location: FileHandler
# #     ) -> builtins.str:
    def _determine_nearest_responsible_path(self, triggered_location):
# #
        '''Determines the nearest path to given triggered location.'''
        nearest_path_length = 0
        responsible_path = ''
        for path in self.all_locations:
            watched_location = FileHandler(location=path)
            if triggered_location.path.startswith(watched_location.path):
                if nearest_path_length < builtins.len(
                    watched_location.path
                ):
                    nearest_path_length = builtins.len(
                        watched_location.path)
                    responsible_path = path
        return responsible_path

    @JointPoint
# # python3.5
# #     def _hard_link_structure(
# #         self: Self, triggered_location: FileHandler,
# #         responsible_path: builtins.str, affected_locations: Iterable,
# #         check_all=False
# #     ) -> Self:
    def _hard_link_structure(
        self, triggered_location, responsible_path, affected_locations,
        check_all=False
    ):
# #
        '''Hard links library files to their corresponding commitment.'''
        for affected_location in affected_locations:
            corresponding_location = FileHandler(location=(
                affected_location + '/' + triggered_location.path[
                    builtins.len(responsible_path):]))
            if not (self._is_excluded_file(file=triggered_location) or
                    self._is_excluded_file(file=corresponding_location)):
                self._hard_link_location(
                    source=triggered_location, target=corresponding_location)
        return self

    @JointPoint
# # python3.5
# #     def _hard_link_directory(
# #         self: Self, triggered_location: FileHandler,
# #         corresponding_location: FileHandler,
# #         check_all: builtins.bool
# #     ) -> Self:
    def _hard_link_directory(
        self, triggered_location, corresponding_location, check_all
    ):
# #
        '''
            Hard links all files in given directory to files with same name \
            in given corresponding location.
        '''
        for file in corresponding_location:
            if not self._is_excluded_file(file):
                base_file = FileHandler(
                    location=triggered_location.path + file.name)
                if(file.is_file() and base_file.is_file() and
                   not base_file.is_same_file(other_location=file)):
                    self._hard_link_file(base_file, target=file)
                    if not check_all:
                        break
                elif file.is_directory() and base_file.is_directory():
                    self._hard_link_structure(
                        triggered_location=base_file,
                        responsible_path=base_file.path,
                        affected_locations=(file.path,), check_all=check_all)
        return self

    @JointPoint
# # python3.5
# #     def _hard_link_file(
# #         self: Self, base_file: FileHandler, target: FileHandler
# #     ) -> Self:
    def _hard_link_file(self, base_file, target):
# #
        '''
            Hard link given file to their corresponding one. And logs this \
            behavior.
        '''
        if not base_file.is_same_file(other_location=target):
            __logger__.info(
                'Hardlink "%s" with "%s".', base_file.path, target.path)
            try:
                base_file.make_hardlink(target, force=True)
            except builtins.BaseException as exception:
# # python3.5
# #                 __logger__.critical(
# #                     'Couldn\'t link to "%s". %s: %s', target.path,
# #                     exception.__class__.__name__, builtins.str(exception))
                __logger__.critical(
                    'Couldn\'t link to "%s". %s: %s', target.path,
                    exception.__class__.__name__, convert_to_unicode(
                        exception))
# #
            else:
                self.trigger_location(triggered_location=target)
        return self

        # endregion

    # endregion

# endregion

# region footer

'''
    Preset some variables given by introspection letting the linter know what \
    globale variables are available.
'''
__logger__ = __exception__ = __module_name__ = __file_path__ = \
    __test_mode__ = __test_buffer__ = __test_folder__ = __test_globals__ = None
'''
    Extends this module with some magic environment variables to provide \
    better introspection support. A generic command line interface for some \
    code preprocessing tools is provided by default.
'''
Module.default(name=__name__, frame=inspect.currentframe())

# endregion

# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion
