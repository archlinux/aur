# Maintainer: Immae <ismael.bouya@normalesup.org>

pkgname=python-pybtex
pkgver=0.21
pkgrel=1
pkgdesc="A BibTeX-compatible bibliography processor in Python"
arch=('any')
url="http://pybtex.org/"
license=('GPL')
depends=('python')
makedepends=('python-setuptools')
source=(https://pypi.python.org/packages/82/59/d46b4a84faacd7c419cfc9a442b7940d6d625d127b83d83666e2a8b203d8/pybtex-${pkgver}.tar.gz)

build() {
  cd "$srcdir/pybtex-${pkgver}"
  python setup.py build
}

package(){
  cd "$srcdir/pybtex-${pkgver}"
  python setup.py install --root="${pkgdir}"
}

md5sums=('e7b320b2bcb34c664c4385533a2ea831')
