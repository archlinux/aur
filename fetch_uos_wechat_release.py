#!/usr/bin/env python3
# Fetcher for UOS com.tencent.wechat release
# Copyright (C) 2024-present Guoxin "7Ji" Pu

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.

# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.


# A full package URL looks like this:
#   https://home-store-packages.uniontech.com/appstore/pool/appstore/c/com.tencent.wechat/com.tencent.wechat_1.0.0.236_arm64.deb
# For their safety, UOS mirrors verify client UAs for plain folder view across the whole site, except for exact file path
# home, pro, etc are all just cnames that resolve to app-store-files
# This is just like any other Debian mirrors:
#   https://mirrors.tuna.tsinghua.edu.cn/debian/pool/main/b/bash/bash_5.0-4_amd64.deb
# Package list of a release from a debian mirror lives in a different folder like this:
#   https://mirrors.tuna.tsinghua.edu.cn/debian/dists/bullseye/main/binary-amd64/Packages.xz
# Substitute the above and we get the following URL (eagle is the most recent release codename):
#   https://home-store-packages.uniontech.com/appstore/dists/eagle/appstore/binary-amd64/Packages.gz

import requests
import zlib
import hashlib
import os


class Architecture:
    arch_uos: str
    arch_archlinux: str
    version: str
    url: str
    file: str
    sha256: str
    sha1: str
    md5: str

    def __init__(self, arch_uos: str, arch_archlinux: str):
        self.arch_uos = arch_uos
        self.arch_archlinux = arch_archlinux
        self.version = None
        self.url = None
        self.file = None
        self.size = None
        self.sha256 = None
        self.sha1 = None
        self.md5 = None

    def fetch(self, url_appstore: str, session: requests.Session):
        print(
            f"=> Fetching for architecture '{self.arch_uos}' (Uniontech OS) / '{self.arch_archlinux}' (Arch Linux)"
        )
        url = f"{url_appstore}/dists/eagle/appstore/binary-{self.arch_uos}/Packages.gz"
        response = session.get(url, stream=True)
        if response.status_code != 200:
            raise Exception(f"Request code is {response.status_code}")
        decompressor = zlib.decompressobj(wbits=31)
        data = bytearray()
        for chunk in response.iter_content(0x100000):
            data += decompressor.decompress(chunk)
        data += decompressor.flush()

        wechat = None
        for package in data.split(b"\n\n"):
            if package.startswith(b"Package: com.tencent.wechat\n"):
                wechat = package
                break
        if wechat is None:
            raise Exception(
                f"Failed to find package com.tencent.wechat for arch '{self.arch_uos}'"
            )

        filename = None
        for line in package.split(b"\n"):
            if line.startswith(b"Version: "):
                self.version = line[9:].decode("utf-8")
            elif line.startswith(b"Filename: "):
                filename = line[10:].decode("utf-8")
            elif line.startswith(b"Size: "):
                self.size = int(line[6:])
            elif line.startswith(b"SHA256: "):
                self.sha256 = line[8:].decode("utf-8")
            elif line.startswith(b"SHA1: "):
                self.sha1 = line[6:].decode("utf-8")
            elif line.startswith(b"MD5sum: "):
                self.md5 = line[8:].decode("utf-8")
        if self.version is None:
            raise Exception("Failed to get version")
        if filename is None:
            raise Exception(f"Failed to get remote filename")
        self.url = f"{url_appstore}/{filename}"
        self.file = f"wechat-universal_{self.version}_{self.arch_archlinux}.deb"
        if self.size is None:
            raise Exception("Failed to get size")

    def cache(self, session: requests.Session):
        print(
            f"=> Caching for architecture '{self.arch_uos}' (Uniontech OS) / '{self.arch_archlinux}' (Arch Linux)"
        )
        if os.path.exists(self.file):
            with open(self.file, "rb") as f:
                data = f.read()
            sha256 = hashlib.sha256(data).hexdigest()
            sha1 = hashlib.sha1(data).hexdigest()
            md5 = hashlib.md5(data).hexdigest()
            integ = True
            if sha256 != self.sha256:
                print(f"sha256 not right, local {sha256} != remote {self.sha256}")
                integ = False
            if sha1 != self.sha1:
                print(f"sha1 not right, local {sha1} != remote {self.sha1}")
                integ = False
            if md5 != self.md5:
                print(f"md5 not right, local {md5} != remote {self.md5}")
                integ = False
            if integ:
                print("All integ passed, no need to redownload")
                return
            os.remove(self.file)
            print("Some integ failed, re-downloading")

        response = session.get(self.url)
        if response.status_code != 200:
            raise Exception(f"Request code is {response.status_code}")
        sha256 = hashlib.sha256(response.content).hexdigest()
        sha1 = hashlib.sha1(response.content).hexdigest()
        md5 = hashlib.md5(response.content).hexdigest()
        integ = True
        if sha256 != self.sha256:
            print(f"sha256 not right, file {sha256} != repo {self.sha256}")
            integ = False
        if sha1 != self.sha1:
            print(f"sha1 not right, file {sha1} != repo {self.sha1}")
            integ = False
        if md5 != self.md5:
            print(f"md5 not right, file {md5} != repo {self.md5}")
            integ = False
        if not integ:
            print("Some integ passed, would not save it, try to re-cache")
            return
        print("All integ passed, saving it to disk")
        with open(self.file, "wb") as f:
            f.write(response.content)


architectures = (
    Architecture("amd64", "x86_64"),
    Architecture("arm64", "aarch64"),
    Architecture("loongarch64", "loong64"),
)


url_appstore = "https://home-store-packages.uniontech.com/appstore"
session = requests.Session()

for architecture in architectures:
    architecture.fetch(url_appstore, session)
for architecture in architectures:
    print(
        f"source_{architecture.arch_archlinux}=(\n\t'{architecture.file}::{architecture.url}'\n)"
    )
for architecture in architectures:
    print(f"sha256sums_{architecture.arch_archlinux}=(\n\t'{architecture.sha256}'\n)")
for architecture in architectures:
    print(f"sha1sums_{architecture.arch_archlinux}=(\n\t'{architecture.sha1}'\n)")
for architecture in architectures:
    print(f"md5sums_{architecture.arch_archlinux}=(\n\t'{architecture.md5}'\n)")

print("Caching all files and verifying them...")
for architecture in architectures:
    architecture.cache(session)
