# Maintainer: Bart De Vries <bart at mogwai dot be>

pkgname=aixlog
pkgver=1.5.0
pkgrel=2
pkgdesc="Header-only C++ logging library"
arch=(any)
url="https://github.com/badaix/aixlog"
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/badaix/aixlog/archive/v${pkgver}.tar.gz")
sha256sums=('c32b2b2e7ed2632fab53aba01f731fce1e7b150fe7d08bccdafc250e5cb836a8')

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm644 -g root -o root include/aixlog.hpp "${pkgdir}/usr/include/aixlog.hpp"
}
