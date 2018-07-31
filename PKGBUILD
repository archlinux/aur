# Maintainer: Bart De Vries <devriesb@gmail.com>

pkgname=popl
pkgver=1.2.0
pkgrel=1
pkgdesc="Header-only C++ program options parser library"
arch=(any)
url="https://github.com/badaix/popl"
license=('MIT')
makedepends=(git)
source=("https://github.com/badaix/popl/archive/v${pkgver}.tar.gz")
sha256sums=('dee63eed9bac3da9ec0008902c7ec72caa319461b20fc116e57e45948671a0bf')

package() {
        cd "${pkgname}-${pkgver}"
	install -Dm644 -g root -o root include/popl.hpp "${pkgdir}/usr/include/popl.hpp"
}
