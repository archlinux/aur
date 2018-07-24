# Maintainer: Markus Kaiser <markus dot kaiser at in dot tum dot de>
_pkgname=param
pkgname=python-$_pkgname
pkgver=1.7.0
pkgrel=1
pkgdesc="Declarative Python programming using Parameters"
arch=("any")
url="https://ioam.github.io/param/"
license=('BSD')
depends=()
options=(!emptydirs)
source=('https://files.pythonhosted.org/packages/ec/8f/58da87aeb095886bfb0bb1901c256d9d9e50ad4fce68ed6280da21cebff5/param-1.7.0.tar.gz')
sha256sums=('02307e39323ec7c01aa8874e6512e67e441037a1527196fe4f1c4b00f931cae7')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
