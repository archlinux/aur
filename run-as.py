#!/usr/bin/env python3
"""Run applications an another user"""

#    run-as
#
#    ----------------------------------------------------------------------
#    Copyright © 2023  Pellegrino Prevete
#
#    All rights reserved
#    ----------------------------------------------------------------------
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Affero General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Affero General Public License for more details.
#
#    You should have received a copy of the GNU Affero General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.
#

from argparse import ArgumentParser
from os import environ, stat
from pwd import getpwall, getpwuid, getpwnam
from shutil import which
import subprocess
from sys import stderr

description = "Run applications as another user"
version = 0.1

def sh(command):
    result = subprocess.run(command,
                            stdout=subprocess.PIPE,
                            text=True)
    return result

def no_access_msg():
    print("WARNING: you are trying to run an user script")

def not_found_msg(obj_type, user):
    print(f"ERROR: {obj_type} '{user}' not found.")

def resolve_user(user, uid=False):
    getuser = getpwnam
    if uid:
        getuser = getpwuid
    try:
        return getuser(user)
    except KeyError as no_user:
        return False

def resolve_command(command):
    if not which(command):
       try:
           stat(command)
       except PermissionError as no_access:
           no_access_msg()
       except FileNotFoundError as not_found:
           not_found_msg("command", command)
           return
       return command
    return which(command)
 

def resolve_systemd_homed(user):
    homectl_cmd = ['homectl',
                   'list']
    homectl = sh(homectl_cmd)
    homectl_out = homectl.stdout
    for line in homectl_out.split("\n")[1:-3]:
        _user = line.split(" ")[0]
        if user == _user:
            return True

def xhost(uid):
    user = getpwuid(uid).pw_name
    xhost_cmd = ['xhost',
                 f"+si:localuser:{user}"]
    xhost = sh(xhost_cmd)
    xhost_out = xhost.stdout

def run_as(uid, command, command_args, X=False):
    machinectl_cmd = ['machinectl',
                      'shell',
                      f"--uid={uid}"]
    call_cmd = []
    if X:
        display = environ['DISPLAY']
        machinectl_cmd.append(f"--setenv=DISPLAY={display}")
        call_cmd.append(which("enable-graphical-services"))
        xhost(uid)

    machinectl_cmd.append(".host")
    call_cmd.extend([command, *command_args])
    machinectl_cmd.extend(call_cmd)

    machinectl = sh(machinectl_cmd)
    machinectl_out = machinectl.stdout

    return machinectl_out

def get_args():
    parser = ArgumentParser(description=description)
    version = {'args': ['-V', '--version'],
               'kwargs': {'dest': 'version',
                          'action': 'store_true',
                          'default': False,
                          'help': 'print version'}}

    X = {'args': ['-X', '--graphical'],
         'kwargs': {'dest': 'X',
                    'action': 'store_true',
                    'default': False,
                    'help': 'run a graphical application'}}
    uid = {'args': ['-U', '--uid'],
           'kwargs': {'dest': 'uid',
                      'action': 'store_true',
                      'default': False,
                      'help': 'pass user as an uid'}}

    user = {'args': ['user'],
            'kwargs': {'nargs': "?",
                       'action': 'store',
                       'help': "username or UID you want to run as"}}

    command = {'args': ['command'],
               'kwargs': {'nargs': "?",
                          'action': 'store',
                          'help': "command you want to run"}}

    command_args = {'args': ['command_args'],
                    'kwargs': {'nargs': '*',
                               'action': 'store',
                               'help': "arguments to pass to the command"}}

    args = [version,
            X,
            uid,
            user,
            command,
            command_args]

    for arg in args:
        parser.add_argument(*arg['args'],
                            **arg['kwargs'])

    return parser, parser.parse_args()


def main():
    parser, args = get_args()

    if args.version:
        print(version)
        exit()

    if args.user:
        user = resolve_user(args.user, uid=args.uid)
        if not user:
            not_found_msg("user", args.user)
            exit()
        uid = user.pw_uid

    if args.command:
        command = resolve_command(args.command)
        if not command:
           not_found_msg("command", args.command)
           exit()

    if not (args.user and args.command):
        parser.print_help(stderr)
        exit()

    out = run_as(uid,
                 command,
                 args.command_args,
                 X=args.X)
    
    print(out)


if __name__ == "__main__":
    main()
