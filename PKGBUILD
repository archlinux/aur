# Maintainer: Kevin Boss <kevin dot boss at outlook dot com>
pkgname=haus-bin
pkgver=0.1.0
pkgrel=2
pkgdesc="Command-line interface for Home Assistant"
arch=('x86_64')
url="https://github.com/kevinboss/haus"
license=('GPL-3.0-or-later')
provides=('haus')
conflicts=('haus')
source_x86_64=("${url}/releases/download/v${pkgver}/haus-v${pkgver}-linux-x64.tar.gz")
sha256sums_x86_64=('b0128f93c0bd7df7b42fbc4dc2f7f90e4c917fb7a3bc053b2fc08de407b94d8e')

package() {
  install -Dm755 "${srcdir}/haus-v${pkgver}-linux-x64/Haus" "${pkgdir}/usr/bin/haus"
}
