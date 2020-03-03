#!/usr/bin/env python

import argparse
import configparser
import os


class CrossFileGenerator:
    def __init__(self, arch, output_file):
        self.arch = arch
        self.output_file = output_file
        self.cflags = os.environ['CFLAGS'] if 'CFLAGS' in os.environ else ''
        self.cxxflags = os.environ['CXXFLAGS'] if 'CXXFLAGS' in os.environ else ''
        self.ldflags = os.environ['LDFLAGS'] if 'LDFLAGS' in os.environ else ''

        if self.arch == 'aarch64':
            self.cpu_family = 'aarch64'
            self.processor = 'arm64'
        elif self.arch == 'armv7a-eabi':
            self.cpu_family = 'arm'
            self.processor = 'armv7a'
        elif self.arch == 'x86':
            self.cpu_family = "x86"
            self.processor = 'i686'
        else:
            self.cpu_family = 'x86_64'
            self.processor = 'x86_64'

    def generate(self):
        config = configparser.ConfigParser()
        config['binaries'] = self.get_binaries_section()
        config['properties'] = self.get_properties_section()
        config['host_machine'] = self.get_host_machine_section()

        with open(self.output_file, 'w') as configfile:
            config.write(configfile)

    def get_binaries_section(self):
        binaries = {'c': "'{}'".format(os.environ['ANDROID_CC']),
                    'cpp': "'{}'".format(os.environ['ANDROID_CXX']),
                    'ar': "'{}'".format(os.environ['ANDROID_AR']),
                    'as': "'{}'".format(os.environ['ANDROID_AS']),
                    'nm': "'{}'".format(os.environ['ANDROID_NM']),
                    'ranlib': "'{}'".format(os.environ['ANDROID_RANLIB']),
                    'strip': "'{}'".format(os.environ['ANDROID_STRIP']),
                    'pkgconfig': "'android-{}-pkg-config'".format(self.arch),
                    'cmake': "'android-{}-cmake'".format(self.arch)}

        return binaries

    def get_properties_section(self):
        return {'root': "'{}'".format(os.environ['ANDROID_PREFIX']),
                'sys_root': "'{}'".format(os.environ['ANDROID_SYSROOT']),
                'c_args': [f for f in self.cflags.split(" ") if f],
                'cpp_args': [f for f in self.cxxflags.split(" ") if f],
                'c_link_args': [f for f in self.ldflags.split(" ") if f],
                'cpp_link_args': [f for f in self.ldflags.split(" ") if f],
                'needs_exe_wrapper': 'true'}

    def get_host_machine_section(self):
        return {'system': "'android'",
                'cpu_family': "'{}'".format(self.cpu_family),
                'cpu': "'{}'".format(self.processor),
                'endian': "'little'"}


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Generate a meson cross file using CFLAGS/CXXFLAGS/LDFLAGS from env vars',
                                    add_help=False)
    required = parser.add_argument_group('required arguments')
    optional = parser.add_argument_group('optional arguments')
    required.add_argument('--arch',
                          type=str,
                          required=True,
                          choices=['aarch64', 'armv7a-eabi', 'x86', 'x86-64'],
                          help='Architecture to use for cross file generation')
    required.add_argument('--output-file',
                          type=str,
                          required=True,
                          help='Write the generated cross file to this path')
    optional.add_argument('-h',
                          '--help',
                          action='help',
                          default=argparse.SUPPRESS,
                          help='show this help message and exit')
    args = parser.parse_args()
    generator = CrossFileGenerator(args.arch, args.output_file)
    generator.generate()
