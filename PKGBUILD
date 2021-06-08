# Maintainer: Erik Johnson <palehose at gmail dot com>
pkgname=python2-pkcs1
pkgver=0.9.6
pkgrel=1
pkgdesc='Python implementation of RFC3447 (PKCS1 v2)'
url='http://pypi.python.org/pypi/pkcs1'
arch=('any')
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
optdepends=('python2-gmpy: improved performance for modular exponentiation')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/9b/5b/1b712194fb29d2a8f4696197c23ec5d7f2be9a3d7f47e5b2ba626fa27eaf/pkcs1-${pkgver}.tar.gz")
sha256sums=('084ff680b5e82b1e1d89785657ad206435306f3d66c94db118ae9aebd4e24abe')

package() {
  cd "$srcdir/pkcs1-$pkgver"
  python2 setup.py install --root=$pkgdir/ --optimize=1
}

# vim:set ts=2 sw=2 et:
