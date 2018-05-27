# Maintainer: portaloffreedom

_pkgsrcname=fann2
pkgname=python-fann2
pkgver=1.1.2
pkgrel=2
pkgdesc="Fast Artificial Neural Network Library (FANN) Python bindings."
url="https://github.com/FutureLinkCorporation/fann2"
license=("LGPL2")
arch=("any")
depends=('python' 'fann>=2.2.0')
source=("https://pypi.python.org/packages/80/a1/fed455d25c34a62d4625254880f052502a49461a5dd1b80854387ae2b25f/$_pkgsrcname-$pkgver.tar.gz")
sha256sums=('cdca0a65ad48e08320672affe38c3dd4ea15e27821e5e1db9fa2b34299bdd41e')

package() {
  cd $srcdir/${_pkgsrcname}-$pkgver
  python3 setup.py install --root $pkgdir
}


