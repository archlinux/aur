#!/usr/bin/env python
#
# Copyright (c) 2015, Tilman Blumenbach
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without modification, are permitted provided that the
# following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following
# disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the
# following disclaimer in the documentation and/or other materials provided with the distribution.
#
# 3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote
# products derived from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
# INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
# USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

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

if version is None:
    print(
        "E: No version information found in API response. API may be malfunctioning.",
        file=sys.stderr
    )
    sys.exit(2)

if url is None:
    print(
        "E: No match for OS `%s' found." % parsed_args.os,
        file=sys.stderr
    )
    sys.exit(3)


version = version.replace("-", "_")
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
