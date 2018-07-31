# Maintainer: Bart De Vries <devriesb@gmail.com>

pkgname=aixlog
pkgver=1.2.1
pkgrel=1
pkgdesc="Header-only C++ logging library"
arch=(any)
url="https://github.com/badaix/aixlog"
license=('MIT')
makedepends=(git)
source=("https://github.com/badaix/aixlog/archive/v${pkgver}.tar.gz")
sha256sums=('3ed6f47b3658607edfd94faf98034d31906b0f04f3fe4355e87a16f8dd582384')

package() {
        cd "${pkgname}-${pkgver}"
	install -Dm644 -g root -o root include/aixlog.hpp "${pkgdir}/usr/include/aixlog.hpp"
}
