# Maintainer: Bart De Vries <devriesb@gmail.com>

pkgname=popl
pkgver=1.3.0
pkgrel=1
pkgdesc="Header-only C++ program options parser library"
arch=(any)
url="https://github.com/badaix/popl"
license=('MIT')
source=("https://github.com/badaix/popl/archive/v${pkgver}.tar.gz")
sha256sums=('7c59554371da3c6c093bd79c2f403f921c1938bd523f1a48682352e0d92883a6')

package() {
        cd "${pkgname}-${pkgver}"
	install -Dm644 -g root -o root include/popl.hpp "${pkgdir}/usr/include/popl.hpp"
}
