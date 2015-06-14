# Maintainer: Immae <ismael.bouya@normalesup.org>

pkgname=python-pybtex
pkgver=0.18
pkgrel=1
pkgdesc="A BibTeX-compatible bibliography processor in Python"
arch=('any')
url="http://pybtex.org/"
license=('GPL')
depends=('python')
makedepends=('python-setuptools')
source=(http://pypi.python.org/packages/source/p/pybtex/pybtex-${pkgver}.tar.bz2)

build() {
  cd "$srcdir/pybtex-${pkgver}"
  python setup.py build
}

package(){
  cd "$srcdir/pybtex-${pkgver}"
  python setup.py install --root="${pkgdir}"
}

md5sums=('306457c18eb861ec3f644a7e2df98ae4')
