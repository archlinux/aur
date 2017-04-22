# Maintainer: Yardena Cohen <yardenack@gmail.com>

pkgname=python-simple-crypt
pkgver=4.1.7
pkgrel=1.1
arch=('any')
license=('custom')
pkgdesc="Simple, secure encryption and decryption for Python 3"
url="https://pypi.python.org/pypi/simple-crypt"
makedepends=('python-distribute')
depends=('python-crypto')
source=("https://pypi.python.org/packages/source/s/simple-crypt/simple-crypt-$pkgver.tar.gz")
md5sums=('dc2b13ce6be9c9da08fb1e7d83498882')

build() {
  cd "$srcdir/simple-crypt-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/simple-crypt-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}
