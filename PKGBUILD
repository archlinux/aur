# Maintainer: Bart De Vries <bart at mogwai dot be>

pkgname=aixlog
pkgver=1.5.0
pkgrel=1
pkgdesc="Header-only C++ logging library"
arch=(any)
url="https://github.com/badaix/aixlog"
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/badaix/aixlog/archive/v${pkgver}.tar.gz")
sha256sums=('1d9d344448493c1e74e0baa5e76fc175b9e4497012d6d17591ca49c2e511fbe8')

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm644 -g root -o root include/aixlog.hpp "${pkgdir}/usr/include/aixlog.hpp"
}
