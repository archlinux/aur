# Maintainer: Bart De Vries <devriesb@gmail.com>

pkgname=aixlog
pkgver=1.3.0
pkgrel=1
pkgdesc="Header-only C++ logging library"
arch=(any)
url="https://github.com/badaix/aixlog"
license=('MIT')
source=("https://github.com/badaix/aixlog/archive/v${pkgver}.tar.gz")
sha256sums=('748a00d3185eeb5cd8f0d751c4ef89d8c0948364024a432d2536eef883c9c782')

package() {
        cd "${pkgname}-${pkgver}"
	install -Dm644 -g root -o root include/aixlog.hpp "${pkgdir}/usr/include/aixlog.hpp"
}
