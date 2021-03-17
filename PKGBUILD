# Maintainer: Paul Irofti <paul@irofti.net>
_name=pytypes
pkgname="python-$_name"
pkgver=1.0b5
pkgrel=1
pkgdesc="typing toolbox w.r.t. PEP 484"
arch=('any')
url="https://github.com/Stewori/pytypes"
license=('Apache')
depends=('python')
makedepends=('python-setuptools-scm')
#source=("https://files.pythonhosted.org/packages/source/g/${_name}/${_name}-${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/ba/f9/6701f7cf163428aecad5bf607741bde295ae2b35bc631c60e668c6cd9c2d/pytypes-1.0b5.tar.gz")
sha256sums=('a28f6c7d01c91c9b4a81b4f9523cd0ce620edec3cd30bc389a34540ba3bd9de4')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set sw=2 et:
