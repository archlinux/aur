# Maintainer: Benedykt 'b3niup' Przybyło <b3niup@gmail.com>

pkgname=fackup
pkgver=0.1.3
pkgrel=2
pkgdesc="File backup tool using rsync and dar."
arch=('i686' 'x86_64')
url="https://github.com/b3niup/fackup"
license=('MIT')
depends=('dar' 'rsync' 'python-yaml')
makedepends=('python')
install="${pkgname}.install"
source=(https://pypi.python.org/packages/f1/28/3b2b7b2786feb42d9a2a15b5e2d4d068394ab601255a94bf51c544a23a46/fackup-${pkgver}.tar.gz)
md5sums=('b5cb15452b77ff2969ef7c9d2d9b08f9')

build() {
  true
}

package() {
  cd $srcdir/${pkgname}-${pkgver}
  python setup.py install --prefix=/usr --root=$pkgdir
}
