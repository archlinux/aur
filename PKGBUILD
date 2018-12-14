# Maintainer: Sebastian Koller <seb.koller@gmail.com>
pkgname=moneyguru
pkgver=2.12.0
pkgrel=2
pkgdesc="Personal finance management application"
arch=('x86_64')
url="http://www.hardcoded.net/${pkgname}/"
license=('GPL3')
depends=('python' 'python-pyqt5')
makedepends=()
options=(!buildflags)
source=(https://download.hardcoded.net/${pkgname}-src-${pkgver}.tar.gz)
sha1sums=('a74fe0c1ef4ca8d30b30a4d4e61d7e0527c8ba74')

package() {
  make -C ${srcdir} PREFIX="/usr" DESTDIR="$pkgdir" install
  ln -sf /usr/share/moneyguru/run.py ${pkgdir}/usr/bin/moneyguru
}


