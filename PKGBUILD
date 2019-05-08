# Maintainer: Markus Kaiser <markus dot kaiser at in dot tum dot de>
_pkgname=param
pkgname=python-$_pkgname
pkgver=1.9.0
pkgrel=1
pkgdesc="Declarative Python programming using Parameters"
arch=("any")
url="https://ioam.github.io/param/"
license=('BSD')
depends=()
options=(!emptydirs)
source=('https://files.pythonhosted.org/packages/5e/d9/9e9d3c9b0cad8af40822527e55f8822808e3480b86488acdfe6d71f31a23/param-1.9.0.tar.gz')
sha256sums=('e2036985ba10e117ffb3ad59ac91e718b74f4fe962b5620eae6673ec390550dd')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
