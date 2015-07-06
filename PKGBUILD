# Maintainer: Erik Johnson <palehose at gmail dot com>
pkgname=python2-pkcs1
pkgver=0.9.4
pkgrel=2
pkgdesc='Python implementation of RFC3447 (PKCS1 v2)'
url='http://pypi.python.org/pypi/pkcs1'
arch=('any')
license=('MIT')
depends=('python2')
optdepends=('python2-gmpy: improved performance for modular exponentiation')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/p/pkcs1/pkcs1-${pkgver}.tar.gz")
md5sums=('e2acfac44710a47c3f5e6540d84e9d15')

package() {
  cd "$srcdir/pkcs1-$pkgver"
  python2 setup.py install --root=$pkgdir/ --optimize=1
}

# vim:set ts=2 sw=2 et:
