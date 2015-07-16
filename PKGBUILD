# Maintainer: Benedykt 'b3niup' Przybyło <b3niup@gmail.com>

pkgname=fackup
pkgver=0.1.2
pkgrel=1
pkgdesc="File backup tool using rsync and dar."
arch=('i686' 'x86_64')
url="https://github.com/b3niup/fackup"
license=('MIT')
depends=('dar' 'rsync' 'python-yaml')
makedepends=('python')
install="${pkgname}.install"
source=(https://pypi.python.org/packages/source/f/fackup/fackup-${pkgver}.tar.gz)
md5sums=('5e14b693683b4f92071882a29950fdc3')

build() {
  true
}

package() {
  cd $srcdir/${pkgname}-${pkgver}
  python setup.py install --prefix=/usr --root=$pkgdir
}
