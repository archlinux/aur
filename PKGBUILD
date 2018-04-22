# Maintainer: Markus Kaiser <markus dot kaiser at in dot tum dot de>
_pkgname=param
pkgname=python-$_pkgname
pkgver=1.6.0
pkgrel=1
pkgdesc="Declarative Python programming using Parameters"
arch=("any")
url="https://ioam.github.io/param/"
license=('BSD')
depends=()
options=(!emptydirs)
source=('https://files.pythonhosted.org/packages/af/85/315c12c98aa0d484f0f08a3018409c36878933a08586d309be4a3ff88f9c/param-1.6.0.tar.gz')
sha256sums=('6d98e093df457d1b2db849fb911d33b67c47551f09521aa40b938ebc836b29db')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
