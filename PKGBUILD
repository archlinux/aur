# Maintainer: Markus Kaiser <markus dot kaiser at in dot tum dot de>
_pkgname=param
pkgname=python-$_pkgname
pkgver=1.5.1
pkgrel=1
pkgdesc="Declarative Python programming using Parameters"
arch=("any")
url="https://ioam.github.io/param/"
license=('BSD')
depends=()
options=(!emptydirs)
source=("https://pypi.python.org/packages/0e/df/3e8f25141ff084505318aa6647224536c75813a2370d4f8aec957fbf08e7/param-1.5.1.tar.gz")
md5sums=('2a8ac0e86eb20431cf8fd203af0a3709')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
