# Maintainer: Bart De Vries <devriesb@gmail.com>

pkgname=aixlog
pkgver=1.2.4
pkgrel=1
pkgdesc="Header-only C++ logging library"
arch=(any)
url="https://github.com/badaix/aixlog"
license=('MIT')
source=("https://github.com/badaix/aixlog/archive/v${pkgver}.tar.gz")
sha256sums=('553c57ef2a98a0015cde8f5f6c1a0694a0f44bb2494103be51879945ff4e5c87')

package() {
        cd "${pkgname}-${pkgver}"
	install -Dm644 -g root -o root include/aixlog.hpp "${pkgdir}/usr/include/aixlog.hpp"
}
