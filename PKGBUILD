# Maintainer: M0Rf30

pkgname=python2-libbitcoinclient
pkgver=0.3.0
pkgrel=1
pkgdesc='Pure Python Obelisk + Bitcoin client side library'
arch=('any')
url='https://github.com/OpenBazaar/python-libbitcoinclient'
license=('AGPL')
depends=(python2-ecdsa python2-twisted python2-pyzmq)
makedepends=(python2-setuptools)
conflicts=(python2-obelisk)
replaces=(python2-obelisk)
source=("https://github.com/OpenBazaar/python-libbitcoinclient/archive/$pkgver.tar.gz")

package() {
  cd "$srcdir/python-libbitcoinclient-$pkgver"
  python2 setup.py install --root="$pkgdir" -O1
}

md5sums=('c7143ef7813c66e7e5768b8d889d0b5e')
