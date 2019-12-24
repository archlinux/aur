# Maintainer: vantu5z <vantu5z@mail.ru>
# Python package author: Mikhail Korobov <kmike84@gmail.com>

pkgname=python-dawg-python
pkgver=0.7.2
pkgrel=1
pkgdesc="Pure-python reader for DAWGs (DAFSAs) created by dawgdic C++ library or DAWG Python extension."
arch=(any)
url="https://github.com/kmike/DAWG-Python/"
license=(MIT)
makedepends=("python")
source=(https://github.com/pytries/DAWG-Python/archive/$pkgver.tar.gz)
md5sums=('daa23462f3cbfe47a7c240c1c4473c6c')

build()
  {
    cd "$srcdir/DAWG-Python-$pkgver"
    python setup.py build
  }

package()
  {
    cd "$srcdir/DAWG-Python-$pkgver"
    python setup.py install --root="$pkgdir/"
  }
