# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-gs-quant
_pkgname=gs_quant
pkgver=0.8.96
pkgrel=1
pkgdesc="A python toolkit for quantitative finance developped at Goldman Sachs"
arch=('any')
url="https://developer.gs.com/discover/products/gs-quant"
license=('Apache')
depends=('python' 'python-backoff' 'python-cachetools' 'python-funcsigs' 'python-inflection' 'python-msgpack' 'python-pandas' 'python-requests' 'python-scipy')
optdepends=()
makedepends=('python-setuptools')
checkdepends=('python-testfixtures' 'python-pytest' 'python-pytest-mock')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('f87b8e1396b685fdc8f2255efc0c9a139f80de25cfec4fb4150b9e0c01f2af75')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

#check() {
  #cd "${srcdir}/$_pkgname-$pkgver"
  #pytest gs_quant/test
#}
## vim:ts=2:sw=2:et:
