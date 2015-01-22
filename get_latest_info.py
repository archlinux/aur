#!/usr/bin/env python

import requests
import requests.exceptions
import sys

from argparse import ArgumentParser
from xml.etree import ElementTree as ET


def setup_argparser():
    arg_parser = ArgumentParser(
        description="Retrieve latest information for a Mozilla add-on. This "
        "includes the latest version and the current download URL."
    )

    arg_parser.add_argument(
        "-u",
        "--url-prefix",
        default="",
        help="Optional string to prepend to URL before outputting it."
    )
    arg_parser.add_argument(
        "-o",
        "--os",
        help="If given, fetch URL for the given operating system. Not "
        "specifying this option fetches the first URL in the API response."
    )
    arg_parser.add_argument(
        "-p",
        "--pkgbuild",
        action="store_true",
        help="Output appropriate lines for a PKGBUILD."
    )

    arg_parser.add_argument(
        "addon_id",
        type=int,
        help="ID of add-on to retrieve information for."
    )

    return arg_parser

def get_latest_addon_info(addon_id, os):
    resp = requests.get(
        "https://services.addons.mozilla.org/api/1.5/addon/%d" % addon_id
    )
    resp.raise_for_status()

    # Now we got the API response, so parse it.
    parsed_resp = ET.fromstring(resp.text)
    
    install_xpath = "install"
    if os is not None:
        install_xpath += "[@os='%s']" % os

    install = None
    for elm in parsed_resp.findall(install_xpath):
        if elm.get("status") != "Beta":
            install = elm.text
            break

    return parsed_resp.findtext("version"), install


parsed_args = setup_argparser().parse_args()

try:
    version, url = get_latest_addon_info(parsed_args.addon_id, parsed_args.os)
except (requests.exceptions.RequestException, ET.ParseError) as e:
    print(
        "E: Could not retrieve latest information: %s" % e,
        file=sys.stderr
    )
    sys.exit(2)

if url is None:
    print(
        "E: No match for OS `%s' found." % parsed_args.os,
        file=sys.stderr
    )
    sys.exit(3)


url = parsed_args.url_prefix + url

if not parsed_args.pkgbuild:
    print(
        "VERSION=%s" % version
    )
    print(
        "URL=%s" % url
    )
else:
    print(
        "pkgver='%s'" % version
    )
    print(
        "source=('%s')" % url
    )
