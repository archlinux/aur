# Maintainer: Kevin Boss <kevin dot boss at outlook dot com>
pkgname=haus-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Command-line interface for Home Assistant"
arch=('x86_64')
url="https://github.com/kevinboss/haus"
license=('GPL-3.0-or-later')
provides=('haus')
conflicts=('haus')
options=('!strip')
source_x86_64=("${url}/releases/download/v${pkgver}/haus-v${pkgver}-linux-x64.tar.gz")
sha256sums_x86_64=('f0d62b8d6f8038d3575215f1596298a63b6b050ea1e52294654fe9c07acd635e')

package() {
  install -Dm755 "${srcdir}/haus-v${pkgver}-linux-x64/Haus" "${pkgdir}/usr/bin/haus"
}
