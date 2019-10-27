# Maintainer: Bart De Vries <devriesb@gmail.com>

pkgname=aixlog
pkgver=1.2.2
pkgrel=2
pkgdesc="Header-only C++ logging library"
arch=(any)
url="https://github.com/badaix/aixlog"
license=('MIT')
source=("https://github.com/badaix/aixlog/archive/v${pkgver}.tar.gz")
sha256sums=('d7c4c7967910bd44e77152cfc7c7fa5e733d5811cf98f0a987e1bc797b2ed090')

package() {
        cd "${pkgname}-${pkgver}"
	install -Dm644 -g root -o root include/aixlog.hpp "${pkgdir}/usr/include/aixlog.hpp"
}
