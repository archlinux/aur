# Maintainer: Benedykt 'b3niup' Przybyło <b3niup@gmail.com>

pkgname=fackup
pkgver=0.2.0
pkgrel=1
pkgdesc="File backup tool using rsync and dar."
arch=('i686' 'x86_64')
url="https://github.com/b3niup/fackup"
license=('MIT')
depends=('dar' 'rsync' 'python-yaml')
makedepends=('python')
install="${pkgname}.install"
source=(https://files.pythonhosted.org/packages/71/d2/b105d949644b02d1cc22c343c3a505f3ef65d2ae30adca51cb39f861931a/${pkgname}-${pkgver}.tar.gz)
md5sums=('ddc7c31b45b201e5d44205003ebb2d30')

build() {
  true
}

package() {
  cd $srcdir/${pkgname}-${pkgver}
  python -m pip install . --prefix=/usr --root=$pkgdir
}
