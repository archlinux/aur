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
import os.path
from dataclasses import dataclass

@dataclass
class Architecture:
    uos: str
    arch: str
    version: str
    url: str
    file: str
    sha256sum: bytes

architectures=(
    Architecture('amd64', 'x86_64', '', '', '', b''),
    Architecture('arm64', 'aarch64', '', '', '', b''),
    Architecture('loongarch64', 'loong64', '', '', '', b'')
)

url_appstore='https://home-store-packages.uniontech.com/appstore'

session = requests.Session()

for architecture in architectures:
    print(f"=> Fetching for architecture '{architecture.uos}' (Uniontech OS) / '{architecture.arch}' (Arch Linux)")
    url = f'{url_appstore}/dists/eagle/appstore/binary-{architecture.uos}/Packages.gz'
    response = session.get(url)
    if response.status_code != 200:
        raise Exception(f'Request code is {response.status_code}')
    buffer = zlib.decompress(response.content, wbits = 31)
    packages=buffer.split(b'\n\n')
    wechat=None
    for package in packages:
        if package.startswith(b'Package: com.tencent.wechat\n'):
            wechat=package
            break
    if wechat is None:
        raise Exception(f"Failed to find package com.tencent.wechat for arch '{architecture.uos}'")
    version = None
    filename = None
    for line in package.split(b'\n'):
        if line.startswith(b'Version: '):
            version = line[9:]
        if line.startswith(b'Filename: '):
            filename = line[10:]
    if version is None or filename is None:
        raise Exception(f"Failed to get version and filename for arch '{architecture.uos}'")
    architecture.version = version.decode('utf-8')
    architecture.url = f"{url_appstore}/{filename.decode('utf-8')}"
    architecture.file = f"wechat-universal_{architecture.version}_{architecture.arch}.deb"
    print(f"{architecture.arch}: {architecture.version}: {architecture.url} => {architecture.file}")
    if os.path.exists(architecture.file):
        with open(architecture.file, 'rb') as f:
            buffer = f.read()
    else:
        response = session.get(architecture.url)
        if response.status_code != 200:
            raise Exception(f'Request code is {response.status_code}')
        with open(architecture.file, 'wb') as f:
            f.write(response.content)
        buffer = response.content
    sha256sum = hashlib.sha256(buffer)
    architecture.sha256sum = sha256sum.hexdigest()

for architecture in architectures:
    print(f"source_{architecture.arch}=(\n\t'{architecture.file}::{architecture.url}'\n)")
for architecture in architectures:
    print(f"sha256sums_{architecture.arch}=(\n\t'{architecture.sha256sum}'\n)")