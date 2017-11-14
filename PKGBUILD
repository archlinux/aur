# Maintainer: Yardena Cohen <yardenack@gmail.com>

pkgname=python-simple-crypt
pkgver=4.1.7
pkgrel=1
arch=('any')
license=('custom')
pkgdesc="Simple, secure encryption and decryption for Python 3"
url="https://pypi.python.org/pypi/simple-crypt"
makedepends=('python-distribute')
depends=('python-crypto')
source=("https://pypi.python.org/packages/source/s/simple-crypt/simple-crypt-$pkgver.tar.gz")
md5sums=('dc2b13ce6be9c9da08fb1e7d83498882')
sha256sums=("49462ab7ea4b080a8c10e362abfe35ecfa6dbe1e1c454ea36de7d2a71dce992f")
sha512sums=("31d71f4b346dca8d0680d0684e88a6b97803723fac7326383a94b16dee21f791dfcfcb22e1f8f7b655dd8edbb759893da66cf24ea0bdc2fdc95e5af2cc4b453b")

build() {
  cd "$srcdir/simple-crypt-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/simple-crypt-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}
