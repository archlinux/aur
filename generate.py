#!/usr/bin/env python
# --------------------------------------------------------------------
# generate.py
#
# Author: Lain Musgrove (lain.proliant@gmail.com)
# Date: Friday September 15, 2023
# --------------------------------------------------------------------

import hashlib

import requests
from jinja2 import Template
from xeno.shell import check

# --------------------------------------------------------------------
NAME = "xeno"


# --------------------------------------------------------------------
def pypi_checksum(package_name, version):
    url = f"https://pypi.org/pypi/{package_name}/json"
    response = requests.get(url)
    data = response.json()
    download_url = data["releases"][version][0]["url"]
    response = requests.get(download_url)
    checksum = hashlib.sha256(response.content).hexdigest()
    return checksum


# --------------------------------------------------------------------
def pypi_latest_version(package_name):
    url = f"https://pypi.org/pypi/{package_name}/json"
    response = requests.get(url)
    data = response.json()
    return data["info"]["version"]


# --------------------------------------------------------------------
def load_template(file):
    with open(file, "r") as infile:
        return Template(infile.read())


# --------------------------------------------------------------------
def main():
    pkgbuild_template = load_template("./PKGBUILD.jinja")
    srcinfo_template = load_template("./SRCINFO.jinja")

    version = pypi_latest_version(NAME)

    data = {"version": version, "checksum": pypi_checksum(NAME, version)}

    with open("./.SRCINFO", "w") as outfile:
        outfile.write(srcinfo_template.render(**data))

    with open("./PKGBUILD", "w") as outfile:
        outfile.write(pkgbuild_template.render(**data))


# --------------------------------------------------------------------
if __name__ == "__main__":
    main()
