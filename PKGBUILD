# Maintainer: Benedykt 'b3niup' Przybyło <b3niup@gmail.com>

pkgname=fackup
pkgver=0.1.3
pkgrel=1
pkgdesc="File backup tool using rsync and dar."
arch=('i686' 'x86_64')
url="https://github.com/b3niup/fackup"
license=('MIT')
depends=('dar' 'rsync' 'python-yaml')
makedepends=('python')
install="${pkgname}.install"
source=(https://pypi.python.org/packages/source/f/fackup/fackup-${pkgver}.tar.gz)
md5sums=('b5cb15452b77ff2969ef7c9d2d9b08f9')

build() {
  true
}

package() {
  cd $srcdir/${pkgname}-${pkgver}
  python setup.py install --prefix=/usr --root=$pkgdir
}
