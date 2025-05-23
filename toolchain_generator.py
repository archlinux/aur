#!/usr/bin/env python

import argparse
import configparser


class CrossFileGenerator:
    def __init__(self, output_file):
        self.arch = "aarch64-linux-gnu"
        self.output_file = output_file
        self.cflags = "-D_FORTIFY_SOURCE=3 -D_GLIBCXX_ASSERTIONS -O2 -pipe -fexceptions --param=ssp-buffer-size=4 -Wformat -Werror=format-security"
        self.cxxflags = "-D_FORTIFY_SOURCE=3 -D_GLIBCXX_ASSERTIONS -O2 -pipe -fexceptions --param=ssp-buffer-size=4 -Wformat -Werror=format-security"
        self.ldflags = "-Wl,-O1,--sort-common,--as-needed -fstack-protector"

        self.cpu_family = "aarch64"
        self.processor = "aarch64"

    def generate(self):
        config = configparser.ConfigParser()
        config["binaries"] = self.get_binaries_section()
        config["properties"] = self.get_properties_section()
        config["built-in options"] = self.get_builtin_options_section()
        config["host_machine"] = self.get_host_machine_section()
        with open(self.output_file, "w") as configfile:
            config.write(configfile)

    def get_binaries_section(self):
        binaries = {
            "c": "'{}-gcc'".format(self.arch),
            "cpp": "'{}-g++'".format(self.arch),
            "fortran": "'{}-gfortran'".format(self.arch),
            "ar": "'{}-gcc-ar'".format(self.arch),
            "pkgconfig": "'{}-pkg-config'".format(self.arch),
            "ranlib": "'{}-gcc-ranlib'".format(self.arch),
            "strip": "'{}-strip'".format(self.arch),
            "objcopy": "'{}-objcopy'".format(self.arch),
            "objdump": "'{}-objdump'".format(self.arch),
            "readelf": "'{}-readelf'".format(self.arch),
            "ld": "'{}-ld'".format(self.arch),
            "cmake": "'{}-cmake'".format(self.arch),
        }
        return binaries

    def get_properties_section(self):
        return {
            "root": "'{}'".format(self.arch),
            "sys_root": "'/usr/{}'".format(self.arch),
        }

    def get_builtin_options_section(self):
        return {
            "c_args": [f for f in self.cflags.split(" ") if f],
            "cpp_args": [f for f in self.cxxflags.split(" ") if f],
            "c_link_args": [f for f in self.ldflags.split(" ") if f],
            "cpp_link_args": [f for f in self.ldflags.split(" ") if f],
        }

    def get_host_machine_section(self):
        return {
            "system": "'linux'",
            "cpu_family": "'{}'".format(self.cpu_family),
            "cpu": "'{}'".format(self.processor),
            "endian": "'little'",
        }


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Generate a generic Meson cross file for arm64.",
        add_help=False,
    )
    required = parser.add_argument_group("required arguments")
    optional = parser.add_argument_group("optional arguments")
    required.add_argument(
        "--output-file",
        type=str,
        required=True,
        help="Write the generated cross file to this path",
    )
    optional.add_argument(
        "-h",
        "--help",
        action="help",
        default=argparse.SUPPRESS,
        help="show this help message and exit",
    )
    args = parser.parse_args()
    generator = CrossFileGenerator(args.output_file)
    generator.generate()
