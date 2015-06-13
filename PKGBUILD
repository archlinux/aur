# Maintainer: shmilee <shmilee.zju@gmail.com>

pkgname=plyvel
pkgver=0.9
pkgrel=1
pkgdesc="Plyvel, a fast and feature-rich Python interface to LevelDB"
arch=('i686' 'x86_64')
url="https://github.com/wbolster/plyvel"
license=('BSD')
depends=('python' 'leveldb')
makedepends=('cython' 'python-setuptools')
source=(https://github.com/wbolster/plyvel/archive/${pkgver}.tar.gz)
md5sums=('f507bcdb8a8187bf75deb22f000695fa')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
}
