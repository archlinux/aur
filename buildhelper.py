# Helper script for PKGBUILD
#
# Previously required jq/ripgrep, now just needs the python stdlib

import argparse
import json
import re

VERSION_PATTERN = re.compile(
    r"^(?P<primary>[\w\.]+)(?:-(?P<build>dev[\w\.]+)\+(?P<rev>\w+))?$"
)


def print_version(*, version_data, format="raw", **_kwargs):
    assert format in ["raw", "sanitize"], format
    raw_version = version_data["version"]
    assert isinstance(raw_version, str)
    version_info = VERSION_PATTERN.fullmatch(raw_version)
    if version_info is None:
        raise RuntimeError(f"Unexpected version {raw_version!r}")
    if format == "sanitize" and version_info.group("build") is not None:
        # Sanitize `-` to `_`, `+` to `.g`
        #
        # So `0.12.0-dev.3429+13a9d94a8` becomes `0.12.0_dev.3429.g13a9d94a8`
        #
        # See PKGBUILD.pkgver for full details
        # The sanitization is not necessary if we are not using a dev build
        print(
            "{}_{}.g{}".format(
                version_info["primary"],
                version_info["build"],
                version_info["rev"],
            )
        )
    else:
        print(raw_version)


def print_date(*, version_data, **_kwargs):
    print(version_data["date"])


def print_url(*, platform_data, **_kwargs):
    print(platform_data["tarball"])


def print_hash(*, platform_data, **_kwargs):
    print(platform_data["shasum"])


SUBCOMMANDS = {
    func.__name__: func for func in [print_version, print_date, print_url, print_hash]
}


def main():
    parser = argparse.ArgumentParser(prog="buildhelper")
    parser.add_argument(
        "--index-file", "--index", type=argparse.FileType(), required=True
    )
    parser.add_argument("--target-arch", "--arch", required=True)
    subparser = parser.add_subparsers(required=True, dest="subcommand_name")
    parser_print_version = subparser.add_parser("print-version")
    parser_print_version.add_argument(
        "--sanitize",
        dest="format",
        action="store_const",
        const="sanitize",
        help="Sanitize the version to make usable with pacman",
    )
    parser_print_version.set_defaults(format="raw")
    subparser.add_parser("print-url")
    subparser.add_parser("print-hash")
    subparser.add_parser("print-date")

    args = parser.parse_args()

    # parse index file
    index_data = json.load(args.index_file)
    args.version_data = index_data["master"]
    args.platform_data = args.version_data[f"{args.target_arch}-linux"]

    # execute subcommand
    SUBCOMMANDS[args.subcommand_name.replace("-", "_")](**vars(args))


if __name__ == "__main__":
    main()
