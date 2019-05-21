#!/usr/bin/env python3
# -*- enconding: utf-8 -*-

import sys
import json
import subprocess
from pathlib import Path
from urllib.request import urlopen

BRANCHES = ['alpha', 'beta', 'stable']

PKGBUILD_TEMPLATE = r"""# Maintainer: Adler Neves <adlerosn@gmail.com>

provides=('pathio')
conflicts=('pathio')
_channel={0}
pkgver={1}
pkgname={2}
pkgrel={3}
_upstream_version={5}
_upstream_channel={6}
pkgdesc="A modern slicer for extrusion 3D printing provided by E3D Skunkworks (binary AppImage)."
arch=('x86_64')
makedepends=('elinks')
url="https://pathio.xyz/"
options=('!strip')
license=('custom:Pathio Software License Agreement')
_filename="pathio-$_channel-v$_upstream_version-$_upstream_channel$pkgrel.AppImage"
source=("$_filename::{4}"
        license.html::https://docs.pathio.xyz/pathio/latest/legal/termsAndConditions.html
        pathio.sh)
sha512sums=('SKIP'
            'SKIP'
            'SKIP')
"""

PKGBUILD_STATIC_PART = r"""
bluearrow() {
  echo -n -e "  \e[1m\e[34m->\e[39m\e[0m "
  echo $@
}

prepare() {
  cd "${srcdir}"

  bluearrow Converting license to plain text
  cat license.html | xargs echo | sed -re "s/^.*(<article.*?<\/article>).*$/\1/mg" | elinks -dump -dump-width 80 -no-references -no-numbering -force-html > LICENSE
  
  bluearrow Extracting AppImage
  chmod +x ${_filename}
  ./${_filename} --appimage-extract &>/dev/null

  bluearrow Creating CLI launcher
  sed -i "s/\${_filename}/${_filename}/" "${srcdir}/pathio.sh"

  bluearrow Setting desktop entry to use CLI launcher
  sed -i "s/^Exec=.*$/Exec=\/usr\/bin\/pathio %U/" "${srcdir}/squashfs-root/pathio.desktop"
}

package() {
  bluearrow License
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  bluearrow AppImage
  install -D -m 755  "${srcdir}/${_filename}" "${pkgdir}/opt/appimages/${_filename}"

  bluearrow CLI launcher
  install -D -m 755  "${srcdir}/pathio.sh" "${pkgdir}/usr/bin/pathio"

  bluearrow Application icon
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
  mkdir -p "${pkgdir}/usr/share/pixmaps/"
  install -D -m 644  "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/pathio.png" "${pkgdir}/usr/share/pixmaps/"

  bluearrow Desktop entry
  install -Dm644 "${srcdir}/squashfs-root/pathio.desktop" "${pkgdir}/usr/share/applications/pathio.desktop"
}
"""


def render_pkgbuild(branch, release):
    version2 = (
        release['version_major'],
        release['version_minor'],
        release['version_patch'],
        BRANCHES.index(release['version_channel_name'])
    )
    version = f"{version2[0]}.{version2[1]}.{version2[2]}_{version2[3]}"
    patch = release['version_channel_edition']
    url = release['download_url']
    pkgname = 'pathio-bin' if branch == 'stable' else f"pathio-{branch}-bin"
    return PKGBUILD_TEMPLATE.format(
        branch,
        version,
        pkgname,
        patch,
        url,
        '.'.join(list(map(str, version2[:-1]))),
        BRANCHES[version2[3]]
    )+PKGBUILD_STATIC_PART


def main():
    if len(sys.argv) != 2 or sys.argv[1] not in BRANCHES:
        print(f"Usage:")
        print(f"  {sys.argv[0]} branch")
        print()
        print(f"  Argument branch can be: stable,beta,alpha")
    else:
        Path('PKGBUILD').write_text(
            render_pkgbuild(
                sys.argv[1],
                json.loads(
                    urlopen(
                        f'https://api.pathio.xyz/api/asset/latest/{sys.argv[1]}/linux'
                    ).read()
                )
            )
        )
        subprocess.run("rm -f license.html", shell=True)
        subprocess.run("updpkgsums", shell=True).check_returncode()
        subprocess.run("makepkg --printsrcinfo > .SRCINFO",
                       shell=True).check_returncode()
        subprocess.run("rm -f license.html", shell=True)
        subprocess.run("makepkg -f", shell=True).check_returncode()
        subprocess.run('git commit -am "Version updated"',
                       shell=True).check_returncode()
        print('Now, double-check everything and "git push"')


if __name__ == '__main__':
    main()
