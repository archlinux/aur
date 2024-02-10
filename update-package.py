#!/usr/bin/env python3

import os
import re
import requests
import subprocess

from pprint import pprint


def get_releases(project="prusa3d/PrusaSlicer"):
    # get list of all releases
    api_url = f"https://api.github.com/repos/{project}/releases"

    resp = requests.get(api_url)
    resp.raise_for_status()
    resp_obj = resp.json()
    return resp_obj


def get_latest_release(releases):
    latest = None
    latest_release = releases[0]
    print(latest_release)
#
#    for entry in releases:
#        if "tag_name" in entry:
#            value = entry["tag_name"]
#            print(value, latest)
#            # need to handle going from alpha, beta, rc -> actual release
#            if not latest or value > latest:
#                latest = value
#                latest_release = entry
    return latest_release


def get_desired_asset(release, ext="AppImage", arch="x64", gui="GTK3"):
    for entry in release["assets"]:
        if entry["name"].endswith(ext):
            if arch in entry["name"] and gui in entry["name"]:
                return entry
    return None


def parse_asset(asset):
    pattern = r'(?P<project>[^-]*)-(?P<version>[^+]*).(?P<os>[^-]*)-(?P<arch>[^-]*)-(?P<gui>[^-]*)-(?P<datetime>[^.]*).(?P<ext>.*)'
    compiled = re.compile(pattern)
    name = asset["name"]
    m = compiled.match(name)
    version = m.group("version")
    datetime = m.group("datetime")
    return version, datetime


def update_pkgbuild(_version, datetime):
    version = _version.replace("-", "")
    updated = []
    with open("PKGBUILD", mode="r") as handle:
        contents = handle.read()
    for line in contents.splitlines():
        if line.startswith("pkgver="):
            line = f"pkgver={version}"
        elif line.startswith("_pkgver="):
            line = f"_pkgver={_version}"
        elif line.startswith("_pkgdate="):
            line = f"_pkgdate={datetime}"
        updated.append(line + "\n")
    with open("PKGBUILD", mode="w") as handle:
        handle.writelines(updated)
    # ensure the sha256sums are updated
    updpkgsums_cmd = ['updpkgsums']
    subprocess.call(updpkgsums_cmd, shell=False)
    # ensure .SRCINFO is updated
    makepkg_cmd = ['makepkg', '--printsrcinfo']
    with open('.SRCINFO', mode='w') as handle:
        subprocess.call(makepkg_cmd, stdout=handle, shell=False)


def main():
    releases = get_releases()
    release = get_latest_release(releases)
    asset = get_desired_asset(release)
    version, datetime = parse_asset(asset)
    update_pkgbuild(version, datetime)


if __name__ == '__main__':
    main()
