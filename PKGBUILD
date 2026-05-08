# Maintainer: Kevin Boss <kevin dot boss at outlook dot com>
pkgname=haus-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Command-line interface for Home Assistant"
arch=('x86_64')
url="https://github.com/kevinboss/haus"
license=('GPL-3.0-or-later')
provides=('haus')
conflicts=('haus')
options=('!strip')
source_x86_64=("${url}/releases/download/v${pkgver}/haus-v${pkgver}-linux-x64.tar.gz")
sha256sums_x86_64=('b95b78781484c80f4d11ebaa679a62fd9178458101e7f3af624c422fc394dd9e')

package() {
  install -Dm755 "${srcdir}/haus-v${pkgver}-linux-x64/Haus" "${pkgdir}/usr/bin/haus"
}
