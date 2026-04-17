# Maintainer: Kevin Boss <kevin dot boss at outlook dot com>
pkgname=haus-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Command-line interface for Home Assistant"
arch=('x86_64')
url="https://github.com/kevinboss/haus"
license=('GPL-3.0-or-later')
provides=('haus')
conflicts=('haus')
source_x86_64=("${url}/releases/download/v${pkgver}/haus-v${pkgver}-linux-x64.tar.gz")
sha256sums_x86_64=('e571595b95520053d597b0450401b796c159e0e986179dad370b11bd561c942f')

package() {
  install -Dm755 "${srcdir}/haus-v${pkgver}-linux-x64/Haus" "${pkgdir}/usr/bin/haus"
}
