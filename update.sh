#! /bin/sh

set -xe

_name='Beekeeper Studio'
_pkgname='beekeeper-studio'
_url_source='https://github.com/beekeeper-studio/beekeeper-studio'

if [[ $# == 0 ]]; then
    echo 'Usage: ./update.sh VERSION_NUMBER'
    exit 1
fi
pkgrel=1
if [[ $# == 2 ]]; then
    pkgrel=$2
fi

printf '' > PKGBUILD
echo "# Maintainer: Sitansh Rajput <me [at] lostpolaris [dot] com>
# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Michael Lutonsky <m@luto.at>
# Contributor: Tássio Virgínio <tassiovirginio@gmail.com>

pkgname='${_pkgname}-bin'
pkgver=$1
pkgrel=1
pkgdesc='Modern and easy to use SQL client for MySQL, Postgres, SQLite, SQL Server, and more'
arch=('x86_64' 'aarch64')
url='https://www.beekeeperstudio.io'
license=('MIT')
depends=('libappindicator-gtk3' 'libnotify' 'libsecret' 'libxss' 'libxslt' 'nodejs' 'nss' 'xdg-utils')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-$1-license::${_url_source}/raw/v$1/LICENSE.md")
source_x86_64=("${_url_source}/releases/download/v$1/${_pkgname}_$1_amd64.deb")
source_aarch64=("${_url_source}/releases/download/v$1/${_pkgname}_$1_arm64.deb")
sha256sums=()
sha256sums_x86_64=()
sha256sums_aarch64=()

package() {
  tar -xvf 'data.tar.xz' -C \"\${pkgdir}\"
  rm -rf \"\${pkgdir}/usr/share/doc\"
  install -dv \"\${pkgdir}/usr/bin\"
  ln -sfv \"/opt/${_name}/${_pkgname}\" -t \"\${pkgdir}/usr/bin\"
  install -Dvm644 \"\${pkgdir}/opt/${_name}/\"{'LICENSE.electron.txt','LICENSES.chromium.html'} \\
    -t \"\${pkgdir}/usr/share/licenses/${_pkgname}\"
  install -Dvm644 \"${_pkgname}-$1-license\" \"\${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE\"
}
" >> PKGBUILD

updpkgsums
makepkg --printsrcinfo > .SRCINFO

# Test
makepkg -f
