# Maintainer: Sebastian Koller <seb.koller@gmail.com>
pkgname=moneyguru
pkgver=2.11.0
pkgrel=1
pkgdesc="Personal finance management application"
arch=(any)
url="http://www.hardcoded.net/${pkgname}/"
license=('GPL3')
depends=('python' 'python-pyqt5')
makedepends=()
source=(https://download.hardcoded.net/${pkgname}-src-${pkgver}.tar.gz)
md5sums=('108e1362b14c294a7a5ec2c7857b36f1')

package() {
  cd "${srcdir}"
  make PREFIX="/usr" DESTDIR="$pkgdir" install
}


