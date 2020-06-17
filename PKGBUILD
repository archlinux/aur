# Maintainer: Bart De Vries <bart at mogwai dot be>

pkgname=aixlog
pkgver=1.4.0
pkgrel=1
pkgdesc="Header-only C++ logging library"
arch=(any)
url="https://github.com/badaix/aixlog"
license=('MIT')
source=("https://github.com/badaix/aixlog/archive/v${pkgver}.tar.gz")
sha256sums=('cce5b8f5408cfd19b4d4eb678274d0c74490dc0eb2bdc8f97c852036897d6099')

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm644 -g root -o root include/aixlog.hpp "${pkgdir}/usr/include/aixlog.hpp"
}
