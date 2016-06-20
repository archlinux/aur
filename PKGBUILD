# Maintainer: nic96
pkgname=python2-leveldb_mcpe
pkgver=1.8
pkgrel=2
pkgdesc="A python wrapper for leveldb_mcpe"
arch=("any")
url="https://github.com/Mojang/leveldb-mcpe"
license=('BSD')
depends=('leveldb-mcpe')
makedepends=('python2' 'python2-setuptools' 'boost')
source=(setup.py
       leveldb_mcpe.cpp)

md5sums=('f8a2813ef64b7a06629f0d8e50bc35fd'
         'a9b6fcc1a582507045d87348e31f8ecb')

build() {
  cd "$srcdir"
  python2 setup.py build
}

package() {
  cd "$srcdir"
  python2 setup.py install --root=/$pkgdir/ --optimize=1
}
