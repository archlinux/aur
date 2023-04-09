#!/usr/bin/env python3
"""Run applications an another user"""

from argparse import ArgumentParser
from os import environ
from pwd import getpwall, getpwuid, getpwnam
from shutil import which
import subprocess
from sys import stderr
# sh = subprocess.run
# from subprocess import check_output as sh

description = "Run applications as another user"
version = 0.1

def sh(command):
    result = subprocess.run(command,
                            stdout=subprocess.PIPE,
                            text=True)
    return result

def not_found_msg(obj_type, user):
    print(f"ERROR: {obj_type} '{user}' not found.")

def resolve(user, uid=False):
    getuser = getpwnam
    if uid:
        getuser = getpwuid
    try:
        return getuser(user)
    except KeyError as no_user:
        return False

def resolve_systemd_homed(user):
    homectl_cmd = ['homectl',
                   'list']
    homectl = sh(homectl_cmd)
    homectl_out = homectl.stdout
    for line in homectl_out.split("\n")[1:-3]:
        _user = line.split(" ")[0]
        if user == _user:
            return True


def run_as(user, command, command_args, X=False):
    machinectl_cmd = ['machinectl',
                      'shell',
                      f"--uid={user}"]
    if X:
        display = environ['DISPLAY']
        machinectl_cmd.append(f"--setenv=DISPLAY={display}")

    machinectl_cmd.extend([".host", 
                           command,
                           *command_args])
    print("running", machinectl_cmd)
    machinectl = sh(machinectl_cmd)
    machinectl_out = machinectl.stdout

    print("output", machinectl_out)

def get_args():
    parser = ArgumentParser(description=description)
    version = {'args': ['--version'],
               'kwargs': {'dest': 'version',
                          'action': 'store_true',
                          'default': False,
                          'help': 'print version'}}

    X = {'args': ['--X'],
         'kwargs': {'dest': 'X',
                    'action': 'store_true',
                    'default': False,
                    'help': ('pass an X display to destination '
                             'user environment')}}
    uid = {'args': ['--uid'],
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
        user = resolve(args.user, uid=args.uid)
        if not user:
            not_found_msg("user", args.user)
            exit()
        uid = user.pw_uid

    if args.command:
        if not which(args.command):
            not_found_msg("command", args.command)
            exit()
        else:
            command = which(args.command)

    if not (args.user and args.command):
        parser.print_help(stderr)
        exit()

    run_as(uid,
           command,
           args.command_args,
           X=args.X)


if __name__ == "__main__":
    main()
